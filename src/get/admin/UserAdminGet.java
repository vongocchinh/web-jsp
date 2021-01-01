package get.admin;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


import model.admin.userAdmin;

public class UserAdminGet {
    public boolean insertUserAdmin(userAdmin u) throws SQLException{
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO useradmin VALUES(?,?,?,?)";
        try{
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, u.getId());
            ps.setString(2, u.getUserNameAdmin());
            ps.setString(3, u.getPassWordAdmin());
            ps.setBoolean(4, u.isRoleAdmin());
            ps.executeUpdate();
            return true;
        }catch(SQLException ex){
            Logger.getLogger(UserGet.class.getName()).log(Level.SEVERE,null,ex);
        }
        return false;
    } 
    public int countTotaluser() throws SQLException{
	    Connection connection = DBConnect.getConnecttion();
	    String sql = "SELECT count(user_ad_id) FROM useradmin WHERE user_ad_id != 0";
	    PreparedStatement ps = connection.prepareCall(sql);
	    ResultSet rs = ps.executeQuery();
	    int count = 0;
	    while (rs.next()) {
	        count = rs.getInt(1);
	    }
	    connection.close();
	    return count;  
	}
     public userAdmin login(String email, String password) {
        Connection con = DBConnect.getConnecttion();
        String sql = "select * from useradmin where user_ad_userName='" + email + "' and user_ad_passWord='" + password + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            userAdmin ad = new userAdmin();
            if (rs.next()) {
                ad.setUserNameAdmin(rs.getString("user_ad_userName"));
                ad.setPassWordAdmin(rs.getString("user_ad_passWord"));
                ad.setRoleAdmin(rs.getBoolean("user_ad_roles"));
                con.close();
                return ad;
            }
        } catch (SQLException e) {
        }
        return null;
    }
     public userAdmin login2(String admin_name, String admin_pass) {
         Connection con =DBConnect.getConnecttion();
         String sql = "select * from useradmin where user_ad_userName='" + admin_name + "' and user_ad_passWord='" + admin_pass + "'";
         PreparedStatement ps;
         try {
             ps = (PreparedStatement) con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery();
             userAdmin ad = new userAdmin();
             if (rs.next()) {
                
              
                 ad.setUserNameAdmin(rs.getString("user_ad_userName"));
                 ad.setPassWordAdmin(rs.getString("user_ad_passWord"));
                 ad.setRoleAdmin(rs.getBoolean("user_ad_roles"));
                 ad.setId(rs.getInt("user_ad_id"));
                 con.close();
                 return ad;
             }
         } catch (SQLException e) {
         }
         return null;
     }
     public ArrayList<userAdmin> getListUser() throws SQLException {
         Connection connection = DBConnect.getConnecttion();
         String sql = "SELECT * FROM useradmin";
         PreparedStatement ps = connection.prepareCall(sql);
         ResultSet rs = ps.executeQuery();
         ArrayList<userAdmin> list = new ArrayList<>();
         while (rs.next()) {
             userAdmin user = new userAdmin();
            user.setId(rs.getInt("user_ad_id"));
            user.setUserNameAdmin(rs.getString("user_ad_userName"));
            user.setPassWordAdmin(rs.getString("user_ad_passWord"));
            user.setRoleAdmin(rs.getBoolean("user_ad_roles"));
            list.add(user);
         }
         connection.close();
         return list;
     }
public boolean delete(int user_ad_id) {
         
         Connection connection = DBConnect.getConnecttion();
         String sql = "DELETE FROM useradmin WHERE user_ad_id= ?";
         
         try {
             PreparedStatement ps = connection.prepareCall(sql);
          ps.setInt(1, user_ad_id);
             return ps.executeUpdate() == 1;
         } catch (SQLException ex) {
        	   return false;
         }
      
     }
public userAdmin getUser(int userID) throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM useradmin WHERE user_ad_id = '" + userID + "'";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    userAdmin user = new userAdmin();
    while (rs.next()) {
        
    	  user.setId(rs.getInt("user_ad_id"));
          user.setUserNameAdmin(rs.getString("user_ad_userName"));
          user.setPassWordAdmin(rs.getString("user_ad_passWord"));
          user.setRoleAdmin(rs.getBoolean("user_ad_roles"));
         
    }
    connection.close();
    return user;
}
     public static void main(String agrs[]) throws SQLException {
    	 UserAdminGet us=new UserAdminGet();
    	 if(us.login2("1", "1") != null) {
    		 System.out.println("ok login");
    	 }else {
    		 System.out.println("no login");
    	 }
     }
    
}
