package model.admin;

public class nhanvien {
	private  int nv_id;
	private String nv_name;
	private String nv_mail;
	private String nv_diachi;
	private String sdt;
	private int chucvu_id;
	
	public nhanvien(String nv_name, String nv_mail, String nv_diachi, String sdt, int chucvu_id) {
		super();
		this.nv_name = nv_name;
		this.nv_mail = nv_mail;
		this.nv_diachi = nv_diachi;
		this.sdt = sdt;
		this.chucvu_id = chucvu_id;
		
	}
	public nhanvien(int nv_id, String nv_name, String nv_mail, String nv_diachi, String sdt, int chucvu_id) {
		super();
		this.nv_id = nv_id;
		this.nv_name = nv_name;
		this.nv_mail = nv_mail;
		this.nv_diachi = nv_diachi;
		this.sdt = sdt;
		this.chucvu_id = chucvu_id;
		
	}
	public nhanvien() {
		super();
	}
	public int getNv_id() {
		return nv_id;
	}
	public void setNv_id(int nv_id) {
		this.nv_id = nv_id;
	}
	public String getNv_name() {
		return nv_name;
	}
	public void setNv_name(String nv_name) {
		this.nv_name = nv_name;
	}
	public String getNv_mail() {
		return nv_mail;
	}
	public void setNv_mail(String nv_mail) {
		this.nv_mail = nv_mail;
	}
	public String getNv_diachi() {
		return nv_diachi;
	}
	public void setNv_diachi(String nv_diachi) {
		this.nv_diachi = nv_diachi;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public int getChucvu_id() {
		return chucvu_id;
	}
	public void setChucvu_id(int chucvu_id) {
		this.chucvu_id = chucvu_id;
	}
	
	
}
