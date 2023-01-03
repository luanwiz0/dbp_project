package model.service;

import java.sql.SQLException;
import java.util.List;

import model.ClassInfo;
import model.dao.ClassDAO;

public class ClassManager {
	private static ClassManager classMan = new ClassManager();
	private ClassDAO classDAO;
	
	private ClassManager() {
		try {
			classDAO = new ClassDAO();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static ClassManager getInstatnce() {
		return classMan;
	}
	
	// 클래스 추가
	public int add(ClassInfo c) throws SQLException{
		return classDAO.add(c);
	}
	
	// 클래스 정보 수정
	public int update(ClassInfo c) throws SQLException{
		return classDAO.update(c);
	}
	
	// 클래스 삭제
	public int delete(int classId) throws SQLException{
		return classDAO.remove(classId);
	}
	
	// 전체 목록 조회
	public List<ClassInfo> findClassList() throws SQLException{
		return classDAO.findClassList();
	}
	
	// 클래스 1개에 대한 정보 조회
	public ClassInfo findClassInfo(int classId) throws SQLException{
		return classDAO.findClass(classId);
	}

}
