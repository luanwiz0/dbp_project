package model;

/**
 * 판매자 관리를 위해 필요한 도메인 클래스. Seller 테이블과 대응됨
 */
public class Seller {
	private String sellerId;
	private String pwd;
	private String name;
	private String phone;
	private String email;

	public Seller() { }		// 기본 생성자
	
	public Seller(String sellerId, String pwd, String name, String phone, String email) {
		this.sellerId = sellerId;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}
	
	/*public void update(Seller updateCustomer) {
        this.pwd = updateSeller.pwd;
        this.name = updateSeller.name;
        this.phone = updateSeller.phone;
        this.email = updateSeller.email;
    }*/
	
	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
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

	/* 비밀번호 검사 */
	public boolean matchPassword(String pwd) {
		if (pwd == null) {
			return false;
		}
		return this.pwd.equals(pwd);
	}
	
	public boolean isSameUser(String userid) {
        return this.sellerId.equals(userid);
    }

	@Override
	public String toString() {
		return "Seller [sellerId=" + sellerId + ", pwd=" + pwd + ", name=" + name + ", phone=" + phone + ", email="
				+ email  + "]";
	}	
}