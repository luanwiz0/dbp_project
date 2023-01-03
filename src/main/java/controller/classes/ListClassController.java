package controller.classes;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.ClassInfo;
import model.service.ClassManager;

public class ListClassController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ClassManager manager = ClassManager.getInstatnce();
		
		List<ClassInfo> classList = manager.findClassList();
		request.setAttribute("classList", classList);
		return "/class/list.jsp";
	}

}