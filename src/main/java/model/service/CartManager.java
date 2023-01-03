package model.service;

import java.util.List;

import model.CartItem;
import model.dao.CartDAO;

public class CartManager {
	private static CartManager cartMan = new CartManager();
	private CartDAO cartDAO;

	private CartManager() {
		try {
			cartDAO = new CartDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}

	public static CartManager getInstance() {
		return cartMan;
	}

	// 장바구니 항목 조회(장바구니 페이지 첫 화면에 나오는 품목 리스트)
	public List<CartItem> getCartItemList(String customerId) {
		return cartDAO.getCartItemList(customerId);
	}

	// orderId로 장바구니 항목 1개 조회
	public CartItem getCartItem(int cartItemId) {
		return cartDAO.getCartItem(cartItemId);
	}

	// 장바구니에 등록
	public int addItem(CartItem cartItem) {
		return cartDAO.addItem(cartItem);
	}

	// 장바구니에서 삭제 (같은 상품이라도 다른 옵션이면 따로 표시되니까 productId 대신 cartItemId로 변경)
	public int removeItem(int cartItemId) {
		return cartDAO.removeItem(cartItemId);
	}

	// 장바구니 항목 옵션 수정
	public int updateItem(CartItem cartItem) {
		return cartDAO.updateItem(cartItem);
	}

}