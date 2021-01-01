package get.admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import connect.DBConnect;
import model.admin.mucQC;

public class mucQCGet {
	public ArrayList<mucQC> getmucQC() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM iphoneshop.mucqc";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<mucQC> list = new ArrayList<>();
        while (rs.next()) {
            mucQC user = new mucQC();
           user.setMuc_id(rs.getInt("muc_id"));
           
           user.setMuc_Name(rs.getString("muc_Name"));
          
           list.add(user);
        }
        connection.close();
        return list;
    }
 public boolean insertmucQc(mucQC u) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO mucqc VALUES(?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, u.getMuc_id());
           
            ps.setString(2, u.getMuc_Name());
            
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(QCGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
 public mucQC getmucQc(int muc_id) throws SQLException {
     Connection connection = DBConnect.getConnecttion();
     String sql = "SELECT * FROM mucqc WHERE muc_id = '" + muc_id + "'";
     PreparedStatement ps = connection.prepareCall(sql);
     ResultSet rs = ps.executeQuery();
     mucQC slider = new mucQC();
     while (rs.next()) {
    	 
    	 slider.setMuc_id(rs.getInt("muc_id"));
    	 
    	 slider.setMuc_Name(rs.getString("muc_Name"));
    	 
           
     }
     connection.close();
     return slider;
}
 public boolean updatemucQc(mucQC u)  {
        
        Connection connection = DBConnect.getConnecttion();
        String sql = "UPDATE mucqc SET muc_id=?,muc_Name=? WHERE muc_id = ?";
        
        try {
            PreparedStatement ps = connection.prepareCall(sql);
          ps.setInt(1, u.getMuc_id());
            
            ps.setString(2, u.getMuc_Name());
            ps.setInt(3, u.getMuc_id());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ProductGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
     public boolean delete(int muc_id) {
         
         Connection connection = DBConnect.getConnecttion();
         String sql = "DELETE FROM mucqc WHERE muc_id= ?";
         
         try {
             PreparedStatement ps = connection.prepareCall(sql);
          ps.setInt(1, muc_id);
             return ps.executeUpdate() == 1;
         } catch (SQLException ex) {
        	   return false;
         }
      
     }
     public static void main(String args[]) throws SQLException {
    	mucQCGet mucQCGet=new mucQCGet();
    	mucQCGet.delete(8);
    	
     }
}
