package model;

public class Product {
	private int productId;
	private String name;
	private int price;
	private String description;
	private String type;
	private String category;
	private String sellerId;
	
	public Product() {
		super();
	}

	
	public Product(int productId, String name, int price, String description, String type, String category) {
		super();
		this.productId = productId;
		this.name = name;
		this.price = price;
		this.description = description;
		this.type = type;
		this.category = category;
	}

	public Product(int productId, String name, int price, String description, String type, String category, String sellerId) {
		super();
		this.productId = productId;
		this.name = name;
		this.price = price;
		this.description = description;
		this.type = type;
		this.category = category;
		this.sellerId = sellerId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", name=" + name + ", price=" + price + ", description="
				+ description + ", type=" + type + ", category=" + category + ", sellerId=" + sellerId + "]";
	}
	
}
