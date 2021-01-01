package model.admin;

import java.sql.Timestamp;

public class Bill {
	 private int billID;
	    private int userID;
	    private int total;
	    private String payment;
	    private String address;
	    private Timestamp date;
	    private String name;
	    private String phone;
	    private String huyen;
	    private String xa;
	    private String sonha;
		public int getBillID() {
			return billID;
		}
		public void setBillID(int billID) {
			this.billID = billID;
		}
		public int getUserID() {
			return userID;
		}
		
		public void setUserID(int userID) {
			this.userID = userID;
		}
		public int getTotal() {
			return total;
		}
		public void setTotal(int total) {
			this.total = total;
		}
		public String getPayment() {
			return payment;
		}
		public void setPayment(String payment) {
			this.payment = payment;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		
		public Bill(int userID, int total, String payment, String address, Timestamp date, String name, String phone,
				String huyen, String xa, String sonha) {
			super();
			this.userID = userID;
			this.total = total;
			this.payment = payment;
			this.address = address;
			this.date = date;
			this.name = name;
			this.phone = phone;
			this.huyen = huyen;
			this.xa = xa;
			this.sonha = sonha;
		}
		public Bill(int billID, int userID, int total, String payment, String address, Timestamp date, String name,
				String phone, String huyen, String xa, String sonha) {
			super();
			this.billID = billID;
			this.userID = userID;
			this.total = total;
			this.payment = payment;
			this.address = address;
			this.date = date;
			this.name = name;
			this.phone = phone;
			this.huyen = huyen;
			this.xa = xa;
			this.sonha = sonha;
		}
		public String getHuyen() {
			return huyen;
		}
		public void setHuyen(String huyen) {
			this.huyen = huyen;
		}
		public String getXa() {
			return xa;
		}
		public void setXa(String xa) {
			this.xa = xa;
		}
		public String getSonha() {
			return sonha;
		}
		public void setSonha(String sonha) {
			this.sonha = sonha;
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
	
		public Timestamp getDate() {
			return date;
		}
		public void setDate(Timestamp date) {
			this.date = date;
		}
		@Override
		public String toString() {
			return "Bill [billID=" + billID + ", userID=" + userID + ", total=" + total + ", payment=" + payment
					+ ", address=" + address + ", date=" + date + ", name=" + name + ", phone=" + phone + "]";
		}
		public Bill() {
			super();
		}
	    
}
