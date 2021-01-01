package model.admin;

public class Product {
	   
		
		private int productID;
	    private int categoryID;
	    private String productName;
	    private int brandID;
	    private String productImage;
	    private String productImagenext;
	    private int productPrice;
	    private String productDescription;
	    private String giam_Gia;
	    
	    private String camera_Sau;
	    private String camera_Truoc;
	    
	    private String he_Dieu_Hanh;
		 
	    private String bo_Nho;
	    private String ram;
		public Product(int productID, int categoryID, String productName, int brandID, String productImage,
				String productImagenext, int productPrice, String productDescription, String giam_Gia,
				String camera_Sau, String camera_Truoc, String he_Dieu_Hanh, String bo_Nho, String ram) {
			super();
			this.productID = productID;
			this.categoryID = categoryID;
			this.productName = productName;
			this.brandID = brandID;
			this.productImage = productImage;
			this.productImagenext = productImagenext;
			this.productPrice = productPrice;
			this.productDescription = productDescription;
			this.giam_Gia = giam_Gia;
			this.camera_Sau = camera_Sau;
			this.camera_Truoc = camera_Truoc;
			this.he_Dieu_Hanh = he_Dieu_Hanh;
			this.bo_Nho = bo_Nho;
			this.ram = ram;
		}
		public Product(int categoryID, String productName, int brandID, String productImage, String productImagenext,
				int productPrice, String productDescription, String giam_Gia, String camera_Sau, String camera_Truoc,
				String he_Dieu_Hanh, String bo_Nho, String ram) {
			super();
			this.categoryID = categoryID;
			this.productName = productName;
			this.brandID = brandID;
			this.productImage = productImage;
			this.productImagenext = productImagenext;
			this.productPrice = productPrice;
			this.productDescription = productDescription;
			this.giam_Gia = giam_Gia;
			this.camera_Sau = camera_Sau;
			this.camera_Truoc = camera_Truoc;
			this.he_Dieu_Hanh = he_Dieu_Hanh;
			this.bo_Nho = bo_Nho;
			this.ram = ram;
		}
		public Product() {
			super();
		}
		public int getProductID() {
			return productID;
		}
		public void setProductID(int productID) {
			this.productID = productID;
		}
		public int getCategoryID() {
			return categoryID;
		}
		public void setCategoryID(int categoryID) {
			this.categoryID = categoryID;
		}
		public String getProductName() {
			return productName;
		}
		public void setProductName(String productName) {
			this.productName = productName;
		}
		public int getBrandID() {
			return brandID;
		}
		public void setBrandID(int brandID) {
			this.brandID = brandID;
		}
		public String getProductImage() {
			return productImage;
		}
		public void setProductImage(String productImage) {
			this.productImage = productImage;
		}
		public String getProductImagenext() {
			return productImagenext;
		}
		public void setProductImagenext(String productImagenext) {
			this.productImagenext = productImagenext;
		}
		public int getProductPrice() {
			return productPrice;
		}
		public void setProductPrice(int productPrice) {
			this.productPrice = productPrice;
		}
		public String getProductDescription() {
			return productDescription;
		}
		public void setProductDescription(String productDescription) {
			this.productDescription = productDescription;
		}
		public String getGiam_Gia() {
			return giam_Gia;
		}
		public void setGiam_Gia(String giam_Gia) {
			this.giam_Gia = giam_Gia;
		}
		public String getCamera_Sau() {
			return camera_Sau;
		}
		public void setCamera_Sau(String camera_Sau) {
			this.camera_Sau = camera_Sau;
		}
		public String getCamera_Truoc() {
			return camera_Truoc;
		}
		public void setCamera_Truoc(String camera_Truoc) {
			this.camera_Truoc = camera_Truoc;
		}
		public String getHe_Dieu_Hanh() {
			return he_Dieu_Hanh;
		}
		public void setHe_Dieu_Hanh(String he_Dieu_Hanh) {
			this.he_Dieu_Hanh = he_Dieu_Hanh;
		}
		public String getBo_Nho() {
			return bo_Nho;
		}
		public void setBo_Nho(String bo_Nho) {
			this.bo_Nho = bo_Nho;
		}
		public String getRam() {
			return ram;
		}
		public void setRam(String ram) {
			this.ram = ram;
		}
		@Override
		public String toString() {
			return "Product [productID=" + productID + ", categoryID=" + categoryID + ", productName=" + productName
					+ ", brandID=" + brandID + ", productImage=" + productImage + ", productImagenext="
					+ productImagenext + ", productPrice=" + productPrice + ", productDescription=" + productDescription
					+ ", giam_Gia=" + giam_Gia + ", camera_Sau=" + camera_Sau + ", camera_Truoc=" + camera_Truoc
					+ ", he_Dieu_Hanh=" + he_Dieu_Hanh + ", bo_Nho=" + bo_Nho + ", ram=" + ram + "]";
		}
	   
		
}
