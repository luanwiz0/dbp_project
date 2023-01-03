package model;
 
import java.util.Date;

public class Orders {
   private int orderId;
   private String customerId;	//주문자 정보 = 고객 정보 (이름, 번호, 메일 자동으로 채워짐)
   private Date creationDate;
   private String receiveType;	//수령방법 -> 선택에 따라 폼 입력 비활성화
   //배송&예약 공통
   private String receiverName;	//수령인 정보
   private String receiverPhone;
   private String memo;
   //배송
   private String receiverAddress;

public Orders() { 
	   super();
   }

	public Orders(int orderId, String customerId, String receiveType, String receiverName,
		String receiverPhone, String memo, String receiverAddress) {
	super();
	this.orderId = orderId;
	this.customerId = customerId;
	this.receiveType = receiveType;
	this.receiverName = receiverName;
	this.receiverPhone = receiverPhone;
	this.memo = memo;
	this.receiverAddress = receiverAddress;
}

	public Orders(int orderId, String customerId, Date creationDate, String receiveType,
		String receiverName, String receiverPhone, String memo, String receiverAddress) {
		super();
		this.orderId = orderId;
		this.customerId = customerId;
		this.creationDate = creationDate;
		this.receiveType = receiveType;
		this.receiverName = receiverName;
		this.receiverPhone = receiverPhone;
		this.memo = memo;
		this.receiverAddress = receiverAddress;
	}

	public int getOrderId() {
		return orderId;
	}
	
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getCustomerId() {
		return customerId;
	}
	
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	
	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public String getReceiveType() {
		return receiveType;
	}
	
	public void setReceiveType(String receiveType) {
		this.receiveType = receiveType;
	}
	
	public String getReceiverName() {
		return receiverName;
	}
	
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	
	public String getReceiverPhone() {
		return receiverPhone;
	}
	
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	
	public String getMemo() {
		return memo;
	}
	
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	public String getReceiverAddress() {
		return receiverAddress;
	}
	
	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}

	@Override
	public String toString() {
		return "Orders [orderId=" + orderId + ", customerId=" + customerId + ", creationDate=" + creationDate
				+ ", receiveType=" + receiveType + ", receiverName=" + receiverName + ", receiverPhone=" + receiverPhone
				+ ", memo=" + memo + ", receiverAddress=" + receiverAddress + "]";
	}
	
}