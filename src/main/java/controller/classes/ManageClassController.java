package controller.classes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.product.ManageProductController;
import controller.user.UserSessionUtils;
import model.ClassInfo;
import model.Product;
import model.service.ClassManager;

public class ManageClassController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(ManageProductController.class);
	public static final String USER_SESSION_KEY = "userId";

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 로그인 여부 확인
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
    		return "redirect:/user/login/form";		// login form 요청으로 redirect
        }
    	
		ClassManager manager = ClassManager.getInstatnce();
		
		// 추가
		if(request.getServletPath().equals("/class/add")) {
					
			// GET: form 요청
			if(request.getMethod().equals("GET")) {
				log.debug("ClassAddForm Request");
				return "/class/addForm.jsp";
			}
					
			// POST: 상품 추가 (상품정보가 parameter로 전송됨)
			ClassInfo classInfo = new ClassInfo(
				0, // classId
				request.getParameter("name"),
				request.getParameter("date"),
				Integer.parseInt(request.getParameter("maxNum")),
				0 // currentNum
			);
					
//			HttpSession session = request.getSession();
//			classInfo.setSellerId((String)session.getAttribute(USER_SESSION_KEY));
			classInfo.setSellerId("seller0"); // 테스트를 위해 임시로 판매자 id 지정
				
			try {
				manager.add(classInfo);
				log.debug("Create Class: " + classInfo.toString());
				return "redirect:/class/list";
				}catch(Exception e) {
					e.printStackTrace();
					return "/class/addForm.jsp";
				}
			}
			
			
			// 수정
			else if(request.getServletPath().equals("/class/update")) {
				
				// GET: 상품 정보 수정 form 요청
				if(request.getMethod().equals("GET")) {
					int updateId = Integer.parseInt(request.getParameter("classId"));
					ClassInfo classInfo = manager.findClassInfo(updateId);
					classInfo.setDate(classInfo.getDate().split(" ")[0]);
					// 여기에 해당 상품의 판매자인지 확인하는 코드 추가: if문으로 감싸기 
					request.setAttribute("classInfo", classInfo);
					return "/class/updateForm.jsp";
					
					// 수정이 불가능할 경우 /product/list로 이동
					// IllegalStateException
				}
				
				// POST: 상품 수정 (상품정보가 parameter로 전송됨)
				ClassInfo classInfo = new ClassInfo(
						Integer.parseInt(request.getParameter("classId")),
						request.getParameter("name"),
						request.getParameter("date"),
						Integer.parseInt(request.getParameter("maxNum")),
						Integer.parseInt(request.getParameter("currentNum")),
						request.getParameter("sellerId")
					);
				
				manager.update(classInfo);
				log.debug("Update Class: " + classInfo.toString());
				return "redirect:/class/list";
			}
			
			
			// 삭제
			else {
				int deleteId = Integer.parseInt(request.getParameter("classId"));
				
				// 해당 상품의 판매자인지 확인하는 코드 추가
				manager.delete(deleteId);
			}
		return "redirect:/class/list";
	}
}
