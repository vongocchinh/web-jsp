package model.admin;

import java.sql.Timestamp;

public class Comment {
private int comment_id;
private int review_id;

private String comment;
private String comment_name;
private Timestamp date;
private int product_id;
public Comment(int review_id, String comment, String comment_name, Timestamp date) {
	super();
	this.review_id = review_id;
	this.comment = comment;
	this.comment_name = comment_name;
	this.date = date;
}
public int getProduct_id() {
	return product_id;
}
public void setProduct_id(int product_id) {
	this.product_id = product_id;
}
public Comment(int comment_id, int review_id, String comment, String comment_name, Timestamp date, int product_id) {
	super();
	this.comment_id = comment_id;
	this.review_id = review_id;
	this.comment = comment;
	this.comment_name = comment_name;
	this.date = date;
	this.product_id = product_id;
}
public Comment(int review_id, String comment, String comment_name, Timestamp date, int product_id) {
	super();
	this.review_id = review_id;
	this.comment = comment;
	this.comment_name = comment_name;
	this.date = date;
	this.product_id = product_id;
}
public Comment(int comment_id, int review_id, String comment, String comment_name, Timestamp date) {
	super();
	this.comment_id = comment_id;
	this.review_id = review_id;
	this.comment = comment;
	this.comment_name = comment_name;
	this.date = date;
}
public Comment() {
	super();
}
public int getComment_id() {
	return comment_id;
}
public void setComment_id(int comment_id) {
	this.comment_id = comment_id;
}
public int getReview_id() {
	return review_id;
}
public void setReview_id(int review_id) {
	this.review_id = review_id;
}
public String getComment() {
	return comment;
}
public void setComment(String comment) {
	this.comment = comment;
}
public String getComment_name() {
	return comment_name;
}
public void setComment_name(String comment_name) {
	this.comment_name = comment_name;
}
public Timestamp getDate() {
	return date;
}
public void setDate(Timestamp date) {
	this.date = date;
}
@Override
public String toString() {
	return "Comment [comment_id=" + comment_id + ", review_id=" + review_id + ", comment=" + comment + ", comment_name="
			+ comment_name + ", date=" + date + ", product_id=" + product_id + "]";
}

}
