package model;

/**
 * 구매자 관리를 위해 필요한 도메인 클래스. Customer 테이블과 대응됨
 */
public class Customer {
	private String customerId;
	private String pwd;
	private String name;
	private String phone;
	private String email;
	private String address;

	public Customer() { }		// 기본 생성자
	
	public Customer(String customerId, String pwd, String name, String phone, String email, String address) {
		this.customerId = customerId;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
	}

	public Customer(String customerId, String name, String phone) {
		this.customerId = customerId;
		this.name = name;
		this.phone = phone;
	}
	
	public void update(Customer updateCustomer) {
        this.pwd = updateCustomer.pwd;
        this.name = updateCustomer.name;
        this.phone = updateCustomer.phone;
        this.email = updateCustomer.email;
    }
	
	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	/* 비밀번호 검사 */
	public boolean matchPassword(String pwd) {
		if (pwd == null) {
			return false;
		}
		return this.pwd.equals(pwd);
	}
	
	public boolean isSameUser(String userid) {
        return this.customerId.equals(userid);
    }

	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", pwd=" + pwd + ", name=" + name + ", phone=" + phone + ", email="
				+ email + ", address=" + address + "]";
	}	
}