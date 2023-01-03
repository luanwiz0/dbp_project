package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.CartItem;
import model.LineItem;
import model.Orders;
import model.Product;

public class OrderDAO {
   private JDBCUtil jdbcUtil = null;
   
   public OrderDAO() {
      jdbcUtil = new JDBCUtil();
   }
   
   // 전체 주문 목록 조회
   public List<Orders> findOrderList() throws SQLException{
      String query = "SELECT * FROM orders ORDER BY orderId";
      
      jdbcUtil.setSqlAndParameters(query, null);
      
      try {
         ResultSet rs = jdbcUtil.executeQuery();
         List<Orders> orderList = new ArrayList<Orders>();
         
         while(rs.next()) {
            Orders order = new Orders(
                  rs.getInt("orderId"),
                  rs.getString("customerId"),
                  rs.getDate("creationDate"),
                  rs.getString("receiveType"),
                  rs.getString("receiverName"),
                  rs.getString("receiverPhone"),
                  rs.getString("memo"),
                  rs.getString("receiverAddress"));
            orderList.add(order);
            
            System.out.println(order.toString());
         }
         return orderList;
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         jdbcUtil.close();
      }
      return null;
   }
   
   // 특정 고객의 주문 목록 조회
   public List<Orders> findOrderList(String customerId) throws SQLException{
      String query = "SELECT * FROM orders WHERE customerId = ? ORDER BY orderId";
      Object[] param = new Object[] {customerId};
      
      jdbcUtil.setSqlAndParameters(query, param);
      
      try {
         ResultSet rs = jdbcUtil.executeQuery();
         List<Orders> orderList = new ArrayList<Orders>();
         
         while(rs.next()) {
            Orders order = new Orders(
                  rs.getInt("orderId"),
                  customerId,
                  rs.getDate("creationDate"),
                  rs.getString("receiveType"),
                  rs.getString("receiverName"),
                  rs.getString("receiverPhone"),
                  rs.getString("memo"),
                  rs.getString("receiverAddress"));
            orderList.add(order);
            
            System.out.println(order.getCustomerId());
            System.out.println(order.toString());
         }
         return orderList;
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         jdbcUtil.close();
      }
      return null;
   }
   
   // 주문 상세 조회(mypage 주문 클릭 시 해당 상품 주문 내용 확인)
   public List<LineItem> findOrder(int orderId) throws SQLException {
       String query = "SELECT * FROM lineItem WHERE orderId = ?";
       Object[] param = new Object[] {orderId};
		jdbcUtil.setSqlAndParameters(query, param);
		List<LineItem> lineItemList = new ArrayList<>();
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			while (rs.next()) {
				LineItem lineItem = new LineItem(
					rs.getString("lineItemId"),
					orderId,
					rs.getInt("productId"),					
					rs.getInt("quantity"),
					rs.getInt("price"));
				System.out.println(lineItem.toString());
				lineItemList.add(lineItem);
			}
			return lineItemList;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
		return null;
	}
   
   // 주문 내역 저장
   public int addOrder(Orders order, List<CartItem> cartItemList) throws SQLException{
	   // order
	   String query1 = "INSERT INTO orders (orderId, customerId, creationDate, receiveType, receiverName, receiverPhone, memo, receiverAddress) "
	   		+ "VALUES (Sequence_order.nextVal, ?, SYSDATE, ?, ?, ?, ?, ?)";
	   Object[] param1 = new Object[] {order.getCustomerId(), order.getReceiveType(),
			   order.getReceiverName(), order.getReceiverPhone(), order.getMemo(), order.getReceiverAddress()};      

	   jdbcUtil.setSqlAndParameters(query1, param1);   
	   String key[] = {"orderId"};
	   
	   try {
		   jdbcUtil.executeUpdate(key);
		   ResultSet rs = jdbcUtil.getGeneratedKeys();
			if(rs.next()) {
				int generatedKey = rs.getInt(1);
				order.setOrderId(generatedKey);
			}
	   } catch(Exception ex) {
		   jdbcUtil.rollback();
		   ex.printStackTrace();
		   jdbcUtil.close();
		   return 0;
	   }
	   System.out.println("order 추가 성공");
			
		// lineItem insert
		int i = 0;
		for (CartItem item : cartItemList) {
			String query2 = "INSERT INTO lineItem (lineItemId, orderId, productId, quantity, price) "
					+ "VALUES (Sequence_lineItem.nextVal, ?, ?, ?, ?)";
			Object[] param2 = new Object[] {order.getOrderId(), item.getProductId(), item.getQuantity(), item.getProductPrice()};     
			jdbcUtil.setSqlAndParameters(query2, param2);      
		
			try {
				jdbcUtil.executeUpdate();
				i++;
			}catch(Exception ex) {
			   jdbcUtil.rollback();
			   ex.printStackTrace();   
		   }finally {
			   jdbcUtil.commit();
			   jdbcUtil.close();
		   }
			System.out.println("lineItem" + i + " 추가 성공");
		}
		return i;
   }   
   
}


