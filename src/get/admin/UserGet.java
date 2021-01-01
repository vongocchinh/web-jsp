package get.admin;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.logging.Level;
import java.util.logging.Logger;
import model.admin.user;


public class UserGet {
    public ArrayList<user> getListUser() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM users";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<user> list = new ArrayList<>();
        while (rs.next()) {
            user user = new user();
           user.setUserID(rs.getInt("user_id"));
           user.setUserName(rs.getString("user_name"));
           user.setUserEmail(rs.getString("user_email"));
           user.setUserPass(rs.getString("user_pass"));
           user.setUserRole(rs.getBoolean("user_role"));
           user.setUserPhone(rs.getString("user_phone"));
           user.setTen(rs.getString("user_ten"));
           user.setDiachi(rs.getString("user_diachi"));
           list.add(user);
        }
        connection.close(); 
        return list;
    }
    public ArrayList<user> getListUser_khoan(int min, int max) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM users WHERE user_id > '"+min+"' and user_id < '"+max+"'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<user> list = new ArrayList<>();
        while (rs.next()) {
            user user = new user();
           user.setUserID(rs.getInt("user_id"));
           user.setUserName(rs.getString("user_name"));
           user.setUserEmail(rs.getString("user_email"));
           user.setUserPass(rs.getString("user_pass"));
           user.setUserRole(rs.getBoolean("user_role"));
           user.setUserPhone(rs.getString("user_phone"));
           user.setTen(rs.getString("user_ten"));
           user.setDiachi(rs.getString("user_diachi"));
           list.add(user);
        }
        connection.close(); 
        return list;
    }
   
    
    public boolean checkUserName(String name) throws SQLException{
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM users WHERE user_name = '" + name + "'";
    PreparedStatement ps;
    try {
        ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            connection.close();
            return true;
        }
    } catch (SQLException ex) {
        Logger.getLogger(UserGet.class.getName()).log(Level.SEVERE,null, ex);
    }
    connection.close(); 
    return false;
    }
    
    public boolean checkpassword(String name) throws SQLException{
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM users WHERE user_pass = '" + name + "'";
        PreparedStatement ps;
        try {
            ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                connection.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserGet.class.getName()).log(Level.SEVERE,null, ex);
        }
        connection.close(); 
        return false;
        }
    
    public int countTotaluser() throws SQLException{
	    Connection connection = DBConnect.getConnecttion();
	    String sql = "SELECT count(user_id) FROM users WHERE user_id != 0";
	    PreparedStatement ps = connection.prepareCall(sql);
	    ResultSet rs = ps.executeQuery();
	    int count = 0;
	    while (rs.next()) {
	        count = rs.getInt(1);
	    }
	    connection.close(); 
	    return count;  
	}
   
    public boolean insertUser(user u) throws SQLException{
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO users VALUES(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, u.getUserID());
            ps.setString(2, u.getUserName());
            ps.setString(3, u.getUserEmail());
            ps.setString(4, u.getUserPass());
            ps.setBoolean(5, u.isUserRole());
            ps.setString(6, u.getUserPhone());
            ps.setString(7, u.getTen());
            ps.setString(8, u.getDiachi());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        connection.close(); 
        return false;
    }
   
     public user login(String name, String password) throws SQLException{
        Connection con = DBConnect.getConnecttion();
        String sql = "select * from users where user_name='" + name + "' and user_pass='" + password + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user u = new user();
               
                u.setUserName(rs.getString("user_name"));
                u.setUserPass(rs.getString("user_pass"));
               u.setUserEmail(rs.getString("user_email"));
               u.setUserPhone(rs.getString("user_phone"));
               u.setTen(rs.getString("user_ten"));
               u.setDiachi(rs.getString("user_diachi"));
               u.setUserID(rs.getInt("user_id"));
               
                con.close();
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return null;
    }
     
     public user getUser(int userID) throws SQLException {
     Connection connection = DBConnect.getConnecttion();
     String sql = "SELECT * FROM users WHERE user_id = '" + userID + "'";
     PreparedStatement ps = connection.prepareCall(sql);
     ResultSet rs = ps.executeQuery();
     user user = new user();
     while (rs.next()) {
         
           user.setUserID(rs.getInt("user_id"));
           user.setUserName(rs.getString("user_name"));
           user.setUserEmail(rs.getString("user_email"));
           user.setUserPass(rs.getString("user_pass"));
           user.setUserRole(rs.getBoolean("user_role"));
           user.setUserPhone(rs.getString("user_phone"));
           user.setTen(rs.getString("user_ten"));
           user.setDiachi(rs.getString("user_diachi"));
     }
     connection.close(); 
     return user;
}
     public boolean updateUser(user u) throws SQLException  {
        
        Connection connection = DBConnect.getConnecttion();
        String sql = "UPDATE users SET user_id=?, user_name=?, user_email=?, user_pass=?, user_role=?, user_phone=?,user_ten= ?,user_diachi= ? WHERE user_id = ?";
        
        try {
            PreparedStatement ps = connection.prepareCall(sql);
          ps.setInt(1, u.getUserID());
            ps.setString(2, u.getUserName());
            ps.setString(3, u.getUserEmail());
            ps.setString(4, u.getUserPass());
            ps.setBoolean(5, u.isUserRole());
            ps.setString(6, u.getUserPhone());
            ps.setString(7, u.getTen());
            ps.setString(8, u.getDiachi());
            ps.setInt(9, u.getUserID());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        connection.close(); 
        return false;
    }
     public boolean delete(int user_id) {
         
         Connection connection = DBConnect.getConnecttion();
         String sql = "DELETE FROM users WHERE user_id= ?";
         
         try {
             PreparedStatement ps = connection.prepareCall(sql);
          ps.setInt(1, user_id);
             return ps.executeUpdate() == 1;
         } catch (SQLException ex) {
        	   return false;
         }
      
     }
     public int countUser() throws SQLException{
         Connection connection = DBConnect.getConnecttion();
         String sql = "SELECT COUNT(*) FROM users WHERE user_id !=0";
         PreparedStatement ps = connection.prepareCall(sql);
         ResultSet rs = ps.executeQuery();
         int count = 0;
         while (rs.next()) {
             count = rs.getInt(1);
         }
         connection.close(); 
         return count;  
     }
     public static void main(String args[]) throws SQLException {
    	 UserGet userGet=new UserGet();
    	for(user us:userGet.getListUser_khoan(0,1000000000)) {
    		System.out.println(us.toString());
    	}
    	// user user4=new user("chinhthuychinh1","chinhthuychinh@1","chinhthuychinh1",true,"123451");
//    	 UserGet userGet2=new UserGet();
//    	 userGet.updateUser(new user(24,"T","chinhthuy","T",true,"1212"));
//    	 Scanner scanner=new Scanner(System.in);
//    	 for(int i=0;i<1;i++) {
//    		 
//    		 System.out.println("nhap ten");
//    		 String userName=scanner.nextLine();
//    		 System.out.println("nhap mail");
//    		 String mailName=scanner.nextLine();
//    		 System.out.println("nhap pass");
//    		 String pass=scanner.nextLine();
//    		 System.out.println("nhap role");
//    		 boolean role=false;
//    		 System.out.println("nhap phone");
//    		 String phone=scanner.nextLine();
//    		user user=new user(userName, mailName, pass, role,phone);
//    		userGet.insertUser(user);
//    	 }
//    	 for(user user1:userGet.getListUser()) {
//    		 System.out.println(user1.toString());
//    	 }
    	System.out.println(userGet.countTotaluser());
    	 
     }
    
}
