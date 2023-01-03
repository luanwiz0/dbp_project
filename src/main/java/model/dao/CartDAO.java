package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.CartItem;

public class CartDAO {
	private JDBCUtil jdbcUtil = null;
		
	public CartDAO() {	// 생성자 
		jdbcUtil = new JDBCUtil();
	}
	
	// 장바구니 항목 조회(장바구니 페이지 첫 화면에 나오는 품목 리스트)
	public List<CartItem> getCartItemList(String customerId) {
		String query = "SELECT cartItemId, quantity, p.productId, p.name, p.price "
				+ "FROM CartItem c JOIN Product p ON c.productId = p.productId "
				+ "WHERE customerId = ? ORDER BY cartItemId";
		Object[] param = new Object[] {customerId};		// customerId = ? 의 매개변수 설정
		jdbcUtil.setSqlAndParameters(query, param);
		
		try { 
			ResultSet rs = jdbcUtil.executeQuery();		// query 문 실행		
			List<CartItem> list = new ArrayList<CartItem>();		// list 객체 생성
			while (rs.next()) {	
				CartItem dto = new CartItem();		// 하나의 CartItem 객체 생성 후 정보 설정
				
				System.out.println("[" + rs.getInt("cartItemId") + ", "
						+ rs.getInt("quantity") + "," + rs.getInt("productId") + "]");
				
				dto.setCartItemId(rs.getInt("cartItemId"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setProductId(rs.getInt("productId"));
				dto.setProductName(rs.getString("name"));
				dto.setProductPrice(rs.getString("price"));
				list.add(dto);		// list 객체에 정보를 설정한 CartItem 객체 저장
			}
			return list;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}		
		return null;	
	}
	
	// orderId로 장바구니 항목 1개 조회(daotest 해보기)
		public CartItem getCartItem(int cartItemId) {
			String query = "SELECT cartItemId, quantity, productId FROM CartItem "
					+ "WHERE cartItemId = ?";

			Object[] param = new Object[] {cartItemId};		// customerId = ? 의 매개변수 설정
			jdbcUtil.setSqlAndParameters(query, param);
			CartItem cartItem = null;

			try { 
				ResultSet rs = jdbcUtil.executeQuery();		// query 문 실행		

				if (rs.next()) {	
					cartItem = new CartItem(
							cartItemId,
							rs.getInt("quantity"),
							rs.getString("customerId"),
							rs.getInt("productId"));
				}
				return cartItem;
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				jdbcUtil.close();
			}		
			return null;	
		}
	
	// 장바구니에 등록
	public int addItem(CartItem cartItem) {
		String query = "INSERT INTO CartItem (cartItemId, productId, customerId, quantity) VALUES (Sequence_cartItem.nextVal, ?, ?, ?)";
		
		Object[] param = new Object[] {cartItem.getProductId(), cartItem.getCustomerId(), cartItem.getQuantity()};		
		jdbcUtil.setSqlAndParameters(query, param);		
		String key[] = {"cartItemId"};
		
		try {		
			int result = jdbcUtil.executeUpdate(key);		// insert 문 실행
			ResultSet rs = jdbcUtil.getGeneratedKeys();
			int generatedKey = 0;
			if(rs.next()) {
				generatedKey = rs.getInt(1);
				cartItem.setCartItemId(generatedKey);
			}
			System.out.println("item 추가 성공");
			return result;	
		} catch (SQLException ex) {
			System.out.println("입력 오류 발생");
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();
		}		
		return 0;	
	}
	
	// 장바구니에서 삭제 (같은 상품이라도 다른 옵션이면 따로 표시되니까 productId 대신 cartItemId로 변경)
	public int removeItem(int cartItemId) {
		String query = "DELETE FROM CartItem WHERE cartItemId = ?";
		Object[] param = new Object[] {cartItemId};
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			int result = jdbcUtil.executeUpdate();		// delete 문 실행
			System.out.println("삭제 성공");
			return result;						// delete 에 의해 반영된 레코드 수 반환
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();		
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		return 0;
	}
	
	// 장바구니 항목 옵션 수정
	public int updateItem(CartItem cartItem) {
		String query = "UPDATE CartItem SET quantity = ? WHERE cartItemId = ?";
		
		Object[] param = new Object[] {cartItem.getQuantity(), cartItem.getCartItemId()};				
		jdbcUtil.setSqlAndParameters(query, param);
	
		try {
			int result = jdbcUtil.executeUpdate();		// update 문 실행
			System.out.println("수정 성공");
			return result;			// update 에 의해 반영된 레코드 수 반환
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}		
		return 0;
	}
	
} 
