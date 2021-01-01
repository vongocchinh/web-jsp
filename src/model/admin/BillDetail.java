package model.admin;

public class BillDetail {
	 private int billDetailID;
	    private int billID;
	    private int productID;
	    private double price;
	    private int quantity;

	    public BillDetail() {
	    }

		public BillDetail(int billID, int productID, double price, int quantity) {
			super();
			this.billID = billID;
			this.productID = productID;
			this.price = price;
			this.quantity = quantity;
		}

		public BillDetail(int billDetailID, int billID, int productID, double price, int quantity) {
			super();
			this.billDetailID = billDetailID;
			this.billID = billID;
			this.productID = productID;
			this.price = price;
			this.quantity = quantity;
		}

		public int getBillDetailID() {
			return billDetailID;
		}

		public void setBillDetailID(int billDetailID) {
			this.billDetailID = billDetailID;
		}

		public int getBillID() {
			return billID;
		}

		public void setBillID(int billID) {
			this.billID = billID;
		}

		public int getProductID() {
			return productID;
		}

		public void setProductID(int productID) {
			this.productID = productID;
		}

		public double getPrice() {
			return price;
		}

		public void setPrice(double price) {
			this.price = price;
		}

		public int getQuantity() {
			return quantity;
		}

		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}

		@Override
		public String toString() {
			return "BillDetail [billDetailID=" + billDetailID + ", billID=" + billID + ", productID=" + productID
					+ ", price=" + price + ", quantity=" + quantity + "]";
		}

	   

}
