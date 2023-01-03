package model;

public class LineItem {
	private String lineItemId;
	private int orderId;
	private int productId;
	private int quantity;
	private int price;
	private String productName;
	
	public LineItem() {
		super();
	}

	public LineItem(String lineItemId, int orderId, int productId, int quantity, int price) {
		super();
		this.lineItemId = lineItemId;
		this.orderId = orderId;
		this.productId = productId;
		this.quantity = quantity;
		this.price = price;
	}

	public String getLineItemId() {
		return lineItemId;
	}

	public void setLineItemId(String lineItemId) {
		this.lineItemId = lineItemId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
	public String toString() {
		return "LineItem [lineItemId=" + lineItemId + ", orderId=" + orderId + ", productId=" + productId + ", quantity="
				+ quantity + "price=" + price + "]";
	}
	
}