package model.admin;

public class Brand {
	private int BrandID;
	private String BrandName;
	public Brand(String brandName) {
		super();
		BrandName = brandName;
	}
	public Brand(int brandID, String brandName) {
		super();
		BrandID = brandID;
		BrandName = brandName;
	}
	public Brand() {
		super();
	}
	public int getBrandID() {
		return BrandID;
	}
	public void setBrandID(int brandID) {
		BrandID = brandID;
	}
	public String getBrandName() {
		return BrandName;
	}
	public void setBrandName(String brandName) {
		BrandName = brandName;
	}
	@Override
	public String toString() {
		return "Brand [BrandID=" + BrandID + ", BrandName=" + BrandName + "]";
	}
	
	
}
