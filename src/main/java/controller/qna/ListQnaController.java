package controller.qna;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.Qna;
import model.service.QnaManager;

public class ListQnaController implements Controller {
	// private static final int countPerPage = 100;	// 한 화면에 출력할 사용자 수

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
//		// 로그인 여부 확인
//    	if (!UserSessionUtils.hasLogined(request.getSession())) {
//            return "redirect:/user/login/form";		// login form 요청으로 redirect
//        }
//    	
    	/*
    	String currentPageStr = request.getParameter("currentPage");	
		int currentPage = 1;
		if (currentPageStr != null && !currentPageStr.equals("")) {
			currentPage = Integer.parseInt(currentPageStr);
		}		
    	*/
    	
		QnaManager manager = QnaManager.getInstance();
		List<Qna> qnaList = manager.findQnaList();
		// List<User> userList = manager.findUserList(currentPage, countPerPage);

		// qnaList 객체와 현재 로그인한 사용자 ID를 request에 저장하여 전달
		request.setAttribute("qnaList", qnaList);				
		request.setAttribute("curUserId", 
				UserSessionUtils.getLoginUserId(request.getSession()));		

		// 사용자 리스트 화면으로 이동(forwarding)
		return "/qna/list.jsp";        
    }
}
