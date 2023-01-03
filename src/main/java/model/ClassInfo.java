package model;

public class ClassInfo {
	private int classId;
	private String name;
	private String date;
	private int maxNum;
	private int currentNum;
	private String sellerId;
	
	public ClassInfo(int classId, String name, String date, int maxNum, int currentNum) {
		super();
		this.classId = classId;
		this.name = name;
		this.date = date;
		this.maxNum = maxNum;
		this.currentNum = currentNum;
	}

	public ClassInfo(int classId, String name, String date, int maxNum, int currentNum, String sellerId) {
		super();
		this.classId = classId;
		this.name = name;
		this.date = date;
		this.maxNum = maxNum;
		this.currentNum = currentNum;
		this.sellerId = sellerId;
	}



	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getMaxNum() {
		return maxNum;
	}

	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}

	public int getCurrentNum() {
		return currentNum;
	}

	public void setCurrentNum(int currentNum) {
		this.currentNum = currentNum;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	
	@Override
	public String toString() {
		return "ClassInfo [classId=" + classId + ", name=" + name + ", date=" + date + ", maxNum=" + maxNum
				+ ", currentNum=" + currentNum + ", sellerId=" + sellerId + "]";
	}
}
