package get.admin;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


import model.admin.BillDetail;



public class BillDetailGet {

    public void insertBillDetail(BillDetail bd) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO bill_detail VALUES(?,?,?,?,?)";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, bd.getBillDetailID());
        ps.setInt(2, bd.getBillID());
        ps.setInt(3, bd.getProductID());
        ps.setDouble(4, bd.getPrice());
        ps.setInt(5, bd.getQuantity());
        ps.executeUpdate();
    }
    public ArrayList<BillDetail> getListBilldetail() {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "SELECT * FROM bill_detail";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<BillDetail> list = new ArrayList<>();
            while (rs.next()) {
            	 BillDetail billdetail = new BillDetail();
                 billdetail.setBillDetailID(rs.getInt("bill_detail_id")); 
                 billdetail.setBillID(rs.getInt("bill_id")); 
                 billdetail.setProductID(rs.getInt("product_id")); 
                 billdetail.setPrice(rs.getInt("bill_detail_price")); 
                 billdetail.setQuantity(rs.getInt("bill_detail_quantity")); 
                list.add(billdetail);
            }
            connection.close();
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BillGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public ArrayList<BillDetail> getProductNameByBillID(int bill_id) {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "SELECT * FROM bill_detail WHERE bill_id = '" + bill_id + "'";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<BillDetail> list = new ArrayList<>();
            while (rs.next()) {
                BillDetail billdetail = new BillDetail();
                billdetail.setBillDetailID(rs.getInt("bill_detail_id")); 
                billdetail.setBillID(rs.getInt("bill_id")); 
                billdetail.setProductID(rs.getInt("product_id")); 
                billdetail.setPrice(rs.getInt("bill_detail_price")); 
                billdetail.setQuantity(rs.getInt("bill_detail_quantity")); 
                list.add(billdetail);
            }
            connection.close();
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BillDetailGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public BillDetail getBillDetail(int bill_id) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM bill_detail WHERE bill_id = '" + bill_id + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        BillDetail billdetail = new BillDetail();
        while (rs.next()) {
            
        	  
              billdetail.setBillDetailID(rs.getInt("bill_detail_id")); 
              billdetail.setBillID(rs.getInt("bill_id")); 
              billdetail.setProductID(rs.getInt("product_id")); 
              billdetail.setPrice(rs.getInt("bill_detail_price")); 
              billdetail.setQuantity(rs.getInt("bill_detail_quantity")); 
             
        }
        connection.close();
        return billdetail;
   }
    public boolean delete(int bill_id) throws SQLException {
	    try {
	        Connection connection = DBConnect.getConnecttion();
	        String sql = "DELETE FROM bill WHERE bill_id = ?";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ps.setLong(1, bill_id);
	        int temp = ps.executeUpdate();
	            return temp == 1;
	    } catch (Exception e) {
	        return false;
	    }
	}
    public static void main(String[] args) throws SQLException {
        
        BillDetailGet billDetailGet=new BillDetailGet();
        for(BillDetail billDetail:billDetailGet.getListBilldetail()) {
        	System.out.println(billDetail.toString());
        }
    }

}
