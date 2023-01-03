package controller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.service.ProductManager;
import model.Product;

public class ListProductController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(ListProductController.class);
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductManager manager = ProductManager.getInstance();
		
		String type = request.getParameter("type"); // 메뉴에서 선택할 때 파라미터 형식으로 받도록 - 음식 누르면 ~~~?food / 꽃 누르면 ~~~~?flower
		List<Product> productList = manager.findProductList(type);
		
		log.debug("productList: " + productList.toString());
		request.setAttribute("productList", productList);
		return "/product/list.jsp";
	}

}
