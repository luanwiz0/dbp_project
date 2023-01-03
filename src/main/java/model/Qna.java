package model;

/**
 * 구매자 관리를 위해 필요한 도메인 클래스. Customer 테이블과 대응됨
 */
public class Qna {
	private int qnaId;
	private String title;
	private String content;
	private String creationDate;
	private int viewCount;
	private String pwd;
	private String customerId;
	private int productId;
	private int ref;
	private int restep;
	private int relevel;

	public Qna() { }		// 기본 생성자
	
	public Qna(int qnaId, String title, String content, String creationDate, int viewCount, String pwd, String customerId, int productId, int ref, int restep, int relevel) {
		this.qnaId = qnaId;
		this.title = title;
		this.content = content;
		this.creationDate = creationDate;
		this.viewCount = viewCount;
		this.pwd = pwd;
		this.customerId = customerId;
		this.productId = productId;
		this.ref = ref;
		this.restep = restep;
		this.relevel = relevel;
	}
	
	public Qna(String creationDate, int viewCount, String title, String content) {
		this.creationDate = creationDate;
		this.viewCount = viewCount;
		this.title = title;
		this.content = content;
	}					

	public Qna(int qnaId, String title, String customerId, String creationDate, int viewCount) {
		this.qnaId = qnaId;
		this.title = title;
		this.customerId = customerId;
		this.creationDate = creationDate;
		
	}

	public void update(Customer updateCustomer) {
		this.qnaId = qnaId;
		this.title = title;
		this.content = content;
		this.creationDate = creationDate;
		this.viewCount = viewCount;
		this.pwd = pwd;
		this.customerId = customerId;
		this.productId = productId;
		this.ref = ref;
		this.restep = restep;
		this.relevel = relevel;
    }
	
	public int getQnaId() {
		return qnaId;
	}

	public void setQnaId(int qnaId) {
		this.qnaId = qnaId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}
	
	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRestep() {
		return restep;
	}

	public void setRestep(int restep) {
		this.restep = restep;
	}

	public int getRelevel() {
		return relevel;
	}

	public void setRelevel(int relevel) {
		this.relevel = relevel;
	}

	@Override
	public String toString() {
		return "Qna [qnaId=" + qnaId + ", title=" + title + ", content=" + content + ", creationDate=" + creationDate
				+ ", viewCount=" + viewCount + ", customerId=" + customerId + ", productId=" + productId + ", ref="
				+ ref + ", restep=" + restep + ", relevel=" + relevel + "]";
	}	
}
