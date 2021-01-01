package model.admin;

public class chechProduct {
private int checkProduct_id;
private int prduct_id;
private boolean check_show;
private int quantity;
public chechProduct(int checkProduct_id, int prduct_id, boolean check_show, int quantity) {
	super();
	this.checkProduct_id = checkProduct_id;
	this.prduct_id = prduct_id;
	this.check_show = check_show;
	this.quantity = quantity;
}
public chechProduct(int prduct_id, boolean check_show, int quantity) {
	super();
	this.prduct_id = prduct_id;
	this.check_show = check_show;
	this.quantity = quantity;
}
public chechProduct() {
	super();
}
public int getCheckProduct_id() {
	return checkProduct_id;
}
public void setCheckProduct_id(int checkProduct_id) {
	this.checkProduct_id = checkProduct_id;
}
public int getPrduct_id() {
	return prduct_id;
}
public void setPrduct_id(int prduct_id) {
	this.prduct_id = prduct_id;
}
public boolean isCheck_show() {
	return check_show;
}
public void setCheck_show(boolean check_show) {
	this.check_show = check_show;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
@Override
public String toString() {
	return "chechProduct [checkProduct_id=" + checkProduct_id + ", prduct_id=" + prduct_id + ", check_show="
			+ check_show + ", quantity=" + quantity + "]";
}

}
