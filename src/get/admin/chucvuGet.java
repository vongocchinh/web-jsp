package get.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBConnect;

import model.admin.chucvu;

public class chucvuGet {
	 public ArrayList<chucvu> getListChucVy() throws SQLException {
	        Connection connection = DBConnect.getConnecttion();
	        String sql = "SELECT * FROM iphoneshop.chucvu";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ResultSet rs = ps.executeQuery();
	        ArrayList<chucvu> list = new ArrayList<>();
	        while (rs.next()) {
	            chucvu chucvu=new chucvu();
	            chucvu.setChucvu_id(rs.getInt("chucvu_id"));
	            chucvu.setChucvu_name(rs.getString("chucvu_name"));
	            chucvu.setChucvu_luong(rs.getInt("chucvu_luong"));
	            list.add(chucvu);
	        }
	        connection.close();
	        return list;
	    }
	 
	    public chucvu getCV(int brandID) throws SQLException {
	        Connection connection = DBConnect.getConnecttion();
	        String sql =  "SELECT * FROM chucvu WHERE chucvu_id = '" + brandID + "'";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ResultSet rs = ps.executeQuery();
	        chucvu brand = new chucvu();
	        while (rs.next()) {
	            
	        	brand.setChucvu_id(rs.getInt("chucvu_id"));
	            brand.setChucvu_name(rs.getString("chucvu_name"));
	            brand.setChucvu_luong(rs.getInt("chucvu_luong"));
	           
	        }
	        connection.close();
	        return brand;
	    }
	 	
}
