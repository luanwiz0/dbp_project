package controller.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.product.ManageProductController;
import controller.user.UserSessionUtils;
import model.CartItem;
import model.Customer;
import model.LineItem;
import model.Orders;
import model.service.CartManager;
import model.service.OrderManager;
import model.service.UserManager;


public class OrderController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(OrderController.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CartManager manager = CartManager.getInstance();
		UserManager userman = UserManager.getInstance();
		OrderManager orderman = OrderManager.getInstance();

		//고객 아이디 얻어오기
    	HttpSession session = request.getSession();
		String customerId = UserSessionUtils.getLoginUserId(session);
		
		// GET: 회원의 장바구니 정보 불러오기
		if(request.getMethod().equals("GET")) {
			log.debug("OrderForm Request"); 

			//String customerId = request.getParameter("customerId");
			List<CartItem> cartItemList = manager.getCartItemList(customerId);

			Customer customer = userman.findCustomer(customerId);
			request.setAttribute("cartItemList", cartItemList);
			request.setAttribute("customer", customer);

			return "/order/orderForm.jsp";
		}

		
		// Post: 주문 목록 생성해서 DB에 저장
		String receiveType = request.getParameter("receive");
		String receiverName = null;
		String receiverPhone = null;
		String receiverAddress = null;
		
		if(receiveType.equals("direct")) {
			receiverName = request.getParameter("name3");
			receiverPhone = request.getParameter("phone3");
			receiverAddress = userman.findCustomer(customerId).getAddress();
		}
		else { // receiveType == deliver
			receiverName = request.getParameter("name2");
			receiverPhone = request.getParameter("phone2");
			receiverAddress = request.getParameter("addr1") + request.getParameter("addr2") + request.getParameter("addr3");
		}
		
		Orders order = new Orders(
				0, // orderId
				customerId, 
				receiveType, receiverName, receiverPhone,
				"memo", // memo
				receiverAddress
			);
	
		List<CartItem> cartItemList = manager.getCartItemList(customerId);
		
		try {	
	        orderman.addOrder(order, cartItemList);
	        log.debug("Creat Order: " + order.toString());
	        return "redirect:/mypage/order";
	     }catch(Exception e) {
	        e.printStackTrace();
	     }

		return "redirect:/product/list?type=flower";
	}

}