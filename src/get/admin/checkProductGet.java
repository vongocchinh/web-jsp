package get.admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import connect.DBConnect;
import model.admin.chechProduct;

public class checkProductGet {
	 public ArrayList<chechProduct> getListUser() throws SQLException {
	        Connection connection = DBConnect.getConnecttion();
	        String sql = "SELECT * FROM iphoneshop.checkProduct";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ResultSet rs = ps.executeQuery();
	        ArrayList<chechProduct> list = new ArrayList<>();
	        while (rs.next()) {
	            chechProduct user = new chechProduct();
	         
	          
	           list.add(user);
	        }
	        connection.close();
	        return list;
	    }
	 public boolean insertcheck(chechProduct u) {
	        Connection connection = DBConnect.getConnecttion();
	        String sql = "INSERT INTO checkProduct VALUES(?,?,?)";
	        try {
	            PreparedStatement ps = connection.prepareCall(sql);
	         
	            
	            ps.executeUpdate();
	            return true;
	        } catch (SQLException ex) {
	            Logger.getLogger(checkProductGet.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        return false;
	    }
	 public chechProduct getcheck(int checkProductID) throws SQLException {
	     Connection connection = DBConnect.getConnecttion();
	     String sql = "SELECT * FROM checkProduct WHERE checkProductID = '" + checkProductID + "'";
	     PreparedStatement ps = connection.prepareCall(sql);
	     ResultSet rs = ps.executeQuery();
	     chechProduct chechProduct = new chechProduct();
	     while (rs.next()) {
	         
	    	
	           
	     }
	     return chechProduct;
	}
	 public boolean updatecheckProduct(chechProduct u)  {
	        
	        Connection connection = DBConnect.getConnecttion();
	        String sql = "UPDATE checkProduct SET ";
	        
	        try {
	            PreparedStatement ps = connection.prepareCall(sql);
	        //  ps.setInt(1, u.getSlider_id());
	           
	            return ps.executeUpdate() == 1;
	        } catch (SQLException ex) {
	            Logger.getLogger(checkProductGet.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        return false;
	    }
	     public boolean delete(int checkProductID) {
	         
	         Connection connection = DBConnect.getConnecttion();
	         String sql = "DELETE FROM checkProduct WHERE checkProductID= ?";
	         
	         try {
	             PreparedStatement ps = connection.prepareCall(sql);
	         // ps.setInt(1, slider_id);
	             return ps.executeUpdate() == 1;
	         } catch (SQLException ex) {
	        	   return false;
	         }
	      
	     }
	     public static void main(String args[]) throws SQLException {
	    	 
	     }
	 
}
