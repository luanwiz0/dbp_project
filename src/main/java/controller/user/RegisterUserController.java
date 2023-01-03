package controller.user;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.Customer;
import model.service.ExistingUserException;
import model.service.UserManager;

public class RegisterUserController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(RegisterUserController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
       	if (request.getMethod().equals("GET")) {	
    		// GET request: 회원정보 등록 form 요청	
    		log.debug("RegisterForm Request");

    		//List<Community> commList = UserManager.getInstance().findCommunityList();	// 커뮤니티 리스트 검색
			//request.setAttribute("commList", commList);	
		
			return "/user/registerForm.jsp";   // 검색한 커뮤니티 리스트를 registerForm으로 전송     	
	    }	

		String user_phone1 = request.getParameter("phone1");
		String user_phone2 = request.getParameter("phone2");
		String user_phone3 = request.getParameter("phone3");
		String user_phonenum = user_phone1 + user_phone2 + user_phone3;
		
		String user_addr1 = request.getParameter("addr1");
		String user_addr2 = request.getParameter("addr2");
		String user_addr3 = request.getParameter("addr3");
		String user_address = user_addr1 + " " + user_addr2 + " " + user_addr3;	
		
    	// POST request (회원정보가 parameter로 전송됨)
       	Customer customer = new Customer (
			request.getParameter("customerId"),
			request.getParameter("pwd"),
			request.getParameter("name"),
			user_phonenum,
			request.getParameter("email"),
			user_address);
		
        log.debug("Create User : {}", customer);

		try {
			UserManager manager = UserManager.getInstance();
			manager.createCustomer(customer);
	        return "redirect:/user/list";	// 성공 시 사용자 리스트 화면으로 redirect
	        
		} catch (ExistingUserException e) {	// 예외 발생 시 회원가입 form으로 forwarding
            request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("customer", customer);
			return "/user/registerForm.jsp";
		}
    }
}
