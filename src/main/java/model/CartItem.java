package model;

public class CartItem {
	private int cartItemId;
	private int quantity;
	private String customerId;
	//product 클래스에서 얻어옴
	private int productId;	
	private String productName;
	private String productPrice;
	
	public CartItem() {
		super();
	}

	public CartItem(int cartItemId, int quantity, String customerId, int productId) {
		super();
		this.cartItemId = cartItemId;
		this.quantity = quantity;
		this.customerId = customerId;
		this.productId = productId;
	}

	public int getCartItemId() {
		return cartItemId;
	}

	public void setCartItemId(int cartItemId) {
		this.cartItemId = cartItemId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

}