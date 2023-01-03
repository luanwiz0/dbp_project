package controller.mypage;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.CartItem;
import model.ClassInfo;
import model.LineItem;
import model.Orders;
import model.Product;
import model.Qna;
import model.Reservation;
import model.service.CartManager;
import model.service.ClassManager;
import model.service.OrderManager;
import model.service.ProductManager;
import model.service.QnaManager;
import model.service.ReservationManager;

public class ManageMypageController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(ManageMypageController.class);
	public static final String USER_SESSION_KEY = "userId";
	
	//주문 목록 조회(모든)
	//public List<Orders> findOrderList() throws SQLException{  
	//주문 목록 조회(고객 1명에 대한)
	//public List<Orders> findOrderList(String customerId) throws SQLException{
	//주문 상세 조회(mypage 주문 클릭 시 해당 상품 주문 내용 확인)
	//public LineItem findOrder(int orderId) throws SQLException {
	   
	   
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//고객 아이디 얻어오기
    	HttpSession session = request.getSession();
		String customerId = UserSessionUtils.getLoginUserId(session);
		
		// 자신의 주문 목록 조회
		if (request.getServletPath().equals("/mypage/order")) {
    		OrderManager orderMan = OrderManager.getInstance();
        	
        	List<Orders> orderList = orderMan.findOrderList(customerId);
        	
    		request.setAttribute("orderList", orderList);
    		request.setAttribute("customerId", customerId);
    		return "/mypage/myOrder.jsp";
    	}
		
		// 주문 상세보기
		else if (request.getServletPath().equals("/mypage/order/detail")) {
    		OrderManager orderMan = OrderManager.getInstance();
    		ProductManager productMan = ProductManager.getInstance();
        	
        	int orderId = Integer.parseInt(request.getParameter("orderId"));
        	
        	//주문 목록 상세 조회
        	List<LineItem> lineItemList = orderMan.findOrder(orderId);
        	for(LineItem item : lineItemList) {
        		item.setProductName(productMan.findProduct(item.getProductId()).getName());
        	}
        	
    		request.setAttribute("lineItemList", lineItemList);
    		request.setAttribute("customerId", customerId);		
    		
    		return "/mypage/myOrderDetail.jsp";
    	}
		
		// 게시글 조회
		else if (request.getServletPath().equals("/mypage/post")) {
    		QnaManager qnaMan = QnaManager.getInstance();

        	// Qna 게시물 목록 조회 - 테이블 전체를 List로 반환
        	List<Qna> qnaList = qnaMan.findQnaList();
        	
        	List<Qna> MyQnaList = new ArrayList<Qna>();
        	
        	//Qna findQna(qnaId)
        	for (Qna qna : qnaList) {
                if (customerId.equals(qna.getCustomerId())) {
                	int id = qna.getQnaId();
                	Qna q = qnaMan.findQna(id);
                	MyQnaList.add(q);
                }
            }
        	
        	request.setAttribute("MyQnaList", MyQnaList);
        	request.setAttribute("customerId", customerId);
    		return "/mypage/myPost.jsp";
    	}
		
		//클래스 예약 내역
		else if (request.getServletPath().equals("/mypage/reservation")) {
	        ReservationManager reservationMan = ReservationManager.getInstance();
	
	        //주문 목록 조회(고객 1명에 대한)
	        List<Reservation> reservationList = reservationMan.findReservationList(customerId);
	
	        request.setAttribute("reservationList", reservationList);
	        request.setAttribute("customerId", customerId);
	
	        // 클래스 상세 조회 -> classId로 name 알아오기
	        ClassManager classMan = ClassManager.getInstatnce();
	        List<ClassInfo> classNameList = new ArrayList<ClassInfo>();
	
	        for (Reservation r : reservationList) {
	            int classId = r.getClassId();
	            if (classId == classMan.findClassInfo(classId).getClassId()) {
	                classNameList.add(classMan.findClassInfo(classId));
	            }
	        }
	        request.setAttribute("classNameList", classNameList);
	
	        return "/mypage/myReservation.jsp";
    }
		
		return "/mypage/mypage.jsp";
	}

}