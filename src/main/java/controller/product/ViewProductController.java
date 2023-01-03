package controller.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Product;
import model.service.ProductManager;

public class ViewProductController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductManager manager = ProductManager.getInstance();
		
		int productId = Integer.parseInt(request.getParameter("productId"));
		Product product = manager.findProduct(productId);
		
		request.setAttribute("product", product);
		return "/product/view.jsp";
	}

}
