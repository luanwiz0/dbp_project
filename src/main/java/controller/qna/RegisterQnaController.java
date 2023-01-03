package controller.qna;

import java.util.List;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Qna;
import model.service.QnaManager;

public class RegisterQnaController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(RegisterQnaController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
       	if (request.getMethod().equals("GET")) {	
       		// 로그인 여부 확인
        	if (!UserSessionUtils.hasLogined(request.getSession())) {
        		return "redirect:/user/login/form";		// login form 요청으로 redirect
            }

    		log.debug("RegisterForm Request");
			return "/qna/registerForm.jsp";   // 검색한 커뮤니티 리스트를 registerForm으로 전송     	
	    }	


    	// POST request (회원정보가 parameter로 전송됨)
       	
       	//고객 아이디 얻어오기
    	HttpSession session = request.getSession();
		String customerId = UserSessionUtils.getLoginUserId(session);
       	Qna qna = new Qna (
       		0, // qnaId
			request.getParameter("title"),
			request.getParameter("content"),
			null, // creationDate
			0, // viewCount
			request.getParameter("pwd"),
			customerId,
			0, 0, 0, 0);

		QnaManager manager = QnaManager.getInstance();
		manager.createQna(qna);
		log.debug("Create Qna : {}", qna);
	    return "redirect:/qna/list";	// 성공 시 사용자 리스트 화면으로 redirect
    }
}

