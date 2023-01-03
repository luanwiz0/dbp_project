package model.service;

import java.sql.SQLException;


import java.util.List;

import model.Qna;
import model.dao.QnaDAO;

/**
 * 사용자 관리 API를 사용하는 개발자들이 직접 접근하게 되는 클래스.
 * UserDAO를 이용하여 데이터베이스에 데이터 조작 작업이 가능하도록 하며,
 * 데이터베이스의 데이터들을 이용하여 비지니스 로직을 수행하는 역할을 한다.
 * 비지니스 로직이 복잡한 경우에는 비지니스 로직만을 전담하는 클래스를 
 * 별도로 둘 수 있다.
 */
public class QnaManager {
	private static QnaManager qnaMan = new QnaManager();
	private QnaDAO qnaDAO;

	private QnaManager() {
		try {
			qnaDAO = new QnaDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static QnaManager getInstance() {
		return qnaMan;
	}
	
	public int createQna(Qna qna) throws SQLException {
		return qnaDAO.createQna(qna);
	}

	public int updateQna(Qna qna) throws SQLException, QnaNotFoundException {
		return qnaDAO.updateQna(qna);
	}	

	public int removeQna(int qnaId) throws SQLException, QnaNotFoundException {
		return qnaDAO.removeQna(qnaId);
	}

	public Qna findQna(int qnaId)
		throws SQLException, QnaNotFoundException {
		Qna qna = qnaDAO.findQna(qnaId);
		
		if (qna == null) {
			throw new QnaNotFoundException(qnaId + "는 존재하지 않는 아이디입니다.");
		}		
		return qna;
	}

	public List<Qna> findQnaList() throws SQLException {
			return qnaDAO.findQnaList();
	}
	
	public List<Qna> findQnaList(int currentPage, int countPerPage)
		throws SQLException {
		return qnaDAO.findQnaList(currentPage, countPerPage);
	}

	public QnaDAO getQnaDAO() {
		return this.qnaDAO;
	}
}
