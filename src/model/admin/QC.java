package model.admin;

public class QC {
	private int QC_id;
	private int product_id;
	private int mucQC;
	private String images_QC;
	
	public int getMucQC() {
		return mucQC;
	}
	public void setMucQC(int mucQC) {
		this.mucQC = mucQC;
	}
	public QC(int product_id, int mucQC, String images_QC) {
		super();
		this.product_id = product_id;
		this.mucQC = mucQC;
		this.images_QC = images_QC;
	}
	public QC(int qC_id, int product_id, int mucQC, String images_QC) {
		super();
		QC_id = qC_id;
		this.product_id = product_id;
		this.mucQC = mucQC;
		this.images_QC = images_QC;
	}
	public QC() {
		super();
	}
	public int getQC_id() {
		return QC_id;
	}
	public void setQC_id(int qC_id) {
		QC_id = qC_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getImages_QC() {
		return images_QC;
	}
	public void setImages_QC(String images_QC) {
		this.images_QC = images_QC;
	}
	@Override
	public String toString() {
		return "QC [QC_id=" + QC_id + ", product_id=" + product_id + ", mucQC=" + mucQC + ", images_QC=" + images_QC
				+ "]";
	}
	
}
