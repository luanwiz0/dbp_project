package controller.qna;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.QnaManager;
import model.service.QnaNotFoundException;
import model.Qna;

public class ViewQnaController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	// 로그인 여부 확인
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";		// login form 요청으로 redirect
        }
    	
    	QnaManager manager = QnaManager.getInstance();
		int qnaId = Integer.parseInt(request.getParameter("qnaId"));
		
		Qna qna = null;
		try {
			qna = manager.findQna(qnaId);	// 사용자 정보 검색
		} catch (QnaNotFoundException e) {				
	        return "redirect:/qna/list";
		}	
		
		request.setAttribute("qna", qna);		// 사용자 정보 저장				
		return "/qna/view.jsp";				// 사용자 보기 화면으로 이동
    }
}
