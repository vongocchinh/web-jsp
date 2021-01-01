
package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnect {
    
     public static Connection getConnecttion() {
        Connection cons = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cons = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/iphoneshop", "root", "123456");
           
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cons;
    }
     public void  disConnection() throws SQLException {
    	 getConnecttion().close();
     }
    public static void main(String[] args) {
        System.out.println(getConnecttion());
    }
    
}
