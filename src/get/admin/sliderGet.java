package get.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import connect.DBConnect;
import model.admin.slider;



public class sliderGet {
	 public ArrayList<slider> getListUser() throws SQLException {
	        Connection connection = DBConnect.getConnecttion();
	        String sql = "SELECT * FROM slider";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ResultSet rs = ps.executeQuery();
	        ArrayList<slider> list = new ArrayList<>();
	        while (rs.next()) {
	            slider user = new slider();
	           user.setSlider_id(rs.getInt("slider_id"));
	           user.setProduct_id(rs.getInt("product_id"));
	           user.setSlider_name(rs.getString("slider_name"));
	           user.setImages_slider(rs.getString("slider_images"));
	          
	           list.add(user);
	        }
	        connection.close();
	        return list;
	    }
	 public boolean insertSlider(slider u) {
	        Connection connection = DBConnect.getConnecttion();
	        String sql = "INSERT INTO slider VALUES(?,?,?,?)";
	        try {
	            PreparedStatement ps = connection.prepareCall(sql);
	            ps.setInt(1, u.getSlider_id());
	            ps.setInt(2, u.getProduct_id());
	            ps.setString(3, u.getSlider_name());
	            ps.setString(4, u.getImages_slider());
	            
	            ps.executeUpdate();
	            return true;
	        } catch (SQLException ex) {
	            Logger.getLogger(sliderGet.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        return false;
	    }
	 public slider getSlider(int slider_id) throws SQLException {
	     Connection connection = DBConnect.getConnecttion();
	     String sql = "SELECT * FROM slider WHERE slider_id = '" + slider_id + "'";
	     PreparedStatement ps = connection.prepareCall(sql);
	     ResultSet rs = ps.executeQuery();
	     slider slider = new slider();
	     while (rs.next()) {
	         
	    	 slider.setSlider_id(rs.getInt("slider_id"));
	    	 slider.setProduct_id(rs.getInt("product_id"));
	    	 slider.setSlider_name(rs.getString("slider_name"));
	    	 slider.setImages_slider(rs.getString("slider_images"));
	           
	     }
	     connection.close();
	     return slider;
	}
	 public boolean updateSlider(slider u)  {
	        
	        Connection connection = DBConnect.getConnecttion();
	        String sql = "UPDATE slider SET slider_id=?, product_id=?,slider_name=?, slider_images=? WHERE slider_id = ?";
	        
	        try {
	            PreparedStatement ps = connection.prepareCall(sql);
	          ps.setInt(1, u.getSlider_id());
	            ps.setInt(2, u.getProduct_id());
	          
	            ps.setString(3, u.getSlider_name());
	            ps.setString(4, u.getImages_slider());
	            ps.setInt(5, u.getSlider_id());
	            return ps.executeUpdate() == 1;
	        } catch (SQLException ex) {
	            Logger.getLogger(sliderGet.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        return false;
	    }
	     public boolean delete(int slider_id) {
	         
	         Connection connection = DBConnect.getConnecttion();
	         String sql = "DELETE FROM slider WHERE slider_id= ?";
	         
	         try {
	             PreparedStatement ps = connection.prepareCall(sql);
	          ps.setInt(1, slider_id);
	             return ps.executeUpdate() == 1;
	         } catch (SQLException ex) {
	        	   return false;
	         }
	      
	     }
	     public static void main(String args[]) throws SQLException {
	    	 sliderGet sliderGet=new sliderGet();
	    	// sliderGet.insertSlider(new slider(1,1,"1"));
	    	 //sliderGet.delete(1);
	    	// sliderGet.updateSlider(new slider(1,30,"2","3"));
	    	 for(slider sl:sliderGet.getListUser()) {
	    		 System.out.println(sl.toString());
	    	 }
	     }
	 
	 
}
