package model.admin;

public class chucvu {
	private int chucvu_id;
	private String chucvu_name;
	private int chucvu_luong;
	public chucvu(int chucvu_id, String chucvu_name, int chucvu_luong) {
		super();
		this.chucvu_id = chucvu_id;
		this.chucvu_name = chucvu_name;
		this.chucvu_luong = chucvu_luong;
	}
	public chucvu(String chucvu_name, int chucvu_luong) {
		super();
		this.chucvu_name = chucvu_name;
		this.chucvu_luong = chucvu_luong;
	}
	public chucvu() {
		super();
	}
	public int getChucvu_id() {
		return chucvu_id;
	}
	public void setChucvu_id(int chucvu_id) {
		this.chucvu_id = chucvu_id;
	}
	public String getChucvu_name() {
		return chucvu_name;
	}
	public void setChucvu_name(String chucvu_name) {
		this.chucvu_name = chucvu_name;
	}
	public int getChucvu_luong() {
		return chucvu_luong;
	}
	public void setChucvu_luong(int chucvu_luong) {
		this.chucvu_luong = chucvu_luong;
	}
	
}
