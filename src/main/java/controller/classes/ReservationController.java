package controller.classes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Reservation;
import model.service.ClassManager;
import model.service.ReservationManager;

public class ReservationController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(ReservationController.class);
	
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ReservationManager reservationman = ReservationManager.getInstance();
		if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";        // login form 요청으로 redirect
        }
		//고객 아이디 얻어오기
    	HttpSession session = request.getSession();
		String customerId = UserSessionUtils.getLoginUserId(session);
		
		//예약 정보 DB에 저장
		if(request.getServletPath().equals("/class/reservation")) {
			Reservation reservation = new Reservation(
					0,	//reservationId
					Integer.parseInt(request.getParameter("classId")),
					customerId);
			
			try {
				reservationman.classReservation(reservation);
				log.debug("Create Reservation "+reservation.toString());
				return "redirect:/class/list";
			}catch(Exception e) {
				e.printStackTrace();
				return "redirect:/class/list";
			}
		}
		return "redirect:/class/list";
	}
}
