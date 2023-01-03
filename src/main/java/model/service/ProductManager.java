package model.service;

import java.sql.SQLException;
import java.util.List;

import model.Product;
import model.dao.ProductDAO;

public class ProductManager {
	private static ProductManager productMan = new ProductManager();
	private ProductDAO productDAO;
	
	private ProductManager() {
		try {
			productDAO = new ProductDAO();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static ProductManager getInstance() {
		return productMan;
	}
	
	// 상품 추가
	public int add(Product product) throws SQLException{
		return productDAO.add(product);
	}
	
	// 상품 정보 수정
	public int update(Product product) throws SQLException{
		return productDAO.update(product);
	}
	
	// 상품 삭제
	public int delete(int productId) throws SQLException{
		return productDAO.remove(productId);
	}
	
	// 상품 id로 검색, 상품 정보 반환
	public Product findProduct(int productId) throws SQLException, ProductNotFoundException{
		Product product = productDAO.findProduct(productId);
		
		if(product == null)
			throw new ProductNotFoundException("존재하지 않는 상품입니다.");
		
		return product;
	}
	
	// 상품 이름으로 검색, 상품 리스트 반환
	public List<Product> findProductByName(String name) throws SQLException{
		return productDAO.findProductByName(name);
	}
	
	// 전체 상품 정보
	public List<Product> findProductList(String type) throws SQLException{
		return productDAO.findProductList(type);
	}
	
}
