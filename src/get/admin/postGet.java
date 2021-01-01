package get.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import connect.DBConnect;

import model.admin.post;

public class postGet {
	public ArrayList<post> getPost() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM iphoneshop.post";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<post> list = new ArrayList<>();
        while (rs.next()) {
            post user = new post();
           user.setPost_id(rs.getInt("post_id"));
           user.setPost_name(rs.getString("post_name"));
          
           user.setPost_post(rs.getString("post_post"));
           user.setImg(rs.getString("post_img"));
          
           list.add(user);
        }
        connection.close();
        return list;
    }
	public ArrayList<post> getPost_5() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM iphoneshop.post ORDER BY RAND() LIMIT 5";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<post> list = new ArrayList<>();
        while (rs.next()) {
            post user = new post();
           user.setPost_id(rs.getInt("post_id"));
           user.setPost_name(rs.getString("post_name"));
          
           user.setPost_post(rs.getString("post_post"));
           user.setImg(rs.getString("post_img"));
          
           list.add(user);
        }
        connection.close();
        return list;
    }
	public ArrayList<post> getbaiviet(int post_id) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM iphoneshop.post WHERE post_id='"+post_id+"'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<post> list = new ArrayList<>();
        while (rs.next()) {
            post user = new post();
           user.setPost_id(rs.getInt("post_id"));
           user.setPost_name(rs.getString("post_name"));
          
           user.setPost_post(rs.getString("post_post"));
           user.setImg(rs.getString("post_img"));
           list.add(user);
        }
        connection.close();
        return list;
    }
 public boolean insertPost(post u) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO post VALUES(?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, u.getPost_id());
           
            ps.setString(2, u.getPost_name());
            ps.setString(3, u.getPost_post());
            ps.setString(4,u.getImg());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(QCGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
 public post getpost(int qc_id) throws SQLException {
     Connection connection = DBConnect.getConnecttion();
     String sql = "SELECT * FROM post WHERE post_id = '" + qc_id + "'";
     PreparedStatement ps = connection.prepareCall(sql);
     ResultSet rs = ps.executeQuery();
     post user = new post();
     while (rs.next()) {
    	 user.setPost_id(rs.getInt("post_id"));
         user.setPost_name(rs.getString("post_name"));
        
         user.setPost_post(rs.getString("post_post"));
         user.setImg(rs.getString("post_img"));
           
     }
     connection.close();
     return user;
}
 public boolean updateSlider(post u)  {
        
        Connection connection = DBConnect.getConnecttion();
        String sql = "UPDATE post SET post_id=?,post_name=?,post_post=? ,post_img=? WHERE post_id = ?";
        
        try {
            PreparedStatement ps = connection.prepareCall(sql);
          ps.setInt(1, u.getPost_id());
            ps.setString(2, u.getPost_name());
          
            ps.setString(3, u.getPost_post());
            ps.setString(4,u.getImg());
            ps.setInt(5, u.getPost_id());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ProductGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
     public boolean delete(int qc_id) {
         
         Connection connection = DBConnect.getConnecttion();
         String sql = "DELETE FROM post WHERE post_id= ?";
         
         try {
             PreparedStatement ps = connection.prepareCall(sql);
          ps.setInt(1, qc_id);
             return ps.executeUpdate() == 1;
         } catch (SQLException ex) {
        	   return false;
         }
      
     }
}
