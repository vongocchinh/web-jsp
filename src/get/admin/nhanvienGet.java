package get.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBConnect;

import model.admin.nhanvien;

public class nhanvienGet {
	 public ArrayList<nhanvien> getListNhanVien() throws SQLException {
	        Connection connection = DBConnect.getConnecttion();
	        String sql = "SELECT * FROM iphoneshop.nhanvien";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ResultSet rs = ps.executeQuery();
	        ArrayList<nhanvien> list = new ArrayList<>();
	        while (rs.next()) {
	            nhanvien nhanvien = new nhanvien();
	           nhanvien.setNv_id(rs.getInt("nv_id"));
	           nhanvien.setNv_name(rs.getString("nv_name"));
	           nhanvien.setNv_mail(rs.getString("nv_mail"));
	           nhanvien.setNv_diachi(rs.getString("nv_address"));
	           nhanvien.setSdt(rs.getString("nv_phone"));
	           nhanvien.setChucvu_id(rs.getInt("chucvu_id"));
	           
	            list.add(nhanvien);
	        }
	        connection.close();
	        return list;
	    }
	  public int countTotaluser() throws SQLException{
		    Connection connection = DBConnect.getConnecttion();
		    String sql = "SELECT count(nv_id) FROM nhanvien WHERE nv_id != 0";
		    PreparedStatement ps = connection.prepareCall(sql);
		    ResultSet rs = ps.executeQuery();
		    int count = 0;
		    while (rs.next()) {
		        count = rs.getInt(1);
		    }
		    connection.close();
		    return count;  
		}
	  public nhanvien getNv(int brandID) throws SQLException {
	        Connection connection = DBConnect.getConnecttion();
	        String sql =  "SELECT * FROM nhanvien WHERE nv_id = '" + brandID + "'";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ResultSet rs = ps.executeQuery();
	        nhanvien nhanvien = new nhanvien();
	        while (rs.next()) {
	            
	        	 nhanvien.setNv_id(rs.getInt("nv_id"));
	        	 nhanvien.setNv_name(rs.getString("nv_name"));
		           nhanvien.setNv_mail(rs.getString("nv_mail"));
		           nhanvien.setNv_diachi(rs.getString("nv_address"));
		           nhanvien.setSdt(rs.getString("nv_phone"));
		           nhanvien.setChucvu_id(rs.getInt("chucvu_id"));
	           
	        }
	        return nhanvien;
	    }
	  public boolean insert(nhanvien c) throws SQLException {
		    try {
		         Connection connection = DBConnect.getConnecttion();
		         String sql = "INSERT INTO nhanvien VALUE(?,?,?,?,?,?)";
		         PreparedStatement ps = connection.prepareCall(sql);
		         ps.setInt(1, c.getChucvu_id());
		         ps.setString(2, c.getNv_name());
		         ps.setString(3, c.getNv_mail());
		         ps.setString(4, c.getNv_diachi());
		         ps.setString(5, c.getSdt());
		         ps.setInt(6, c.getChucvu_id());
		         int temp = ps.executeUpdate();
		         return temp == 1;
		    } catch (Exception e) {
		         return false;
		    }
		}
	  public boolean delete(int brand_id) throws SQLException {
		    try {
		        Connection connection = DBConnect.getConnecttion();
		        String sql = "DELETE FROM nhanvien WHERE nv_id = ?";
		        PreparedStatement ps = connection.prepareCall(sql);
		        ps.setInt(1, brand_id);
		        int temp = ps.executeUpdate();
		            return temp == 1;
		    } catch (Exception e) {
		        return false;
		    }
		}
	  public boolean update(nhanvien c) throws SQLException {
		    try {
		         Connection connection = DBConnect.getConnecttion();
		         String sql = "UPDATE nhanvien SET nv_name = ?,nv_mail=?,nv_address=?,nv_phone=?,chucvu_id=?  WHERE nv_id = ?";
		         PreparedStatement ps = connection.prepareCall(sql);
		         ps.setString(1, c.getNv_name());
		         ps.setString(2, c.getNv_mail());
		         ps.setString(3, c.getNv_diachi());
		         ps.setString(4, c.getSdt());
		         ps.setInt(5, c.getChucvu_id());
		         ps.setInt(6, c.getNv_id());
		         int temp = ps.executeUpdate();
		         return temp == 1;
		    } catch (Exception e) {
		         return false;
		    }
		}
}
