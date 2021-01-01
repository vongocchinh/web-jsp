/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.admin;

import java.sql.Timestamp;
import java.util.Date;


public class Review {
    private int reviewID;
    private int productID;
    private String reviewName;
    private String reviewEmail;
    private int reviewStar;
    private String reviewMessage;
    private Timestamp reviewDate;
    
    public Review(int productID, String reviewName, String reviewEmail, int reviewStar, String reviewMessage,
			Timestamp reviewDate) {
		super();
		this.productID = productID;
		this.reviewName = reviewName;
		this.reviewEmail = reviewEmail;
		this.reviewStar = reviewStar;
		this.reviewMessage = reviewMessage;
		this.reviewDate = reviewDate;
	}

	public Review() {
        
    }

    public Review(int reviewID, int productID, String reviewName, String reviewEmail, int reviewStar, String reviewMessage,Timestamp date) {
        this.reviewID = reviewID;
        this.productID = productID;
        this.reviewName = reviewName;
        this.reviewEmail = reviewEmail;
        this.reviewStar = reviewStar;
        this.reviewMessage = reviewMessage;
        this.reviewDate =date;
    }

 

	public int getReviewID() {
        return reviewID;
    }

    public void setReviewID(int reviewID) {
        this.reviewID = reviewID;
    }

    public int getProductID() {
        return productID;
    }

    @Override
	public String toString() {
		return "Review [reviewID=" + reviewID + ", productID=" + productID + ", reviewName=" + reviewName
				+ ", reviewEmail=" + reviewEmail + ", reviewStar=" + reviewStar + ", reviewMessage=" + reviewMessage
				+ ", reviewDate=" + reviewDate + "]";
	}

	public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getReviewName() {
        return reviewName;
    }

    public void setReviewName(String reviewName) {
        this.reviewName = reviewName;
    }

    public String getReviewEmail() {
        return reviewEmail;
    }

    public void setReviewEmail(String reviewEmail) {
        this.reviewEmail = reviewEmail;
    }

    public int getReviewStar() {
        return reviewStar;
    }

    public void setReviewStar(int reviewStar) {
        this.reviewStar = reviewStar;
    }

    public String getReviewMessage() {
        return reviewMessage;
    }

    public void setReviewMessage(String reviewMessage) {
        this.reviewMessage = reviewMessage;
    }

    public Timestamp getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Timestamp reviewDate) {
        this.reviewDate = reviewDate;
    }

    
    
}
