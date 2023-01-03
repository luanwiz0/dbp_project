package model.service;

import java.sql.SQLException;
import java.util.List;

import model.Reservation;
import model.dao.ReservationDAO;

public class ReservationManager extends Exception{
		private static ReservationManager resMan = new ReservationManager();
		private ReservationDAO reservationDAO;
			
		public static ReservationManager getInstance() {
			return resMan;
		}
		
		private ReservationManager() {
			try {
				reservationDAO = new ReservationDAO();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		//클래스 예약
		public int classReservation(Reservation reservation) throws SQLException{
			return reservationDAO.classReservation(reservation);
		}
	
		//클래스 조회
		public List<Reservation> findReservationList(String customerId) throws SQLException{
			return reservationDAO.findReservationList(customerId);
		}
}
