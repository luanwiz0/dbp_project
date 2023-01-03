package model.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.ClassInfo; // 이후 도메인 클래스로 변경
import model.Product;

public class ClassDAO {
	private JDBCUtil jdbcUtil = null;

	public ClassDAO() {
		jdbcUtil = new JDBCUtil();
	} 
	
	// 클래스 추가
	public int add(ClassInfo c) {
		String query = "insert into class(classId, sellerId, name, classDate, maxNum, currentNum) values(Sequence_class.nextVal, ?, ?, ?, ?, ?)";
		Object[] param = new Object[] {c.getSellerId(), c.getName(), c.getDate(), c.getMaxNum(), c.getCurrentNum()};
		jdbcUtil.setSqlAndParameters(query, param);
		String key[] = {"classId"};
		
		try {
			int result = jdbcUtil.executeUpdate(key);
			ResultSet rs = jdbcUtil.getGeneratedKeys();
			if(rs.next()) {
				int generatedKey = rs.getInt(1);
				c.setClassId(generatedKey);
			}
			return result;
		} catch (Exception e) {
			jdbcUtil.rollback();
			e.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		return 0; 
	}
	
	// 클래스 정보 수정
	public int update(ClassInfo c) {
		String query = "update class set sellerId = ?, name = ?, classDate = ?, maxNum = ?, currentNum = ? where classId = ?";
		Object[] param = new Object[] {c.getSellerId(), c.getName(), c.getDate(), c.getMaxNum(), c.getCurrentNum(), c.getClassId()};
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			int result = jdbcUtil.executeUpdate();
			return result;
		}catch(Exception e) {
			jdbcUtil.rollback();
			e.printStackTrace();
		}finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		return 0; // 성공적으로 수행된 개수 반환
	}
	
	// 클래스 삭제
	public int remove(int classId) {
		String query = "delete from class where classId = ?";
		jdbcUtil.setSqlAndParameters(query, new Object[] {classId});
		
		try {
			int result = jdbcUtil.executeUpdate();
			return result;
		}catch(Exception e) {
			jdbcUtil.rollback();
			e.printStackTrace();
		}finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		return 0; // 성공적으로 수행된 개수 반환
	}
	
	// 전체 목록 조회
	public List<ClassInfo> findClassList(){
		String query = "select * from class";
		jdbcUtil.setSqlAndParameters(query, null);
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			List<ClassInfo> classList = new ArrayList<>();
			
			while(rs.next()) {
				ClassInfo c = new ClassInfo(
						rs.getInt("classId"),
						rs.getString("name"),
						rs.getString("classDate"),
						rs.getInt("maxNum"),
						rs.getInt("currentNum"),
						rs.getString("sellerId"));
				classList.add(c);
			}
			return classList;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			jdbcUtil.close();
		}
		return null;
	}
	
	// 상세 조회
	public ClassInfo findClass(int classId) {
		String query = "select * from class where classId = ?";
		jdbcUtil.setSqlAndParameters(query, new Object[] {classId});
		ClassInfo c = null;
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			
			if(rs.next()) {
				c = new ClassInfo(
						classId,
						rs.getString("name"),
						rs.getString("classdate"),
						rs.getInt("maxNum"),
						rs.getInt("currentNum"),
						rs.getString("sellerId"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			jdbcUtil.close();
		}
		return c;
	}
}
