package model.admin;

public class user {
	private int userID;
    private String userName;
    private String userEmail;
    private String userPass;
    private boolean userRole;
    private String userPhone;
    private String ten;
    private String diachi;
	public user(int userID, String userName, String userEmail, String userPass, boolean userRole, String userPhone,
			String ten, String diachi) {
		super();
		this.userID = userID;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPass = userPass;
		this.userRole = userRole;
		this.userPhone = userPhone;
		this.ten = ten;
		this.diachi = diachi;
	}
	public user(String userName, String userEmail, String userPass, boolean userRole, String userPhone, String ten,
			String diachi) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPass = userPass;
		this.userRole = userRole;
		this.userPhone = userPhone;
		this.ten = ten;
		this.diachi = diachi;
	}
	public user(int userID, String userName, String userEmail, boolean userRole, String userPhone, String ten,
			String diachi) {
		super();
		this.userID = userID;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userRole = userRole;
		this.userPhone = userPhone;
		this.ten = ten;
		this.diachi = diachi;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public user(int userID, String userName, String userEmail, String userPass, boolean userRole, String userPhone) {
		super();
		this.userID = userID;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPass = userPass;
		this.userRole = userRole;
		this.userPhone = userPhone;
	}
	public user(String userName, String userEmail, String userPass, boolean userRole, String userPhone) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPass = userPass;
		this.userRole = userRole;
		this.userPhone = userPhone;
	}
	public user() {
		super();
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public boolean isUserRole() {
		return userRole;
	}
	public void setUserRole(boolean userRole) {
		this.userRole = userRole;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	@Override
	public String toString() {
		return "user [userID=" + userID + ", userName=" + userName + ", userEmail=" + userEmail + ", userPass="
				+ userPass + ", userRole=" + userRole + ", userPhone=" + userPhone + "]";
	}
    
    
}
