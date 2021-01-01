/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.admin;

public class Item {
 
    private Product product;
    private int quantity;
    private int total;
 
    public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Item(Product product, int quantity, int total) {
		super();
		this.product = product;
		this.quantity = quantity;
		this.total = total;
	}

	public Item() {
    }
 
    public Item(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }
 
    public Product getProduct() {
        return product;
    }
 
    public void setProduct(Product product) {
        this.product = product;
    }
 
    public int getQuantity() {
        return quantity;
    }
 
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
 
}
