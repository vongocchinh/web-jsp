package get.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;

import java.util.logging.Level;
import java.util.logging.Logger;

import connect.DBConnect;

import model.admin.Comment;


public class cmtGet {
	 public void insertcmt(Comment bd) throws SQLException {
	        Connection connection = DBConnect.getConnecttion();
	        String sql = "INSERT INTO cmt VALUES(?,?,?,?,?,?)";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ps.setInt(1, bd.getComment_id());
	        ps.setInt(2, bd.getReview_id());
	        ps.setString(3, bd.getComment());
	        ps.setString(4,bd.getComment_name() );
	        ps.setTimestamp(5, bd.getDate());
	        ps.setInt(6, bd.getProduct_id());
	        ps.executeUpdate();
	    }
	 public int countTotalCmt() throws SQLException{
		    Connection connection = DBConnect.getConnecttion();
		    String sql = "SELECT count(cmt_id) FROM cmt WHERE cmt_id != 0";
		    PreparedStatement ps = connection.prepareCall(sql);
		    ResultSet rs = ps.executeQuery();
		    int count = 0;
		    while (rs.next()) {
		        count = rs.getInt(1);
		    }
		    connection.close();
		    return count;  
		}
	    public ArrayList<Comment> getListCmt() {
	        try {
	            Connection connection = DBConnect.getConnecttion();
	            String sql = "SELECT * FROM cmt";
	            PreparedStatement ps = connection.prepareCall(sql);
	            ResultSet rs = ps.executeQuery();
	            ArrayList<Comment> list = new ArrayList<>();
	            while (rs.next()) {
	            	 Comment billdetail = new Comment();
	                 billdetail.setComment_id(rs.getInt("cmt_id")); 
	                 billdetail.setReview_id(rs.getInt("review_id")); 
	                 billdetail.setComment(rs.getString("cmt")); 
	                 billdetail.setComment_name(rs.getString("cmt_name")); 
	                 billdetail.setDate(rs.getTimestamp("cmt_date"));
	                 billdetail.setProduct_id(rs.getInt("product_id"));
	                list.add(billdetail);
	            }
	            connection.close();
	            return list;
	        } catch (SQLException ex) {
	            Logger.getLogger(cmtGet.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        return null;
	    }
	    public ArrayList<Comment> getProductNameByReview(int review_id) {
	        try {
	            Connection connection = DBConnect.getConnecttion();
	            String sql = "SELECT * FROM cmt WHERE review_id = '" + review_id + "'";
	            PreparedStatement ps = connection.prepareCall(sql);
	            ResultSet rs = ps.executeQuery();
	            ArrayList<Comment> list = new ArrayList<>();
	            while (rs.next()) {
	                Comment billdetail = new Comment();
	                billdetail.setComment_id(rs.getInt("cmt_id")); 
	                 billdetail.setReview_id(rs.getInt("review_id")); 
	                 billdetail.setComment(rs.getString("cmt")); 
	                 billdetail.setComment_name(rs.getString("cmt_name")); 
	                 billdetail.setDate(rs.getTimestamp("cmt_date")); 
	                 billdetail.setProduct_id(rs.getInt("product_id"));
	                list.add(billdetail);
	            }
	            connection.close();
	            return list;
	        } catch (SQLException ex) {
	            Logger.getLogger(cmtGet.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        return null;
	    }
	    public Comment getcmt(int review_id) throws SQLException {
	        Connection connection = DBConnect.getConnecttion();
	        String sql = "SELECT * FROM cmt WHERE review_id = '" + review_id + "'";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ResultSet rs = ps.executeQuery();
	        Comment billdetail = new Comment();
	        while (rs.next()) {
	            
	        	billdetail.setComment_id(rs.getInt("cmt_id")); 
                billdetail.setReview_id(rs.getInt("review_id")); 
                billdetail.setComment(rs.getString("cmt")); 
                billdetail.setComment_name(rs.getString("cmt_name")); 
                billdetail.setDate(rs.getTimestamp("cmt_date"));
                billdetail.setProduct_id(rs.getInt("product_id"));
	             
	        }
	        connection.close();
	        return billdetail;
	   }
	    public boolean delete_(int cmt_id) throws SQLException {
		    try {
		        Connection connection = DBConnect.getConnecttion();
		        String sql = "DELETE FROM cmt WHERE cmt_id = ?";
		        PreparedStatement ps = connection.prepareCall(sql);
		        ps.setLong(1, cmt_id);
		        int temp = ps.executeUpdate();
		            return temp == 1;
		    } catch (Exception e) {
		        return false;
		    }
		}
	    public static void main(String[] args) throws SQLException {
	        
	       cmtGet cm=new cmtGet();
	       //cm.insertcmt(new Comment(1,"abc","abc",new Timestamp(new Date().getTime())));
	      System.out.println(cm.countTotalCmt());
	    }


}
