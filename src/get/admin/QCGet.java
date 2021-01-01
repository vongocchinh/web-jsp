package get.admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import connect.DBConnect;
import model.admin.QC;

public class QCGet {
	public ArrayList<QC> getQC() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM iphoneshop.qc";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<QC> list = new ArrayList<>();
        while (rs.next()) {
            QC user = new QC();
           user.setQC_id(rs.getInt("qc_id"));
           user.setProduct_id(rs.getInt("product_id"));
          user.setMucQC(rs.getInt("muc_id"));
           user.setImages_QC(rs.getString("images_qc"));
          
           list.add(user);
        }
        connection.close();
        return list;
    }
	public ArrayList<QC> getQC_muc_qc(int muc_id) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM iphoneshop.qc WHERE muc_id='"+muc_id+"'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<QC> list = new ArrayList<>();
        while (rs.next()) {
            QC user = new QC();
           user.setQC_id(rs.getInt("qc_id"));
           user.setProduct_id(rs.getInt("product_id"));
          user.setMucQC(rs.getInt("muc_id"));
           user.setImages_QC(rs.getString("images_qc"));
          
           list.add(user);
        }
        connection.close();
        return list;
    }
 public boolean insertSlider(QC u) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO qc VALUES(?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, u.getQC_id());
            ps.setInt(3, u.getProduct_id());
            ps.setInt(2, u.getMucQC());
            ps.setString(4, u.getImages_QC());
            
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(QCGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
 public QC getQc(int qc_id) throws SQLException {
     Connection connection = DBConnect.getConnecttion();
     String sql = "SELECT * FROM qc WHERE qc_id = '" + qc_id + "'";
     PreparedStatement ps = connection.prepareCall(sql);
     ResultSet rs = ps.executeQuery();
     QC slider = new QC();
     while (rs.next()) {
    	 
    	 slider.setQC_id(rs.getInt("qc_id"));
    	 slider.setProduct_id(rs.getInt("product_id"));
    	 slider.setMucQC(rs.getInt("muc_id"));
    	 slider.setImages_QC(rs.getString("images_qc"));
    	 
           
     }
     connection.close();
     return slider;
}
 public boolean updateSlider(QC u)  {
        
        Connection connection = DBConnect.getConnecttion();
        String sql = "UPDATE qc SET qc_id=?,product_id=?,muc_id=? , images_qc=? WHERE qc_id = ?";
        
        try {
            PreparedStatement ps = connection.prepareCall(sql);
          ps.setInt(1, u.getQC_id());
            ps.setInt(2, u.getQC_id());
          
            ps.setInt(3, u.getMucQC());
            ps.setString(4, u.getImages_QC());
            ps.setInt(5, u.getQC_id());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ProductGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
     public boolean delete(int qc_id) {
         
         Connection connection = DBConnect.getConnecttion();
         String sql = "DELETE FROM qc WHERE qc_id= ?";
         
         try {
             PreparedStatement ps = connection.prepareCall(sql);
          ps.setInt(1, qc_id);
             return ps.executeUpdate() == 1;
         } catch (SQLException ex) {
        	   return false;
         }
      
     }
     public static void main(String args[]) throws SQLException {
    	
     }
}
