package controller.qna;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.Qna;
import model.service.QnaManager;

public class DeleteQnaController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(DeleteQnaController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		int deleteId = Integer.parseInt(request.getParameter("qnaId"));
		String userId = request.getParameter("customerId");
    	log.debug("Delete Qna : {}", deleteId);

		QnaManager manager = QnaManager.getInstance();		
		HttpSession session = request.getSession();	
	
		if ((UserSessionUtils.isLoginUser("admin", session) && 	// 로그인한 사용자가 관리자이고 	
			 !userId.equals("admin"))							// 삭제 대상이 일반 사용자인 경우, 
			   || 												// 또는 
			(!UserSessionUtils.isLoginUser("admin", session) &&  // 로그인한 사용자가 관리자가 아니고 
			  UserSessionUtils.isLoginUser(userId, session))) { // 로그인한 사용자가 삭제 대상인 경우 (자기 자신을 삭제)
				
			manager.removeQna(deleteId);				// 사용자 정보 삭제
			if (UserSessionUtils.isLoginUser("admin", session))	// 로그인한 사용자가 관리자 	
				return "redirect:/qna/list";		// 사용자 리스트로 이동
			else 									// 로그인한 사용자는 이미 삭제됨
				return "redirect:/qna/list";		// logout 처리
		}
		
		/* 삭제가 불가능한 경우 */
		Qna qna = manager.findQna(deleteId);	// 사용자 정보 검색
		request.setAttribute("qna", qna);						
		request.setAttribute("deleteFailed", true);
		String msg = (UserSessionUtils.isLoginUser("admin", session)) 
				   ? "시스템 관리자 정보는 삭제할 수 없습니다."		
				   : "타인의 정보는 삭제할 수 없습니다.";													
		request.setAttribute("exception", new IllegalStateException(msg));            
		return "/qna/view.jsp";		// 사용자 보기 화면으로 이동 (forwarding)	
	}
}
