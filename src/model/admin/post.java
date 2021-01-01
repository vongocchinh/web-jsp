package model.admin;

public class post {
private int post_id;
private String post_name;
private String post_post;
private String img;
public post(int post_id, String post_name, String post_post,String img) {
	super();
	this.post_id = post_id;
	this.post_name = post_name;
	this.post_post = post_post;
	this.img=img;
}
public post(String post_name, String post_post,String img) {
	super();
	this.post_name = post_name;
	this.post_post = post_post;
	this.img=img;
}
public post() {
	super();
}
public int getPost_id() {
	return post_id;
}
public void setPost_id(int post_id) {
	this.post_id = post_id;
}
public String getPost_name() {
	return post_name;
}
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public void setPost_name(String post_name) {
	this.post_name = post_name;
}
public String getPost_post() {
	return post_post;
}
public void setPost_post(String post_post) {
	this.post_post = post_post;
}
@Override
public String toString() {
	return "post [post_id=" + post_id + ", post_name=" + post_name + ", post_post=" + post_post + "]";
}

}
