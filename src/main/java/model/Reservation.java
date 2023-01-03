package model;

public class Reservation{
	private int reservationId;
	private int classId;
	private String customerId;
	
	public Reservation() {
		super();
	}

	public Reservation(int reservationId, int classId, String customerId) {
		super();
		this.reservationId = reservationId;
		this.classId = classId;
		this.customerId = customerId;
	}

	public int getReservationId() {
		return reservationId;
	}

	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	@Override
	public String toString() {
		return "Reservation [reservationId=" + reservationId + ", classId=" + classId + ", customerId=" + customerId
				+ "]";
	}
	
}