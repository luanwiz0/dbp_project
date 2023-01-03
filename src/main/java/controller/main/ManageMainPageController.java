package controller.main;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import controller.Controller;


public class ManageMainPageController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	if (request.getServletPath().equals("/main/store")) {
    		return "/main/store.jsp";
    	}
    	else if (request.getServletPath().equals("/main/view")) {
    		return "/main/main.jsp";
    	}
    	return "/main/main.jsp";
    }
}