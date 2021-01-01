/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.admin;

import java.sql.Timestamp;


public class Newsletter {
    private int newsletterID;
    private String newsletterName;
    private Timestamp date;
    
    public Newsletter(){
        
    }

	public Newsletter(int newsletterID, String newsletterName, Timestamp date) {
		super();
		this.newsletterID = newsletterID;
		this.newsletterName = newsletterName;
		this.date = date;
	}

	public Newsletter(String newsletterName, Timestamp date) {
		super();
		this.newsletterName = newsletterName;
		this.date = date;
	}

	public int getNewsletterID() {
		return newsletterID;
	}

	public void setNewsletterID(int newsletterID) {
		this.newsletterID = newsletterID;
	}

	public String getNewsletterName() {
		return newsletterName;
	}

	public void setNewsletterName(String newsletterName) {
		this.newsletterName = newsletterName;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Newsletter [newsletterID=" + newsletterID + ", newsletterName=" + newsletterName + ", date=" + date
				+ "]";
	}

   
}
