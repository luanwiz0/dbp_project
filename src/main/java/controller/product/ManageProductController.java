package controller.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Product;
import model.service.ProductManager;

public class ManageProductController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(ManageProductController.class);
	public static final String USER_SESSION_KEY = "userId";
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 로그인 여부 확인
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
    		return "redirect:/user/login/form";		// login form 요청으로 redirect
        }
    	
		ProductManager manager = ProductManager.getInstance();
		
		// 추가
		if(request.getServletPath().equals("/product/add")) {
			
			// GET: 상품 정보 추가 form 요청
			if(request.getMethod().equals("GET")) {
				log.debug("ProductAddForm Request");
				return "/product/addForm.jsp";
			}
			
			// POST: 상품 추가 (상품정보가 parameter로 전송됨)
			Product product = new Product(
				0, // productId
				request.getParameter("name"),
				Integer.parseInt(request.getParameter("price")),
				request.getParameter("description"),
				request.getParameter("type"),
				request.getParameter("category"));
			
//			HttpSession session = request.getSession();
//			product.setSellerId((String)session.getAttribute(USER_SESSION_KEY));
			product.setSellerId("seller0"); // 테스트를 위해 임시로 판매자 id 지정
			
			try {
				manager.add(product);
				log.debug("Create Product: " + product.toString());
				return "redirect:/product/list?type=" + request.getParameter("type");
			}catch(Exception e) {
				e.printStackTrace();
				return "/product/addForm.jsp";
			}
		}
		
		
		// 수정
		else if(request.getServletPath().equals("/product/update")) {
			
			// GET: 상품 정보 수정 form 요청
			if(request.getMethod().equals("GET")) {
				int updateId = Integer.parseInt(request.getParameter("productId"));
				Product product = manager.findProduct(updateId);
				log.debug("ProductUpdateForm Request");
				
				// 여기에 해당 상품의 판매자인지 확인하는 코드 추가: if문으로 감싸기 
				request.setAttribute("product", product);
				return "/product/updateForm.jsp";
				
				// 수정이 불가능할 경우 /product/list로 이동
				// IllegalStateException
			}
			
			// POST: 상품 수정 (상품정보가 parameter로 전송됨)
			Product product = new Product(
				Integer.parseInt(request.getParameter("productId")),
				request.getParameter("name"),
				Integer.parseInt(request.getParameter("price")),
				request.getParameter("description"),
				request.getParameter("type"),
				request.getParameter("category"),
				request.getParameter("sellerId"));
			
			manager.update(product);
			log.debug("Update Product: " + product.toString());
			return "redirect:/product/list?type=" + request.getParameter("type");
		}
		
		
		// 삭제
		else {
			int deleteId = Integer.parseInt(request.getParameter("productId"));
			
			// 해당 상품의 판매자인지 확인하는 코드 추가
			manager.delete(deleteId);
		}
		return "redirect:/product/list?type=flower";
	}

}
