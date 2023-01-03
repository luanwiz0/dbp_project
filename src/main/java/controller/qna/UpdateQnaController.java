package controller.qna;

import java.util.List;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.service.QnaManager;
import model.Qna;

public class UpdateQnaController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(UpdateQnaController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
 
    	if (request.getMethod().equals("GET")) {	
    		// GET request: 회원정보 수정 form 요청	
    		// 원래는 UpdateUserFormController가 처리하던 작업을 여기서 수행
    		int updateId = Integer.parseInt(request.getParameter("qnaId"));
    		String userId = request.getParameter("customerId");

    		log.debug("UpdateForm Request : {}", updateId);
    		
    		QnaManager manager = QnaManager.getInstance();
    		Qna qna = manager.findQna(updateId);	// 수정하려는 사용자 정보 검색
			request.setAttribute("qna", qna);			

			HttpSession session = request.getSession();
			if (UserSessionUtils.isLoginUser(userId, session) ||
				UserSessionUtils.isLoginUser("admin", session)) {
				// 현재 로그인한 사용자가 수정 대상 사용자이거나 관리자인 경우 -> 수정 가능
								
				return "/qna/updateForm.jsp";   // 검색한 사용자 정보 및 커뮤니티 리스트를 updateForm으로 전송     
			}    
			
			// else (수정 불가능한 경우) 사용자 보기 화면으로 오류 메세지를 전달
			request.setAttribute("updateFailed", true);
			request.setAttribute("exception", 
					new IllegalStateException("타인의 정보는 수정할 수 없습니다."));            
			return "/qna/view.jsp";	// 사용자 보기 화면으로 이동 (forwarding)
	    }	
    	
    	// POST request (회원정보가 parameter로 전송됨)
    	Qna updateQna = new Qna(
           	Integer.parseInt(request.getParameter("qnaId")),
    		request.getParameter("title"),
    		request.getParameter("content"),
    		request.getParameter("creationDate"),
    		Integer.parseInt(request.getParameter("viewCount")),
    		request.getParameter("pwd"),
    		request.getParameter("customerId"),
    		Integer.parseInt(request.getParameter("productId")),
    		Integer.parseInt(request.getParameter("ref")),
    		Integer.parseInt(request.getParameter("restep")),
    		Integer.parseInt(request.getParameter("relevel")));

    	log.debug("Update Qna : {}", updateQna);

    	QnaManager manager = QnaManager.getInstance();
		manager.updateQna(updateQna);			
        return "redirect:/user/list";			
    }
}