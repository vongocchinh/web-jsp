package get.admin;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;

import java.util.logging.Level;
import java.util.logging.Logger;
import model.admin.Bill;


public class BillGet {

    public void insertBill(Bill bill) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO bill VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, bill.getBillID());
        ps.setInt(2, bill.getUserID());
        ps.setInt(3, bill.getTotal());
        ps.setString(4, bill.getPayment());
        ps.setString(5, bill.getAddress());
        ps.setTimestamp(6, bill.getDate());
        ps.setString(7, bill.getName());
        ps.setString(8, bill.getPhone());
        ps.setString(9, bill.getHuyen());
        ps.setString(10, bill.getXa());
        ps.setString(11, bill.getSonha());
        ps.executeUpdate();
        connection.close();
    }
    
    public int countTotalBill() throws SQLException{
	    Connection connection = DBConnect.getConnecttion();
	    String sql = "SELECT count(bill_id) FROM bill WHERE bill_id != 0";
	    PreparedStatement ps = connection.prepareCall(sql);
	    ResultSet rs = ps.executeQuery();
	    int count = 0;
	    while (rs.next()) {
	        count = rs.getInt(1);
	    }
	    connection.close();
	    return count;  
	}
     public ArrayList<Bill> getListBill() throws SQLException{
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "SELECT * FROM bill ORDER BY date_bill DESC";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<Bill> list = new ArrayList<>();
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setBillID(rs.getInt("bill_id"));
                bill.setUserID(rs.getInt("user_id"));
                bill.setTotal(rs.getInt("total"));
                bill.setPayment(rs.getString("payment"));
                bill.setAddress(rs.getString("address"));
                bill.setDate(rs.getTimestamp("date_bill"));
                bill.setName(rs.getString("name"));
                bill.setPhone(rs.getString("phone"));
                bill.setHuyen(rs.getString("huyen"));
                bill.setXa(rs.getString("xa"));
                bill.setSonha(rs.getString("sonha"));
                list.add(bill);
            }
            connection.close();
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BillGet.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        return null;
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
     public ArrayList<Bill> getListBillByUser(int user_id) throws SQLException{
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "SELECT * FROM bill WHERE user_id = '" + user_id + "'";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<Bill> list = new ArrayList<>();
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setBillID(rs.getInt("bill_id"));
                bill.setUserID(rs.getInt("user_id"));
                bill.setTotal(rs.getInt("total"));
                bill.setPayment(rs.getString("payment"));
                bill.setAddress(rs.getString("address"));
                bill.setDate(rs.getTimestamp("date_bill"));
                bill.setName(rs.getString("name"));
                bill.setPhone(rs.getString("phone"));
                bill.setHuyen(rs.getString("huyen"));
                bill.setXa(rs.getString("xa"));
                bill.setSonha(rs.getString("sonha"));
                list.add(bill);
            }
            connection.close();
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BillGet.class.getName()).log(Level.SEVERE, null, ex);
        }
      
        return null;
    }
     
      
    
    public static void main(String[] args) throws SQLException {
        
//        BillGet billGet=new BillGet();
//        Date date=new Date();
       // Bill bill=new Bill(1, 200000, null, "qnam", new Timestamp(date.getTime())," chinhthuy", "0763717084");
        //billGet.insertBill(bill);
//        for(Bill b:billGet.getListBill()) {
//        	System.out.println(b.toString());
//        }
      
    }

}
