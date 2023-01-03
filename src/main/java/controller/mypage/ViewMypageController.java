package controller.mypage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.LineItem;
import model.Orders;
import model.Qna;
import model.Reservation;
import model.service.OrderManager;
import model.service.ProductManager;
import model.service.QnaManager;
import model.service.ReservationManager;

public class ViewMypageController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	// 로그인 여부 확인
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
    		return "redirect:/user/login/form";		// login form 요청으로 redirect
        }
    	
    	//고객 아이디 얻어오기
    	HttpSession session = request.getSession();
		String customerId = UserSessionUtils.getLoginUserId(session);
		
		//주문 개수
    	OrderManager orderMan = OrderManager.getInstance();
		
		List<Orders> myOrderList = orderMan.findOrderList(customerId);
    	int orderCnt = myOrderList.size();


    	//QnA 작성 개수
    	QnaManager qnaMan = QnaManager.getInstance();
    	List<Qna> qnaList = qnaMan.findQnaList();
    	int qnaCnt = 0;
    	
    	for (Qna qna : qnaList) {
            if (customerId.equals(qna.getCustomerId())) {
            	qnaCnt++;
            }
        }
    	
    	//클래스 예약 개수
    	ReservationManager reservationMan = ReservationManager.getInstance();
        List<Reservation> reservationList = reservationMan.findReservationList(customerId);
        int reservCnt = reservationList.size();
        
		request.setAttribute("orderCnt", orderCnt);
		request.setAttribute("qnaCnt", qnaCnt);		
		request.setAttribute("reservCnt", reservCnt);
		return "/mypage/mypage.jsp";
    }
}