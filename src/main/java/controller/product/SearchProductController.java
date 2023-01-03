package controller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.Product;
import model.service.ProductManager;

public class SearchProductController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(ManageProductController.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductManager manager = ProductManager.getInstance();
		
		// form 요청
		if(request.getMethod().equals("GET")){
			log.debug("SearchProductForm Request");
			return "/product/searchForm.jsp";
		}
		
		// 검색 결과 요청
		String name = request.getParameter("name");
		List<Product> productList = manager.findProductByName(name);
		
		request.setAttribute("productList", productList);
		log.debug("productList: " + productList.toString());
		return "/product/searchResult.jsp";
	}

}
