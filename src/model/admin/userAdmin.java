package model.admin;

public class userAdmin {
	private int id;
	private String userNameAdmin;
	private String passWordAdmin;
	private boolean roleAdmin;
	public userAdmin(int id, String userNameAdmin, String passWordAdmin, boolean roleAdmin) {
		super();
		this.id = id;
		this.userNameAdmin = userNameAdmin;
		this.passWordAdmin = passWordAdmin;
		this.roleAdmin = roleAdmin;
	}
	public userAdmin() {
		super();
	}
	public userAdmin(String userNameAdmin, String passWordAdmin, boolean roleAdmin) {
		super();
		this.userNameAdmin = userNameAdmin;
		this.passWordAdmin = passWordAdmin;
		this.roleAdmin = roleAdmin;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserNameAdmin() {
		return userNameAdmin;
	}
	public void setUserNameAdmin(String userNameAdmin) {
		this.userNameAdmin = userNameAdmin;
	}
	public String getPassWordAdmin() {
		return passWordAdmin;
	}
	public void setPassWordAdmin(String passWordAdmin) {
		this.passWordAdmin = passWordAdmin;
	}
	public boolean isRoleAdmin() {
		return roleAdmin;
	}
	public void setRoleAdmin(boolean roleAdmin) {
		this.roleAdmin = roleAdmin;
	}
	@Override
	public String toString() {
		return "userAdmin [id=" + id + ", userNameAdmin=" + userNameAdmin + ", passWordAdmin=" + passWordAdmin
				+ ", roleAdmin=" + roleAdmin + "]";
	}
	
	
}
