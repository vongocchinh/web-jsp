package model.admin;

public class slider {
	private int slider_id;
	private int product_id;
	private String slider_name;
	public slider(int product_id, String slider_name, String images_slider) {
		super();
		this.product_id = product_id;
		this.slider_name = slider_name;
		this.images_slider = images_slider;
	}
	public slider(int slider_id, int product_id, String slider_name, String images_slider) {
		super();
		this.slider_id = slider_id;
		this.product_id = product_id;
		this.slider_name = slider_name;
		this.images_slider = images_slider;
	}
	public String getSlider_name() {
		return slider_name;
	}
	public void setSlider_name(String slider_name) {
		this.slider_name = slider_name;
	}
	private String images_slider;
	public slider(int slider_id, int product_id, String images_slider) {
		super();
		this.slider_id = slider_id;
		this.product_id = product_id;
		this.images_slider = images_slider;
	}
	public slider(int product_id, String images_slider) {
		super();
		this.product_id = product_id;
		this.images_slider = images_slider;
	}
	public slider() {
		super();
	}
	public int getSlider_id() {
		return slider_id;
	}
	public void setSlider_id(int slider_id) {
		this.slider_id = slider_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getImages_slider() {
		return images_slider;
	}
	public void setImages_slider(String images_slider) {
		this.images_slider = images_slider;
	}
	@Override
	public String toString() {
		return "slider [slider_id=" + slider_id + ", product_id=" + product_id + ", images_slider=" + images_slider
				+ "]";
	}
	
}
