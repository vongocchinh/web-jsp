package get.admin;

import connect.DBConnect;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;

import java.util.logging.Level;
import java.util.logging.Logger;

import model.admin.Review;


public class ReviewGet {
    public ArrayList<Review> getListReviewByProduct(int product_id) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM review WHERE product_id = '" + product_id + "'  ORDER BY review_id DESC LIMIT 3";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Review> list = new ArrayList<>();
        while (rs.next()) {
            
            Review review = new Review();
            review.setReviewID(rs.getInt("review_id"));
           review.setReviewDate(rs.getTimestamp("date"));
           review.setReviewName(rs.getString("review_name"));
           review.setReviewStar(rs.getInt("review_star"));
           review.setReviewMessage(rs.getString("review_message"));
           review.setProductID(rs.getInt("product_id"));
           review.setReviewEmail(rs.getString("review_email"));
           list.add(review);
        }
        connection.close();
        return list;
    }
    public Review getReview(int reviewID) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql =  "SELECT * FROM review WHERE review_id = '" + reviewID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Review review = new Review();
        while (rs.next()) {
            review.setReviewID(rs.getInt("review_id"));
            review.setReviewName(rs.getString("review_name"));
            review.setReviewStar(rs.getInt("review_star"));
            review.setReviewMessage(rs.getString("review_message"));
           
        }
        connection.close();
        return review;
    }
    
public boolean insertReview(Review c) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO review VALUES(?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
         ps.setLong(1, c.getReviewID());
         ps.setLong(2, c.getProductID());
         ps.setString(3, c.getReviewName());
         ps.setString(4, c.getReviewEmail());
         ps.setInt(5, c.getReviewStar());
         ps.setString(6, c.getReviewMessage());
         ps.setTimestamp(7, c.getReviewDate());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ReviewGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        connection.close();
        return false;
    }
public int countTotalReview() throws SQLException{
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT count(review_id) FROM review WHERE review_id != 0";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    int count = 0;
    while (rs.next()) {
        count = rs.getInt(1);
    }
    connection.close();
    return count;  
}
public int countTotalReview_product(int product_id) throws SQLException{
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT count(review_id) FROM review WHERE review_id != 0 AND product_id = '"+product_id+"'";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    int count = 0;
    while (rs.next()) {
        count = rs.getInt(1);
    }
    connection.close();
    return count;  
}
public int max(int product_id) throws SQLException{
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT MAX(count(review_star)) FROM review WHERE review_id != 0 AND product_id = '"+product_id+"'";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    int count = 0;
    while (rs.next()) {
        count = rs.getInt(1);
    }
    connection.close();
    return count;  
}
public int countTotalReview_product_level(int product_id,int level) throws SQLException{
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT count(review_id) FROM review WHERE review_id != 0 AND product_id = '"+product_id+"' AND review_star= '"+level+"' ";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    int count = 0;
    while (rs.next()) {
        count = rs.getInt(1);
    }
    connection.close();
    return count;  
}
public int countTotalReview_product_level0(int product_id) throws SQLException{
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT count(review_id) FROM review WHERE review_id != 0 AND product_id = '"+product_id+"' AND review_star= 0 ";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    int count = 0;
    while (rs.next()) {
        count = rs.getInt(1);
    }
    connection.close();
    return count;  
}
public int countTotalReview_product_level1(int product_id) throws SQLException{
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT count(review_id) FROM review WHERE review_id != 0 AND product_id = '"+product_id+"' AND review_star= 1 ";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    int count = 0;
    while (rs.next()) {
        count = rs.getInt(1);
    }
    connection.close();
    return count;  
}

public int countTotalReview_product_level2(int product_id) throws SQLException{
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT count(review_id) FROM review WHERE review_id != 0 AND product_id = '"+product_id+"' AND review_star= 2 ";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    int count = 0;
    while (rs.next()) {
        count = rs.getInt(1);
    }
    connection.close();
    return count;  
}
public int countTotalReview_product_level3(int product_id) throws SQLException{
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT count(review_id) FROM review WHERE review_id != 0 AND product_id = '"+product_id+"' AND review_star= 3 ";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    int count = 0;
    while (rs.next()) {
        count = rs.getInt(1);
    }
    connection.close();
    return count;  
}
public int countTotalReview_product_level4(int product_id) throws SQLException{
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT count(review_id) FROM review WHERE review_id != 0 AND product_id = '"+product_id+"' AND review_star= 4 ";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    int count = 0;
    while (rs.next()) {
        count = rs.getInt(1);
    }
    return count;  
}
public int countTotalReview_product_level5(int product_id) throws SQLException{
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT count(review_id) FROM review WHERE review_id != 0 AND product_id = '"+product_id+"' AND review_star= 5 ";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    int count = 0;
    while (rs.next()) {
        count = rs.getInt(1);
    }
    connection.close();
    return count;  
}
public boolean insert(Review c) throws SQLException {
    try {
         Connection connection = DBConnect.getConnecttion();
         String sql = "INSERT INTO review VALUE(?,?,?,?,?,?)";
         PreparedStatement ps = connection.prepareCall(sql);
         ps.setLong(1, c.getReviewID());
         ps.setLong(2, c.getProductID());
         ps.setString(3, c.getReviewName());
         ps.setString(4, c.getReviewEmail());
         ps.setInt(5, c.getReviewStar());
         ps.setString(6, c.getReviewMessage());
        ps.setTimestamp(7, c.getReviewDate());
         int temp = ps.executeUpdate();
         return temp == 1;
    } catch (Exception e) {
         return false;
    }
}
public static void main(String args[]) throws SQLException{
//	ReviewGet reviewGet=new ReviewGet();
//	
//	Scanner scanner=new Scanner(System.in);
//	Date date=new Date();
//	
//		Review review=new Review(1, "x", "xx", 3, "XXX", new Timestamp(date.getTime()));
//		
//		
//		for(Review rv:reviewGet.getListReviewByProduct(1)) {
//			System.out.println(rv.toString());
//		}
//		System.out.println(reviewGet.countTotalReview());
//}
}
}
