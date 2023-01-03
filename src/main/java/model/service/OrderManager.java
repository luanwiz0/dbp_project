package model.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.CartItem;
import model.LineItem;
import model.Orders;
import model.dao.OrderDAO;

public class OrderManager extends Exception{
		private static OrderManager orderMan = new OrderManager();
		private OrderDAO orderDAO;

		private OrderManager() { 
			try {
				orderDAO = new OrderDAO();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

		public static OrderManager getInstance() {
			return orderMan;
		}
		//주문 목록 조회(모든)
	   public List<Orders> findOrderList() throws SQLException{
	    return orderDAO.findOrderList();
	   }
	   
	   //주문 목록 조회(고객 1명에 대한)
	   public List<Orders> findOrderList(String customerId) throws SQLException{
		   return orderDAO.findOrderList(customerId);
	   }
	      
	   //주문 상세 조회(mypage 주문 클릭 시 해당 상품 주문 내용 확인)
	   public List<LineItem> findOrder(int orderId) throws SQLException {
	    return orderDAO.findOrder(orderId);
		}

	   //주문 내역 저장
	   public int addOrder(Orders order, List<CartItem> cartItemList) throws SQLException{
		return orderDAO.addOrder(order, cartItemList);
	   }   
}