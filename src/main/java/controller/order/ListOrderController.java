package controller.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Orders;
import model.service.OrderManager;

public class ListOrderController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		OrderManager manager = OrderManager.getInstance();
		List<Orders> orderList = manager.findOrderList();

		request.setAttribute("orderList", orderList);
		return "/order/orderForm.jsp";
	}

}