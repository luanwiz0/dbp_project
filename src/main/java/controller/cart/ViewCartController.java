package controller.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.CartManager;
import model.CartItem;
import model.Customer;

public class ViewCartController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	// 로그인 여부 확인
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
    		return "redirect:/user/login/form";		// login form 요청으로 redirect
        }
    	
    	CartManager manager = CartManager.getInstance();
    	
    	//고객 아이디 얻어오기
    	HttpSession session = request.getSession();
		String customerId = UserSessionUtils.getLoginUserId(session);
		
		List<CartItem> cartItemList = manager.getCartItemList(customerId);

		request.setAttribute("cartItemList", cartItemList);
		request.setAttribute("customerId", customerId);		

		return "/cart/cart.jsp";
    }
}