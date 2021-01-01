
package get.admin;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.admin.Newsletter;

public class NewsletterGet {
    
    public ArrayList<Newsletter> getListNewsletter() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM newsletter";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Newsletter> list = new ArrayList<>();
        while (rs.next()) {
            Newsletter newsletter = new Newsletter();
           newsletter.setNewsletterID(rs.getInt("newsletter_id"));
           newsletter.setNewsletterName(rs.getString("newsletter_name"));       
           newsletter.setDate(rs.getTimestamp("date"));
           list.add(newsletter);
        }
        connection.close();
        return list;
    }
   
    
    public boolean insertNewsletter(Newsletter c) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO newsletter VALUES(?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
         ps.setInt(1, c.getNewsletterID());    
         ps.setString(2, c.getNewsletterName());
         ps.setTimestamp(3, c.getDate());
         
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(NewsletterGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public static void main(String args[]) throws SQLException {
		NewsletterGet newsletterGet=new NewsletterGet();
		//Date aDate=new Date();
		newsletterGet.insertNewsletter(new Newsletter(1, "chinh",new Timestamp(new Date().getTime())));
		for(Newsletter nsl:newsletterGet.getListNewsletter()) {
			System.out.println(nsl.toString());
		}
	}
    
}
