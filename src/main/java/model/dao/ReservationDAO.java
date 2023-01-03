package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Product;
import model.Reservation;

public class ReservationDAO {
   private JDBCUtil jdbcUtil = null;
   
   public ReservationDAO() {
      jdbcUtil = new JDBCUtil();
   }
  
   //클래스 예약하기
   public int classReservation(Reservation reservation) throws SQLException {
      String query = "insert into reservation(reservationId, classId, customerId) values(Sequence_reservation.nextVal,?,?)";
      
      Object[] param1 = new Object[] {reservation.getClassId(), reservation.getCustomerId()};      

	  jdbcUtil.setSqlAndParameters(query, param1);   
	  String key[] = {"reservationId"};
	   
      try {
        int result = jdbcUtil.executeUpdate(key);
          
        ResultSet rs = jdbcUtil.getGeneratedKeys();
 		if(rs.next()) {
 			int generatedKey = rs.getInt(1);
 			reservation.setClassId(generatedKey);
 		}
 		System.out.println("reservation 추가 성공");
        return result;
         
      } catch (Exception ex) {
         jdbcUtil.rollback();
         ex.printStackTrace();
      } finally {
         jdbcUtil.commit();
         jdbcUtil.close();
      }
      return 0;
   }
   
   // 예약 조회(고객 1명에 대한)
   public List<Reservation> findReservationList(String customerId){
		String query = "SELECT * FROM Reservation WHERE customerId = ?";
		Object[] param = new Object[] {customerId};
		jdbcUtil.setSqlAndParameters(query, param);
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			List<Reservation> reservationList = new ArrayList<Reservation>();
			
			while(rs.next()) {
				Reservation dto = new Reservation();
				dto.setReservationId(rs.getInt("reservationId"));
				dto.setClassId(rs.getInt("classId"));
				dto.setCustomerId(rs.getString("customerId"));
				reservationList.add(dto);
			}
			return reservationList;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			jdbcUtil.close();
		}
		return null;
	}
   
}