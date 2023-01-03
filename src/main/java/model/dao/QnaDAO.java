package model.dao;

import java.sql.ResultSet;




import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Qna;

public class QnaDAO {
	private JDBCUtil jdbcUtil = null;
	
	public QnaDAO() {			
		jdbcUtil = new JDBCUtil();
	}
		

	
	// 글 쓰기
	public int createQna(Qna qna) throws SQLException {

		String sql = "INSERT INTO qna (qnaId, title, content, creationDate, viewCount, pwd, customerId, productId, ref, reStep, reLevel) "
				+ "VALUES (SEQUENCE_QNA.NEXTVAL, ?, ?, SYSDATE, 0, ?, ?, 1, 0, 0, 0)";		
		Object[] param = new Object[] {qna.getTitle(), qna.getContent(), qna.getPwd(), qna.getCustomerId()};				
		jdbcUtil.setSqlAndParameters(sql, param);
		String key[] = {"qnaId"};
						
		try {				
			int result = jdbcUtil.executeUpdate(key);
			ResultSet rs = jdbcUtil.getGeneratedKeys();
			if(rs.next()) {
				int generatedKey = rs.getInt(1);
				qna.setQnaId(generatedKey);
			}
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();
		}		
		return 0;			
	}
	
	// Customer 회원 정보 수정
	public int updateQna(Qna qna) throws SQLException {
		String sql = "UPDATE qna "
					+ "SET title=?, customerId=?, creationDate=SYSDATE, content=?, pwd=? "
					+ "WHERE qnaId=?";
		Object[] param = new Object[] {qna.getTitle(), qna.getCustomerId(), 
									qna.getContent(), qna.getPwd(), qna.getQnaId()};				
		jdbcUtil.setSqlAndParameters(sql, param);
		
		try {				
			int result = jdbcUtil.executeUpdate();
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}		
		return 0;
	}

	// Customer 회원 탈퇴
	public int removeQna(int qnaId) throws SQLException {
		String sql = "DELETE FROM qna WHERE qnaId=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {qnaId});
		
		try {				
			int result = jdbcUtil.executeUpdate();
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}		
		return 0;
	}


	// Customer 회원 상세 조회
	public Qna findQna(int qnaId) throws SQLException {
		String sql1 = "UPDATE qna SET viewCount=viewCount+1 WHERE qnaId=?";
		jdbcUtil.setSqlAndParameters(sql1, new Object[] {qnaId});
        String sql2 = "SELECT * FROM qna WHERE qnaId=? ORDER BY qnaId DESC";              
		jdbcUtil.setSqlAndParameters(sql2, new Object[] {qnaId});

		try {
			ResultSet rs = jdbcUtil.executeQuery();
			if (rs.next()) {
				Qna qna = new Qna(
					rs.getString("creationDate"),
					rs.getInt("viewCount"),
					rs.getString("title"),
					rs.getString("content"));
				return qna;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
		return null;
	}
	
	// Customer 회원 목록 조회 - 테이블 전체를 List로 반환
	public List<Qna> findQnaList() throws SQLException {
        String sql = "SELECT * FROM qna ORDER BY ref DESC, restep ASC";
		jdbcUtil.setSqlAndParameters(sql, null);
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();		
			List<Qna> qnaList = new ArrayList<Qna>();
			while (rs.next()) {
				Qna qna = new Qna(
					rs.getInt("qnaId"),
					rs.getString("title"),
					rs.getString("customerId"),
					rs.getString("creationDate"),
					rs.getInt("viewCount"));
				qnaList.add(qna);
			}		
			return qnaList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
		return null;
	}
	
	// Customer 회원 목록 조회 - 테이블 전체를 List로 반환 (현재 페이지, 페이지당 출력할 사용자 수)
	public List<Qna> findQnaList(int currentPage, int countPerPage) throws SQLException {
		String sql = "SELECT * FROM qna ORDER BY ref DESC, restep ASC";
		jdbcUtil.setSqlAndParameters(sql, null, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);						
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			int start = ((currentPage-1) * countPerPage) + 1;
			
			if ((start >= 0) && rs.absolute(start)) {
				List<Qna> qnaList = new ArrayList<Qna>();
				
				do {
					Qna qna = new Qna(
							rs.getInt("qnaId"),
							rs.getString("title"),
							rs.getString("customerId"),
							rs.getString("creationDate"),
							rs.getInt("viewCount"));
					qnaList.add(qna);
				} while ((rs.next()) && (--countPerPage > 0));		
				
				return qnaList;							
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
		return null;
	}
}
