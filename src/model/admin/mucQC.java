package model.admin;

public class mucQC {
	private int muc_id;
	private String muc_Name;
	public mucQC(int muc_id, String muc_Name) {
		super();
		this.muc_id = muc_id;
		this.muc_Name = muc_Name;
	}
	public mucQC(String muc_Name) {
		super();
		this.muc_Name = muc_Name;
	}
	public mucQC() {
		super();
	}
	public int getMuc_id() {
		return muc_id;
	}
	public void setMuc_id(int muc_id) {
		this.muc_id = muc_id;
	}
	public String getMuc_Name() {
		return muc_Name;
	}
	public void setMuc_Name(String muc_Name) {
		this.muc_Name = muc_Name;
	}
	@Override
	public String toString() {
		return "mucQC [muc_id=" + muc_id + ", muc_Name=" + muc_Name + "]";
	}
	
}
