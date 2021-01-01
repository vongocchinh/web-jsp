
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
import model.admin.Contact;





public class ContactGet {
     public ArrayList<Contact> getListContact() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM contact";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Contact> list = new ArrayList<>();
        while (rs.next()) {
            Contact contact = new Contact();
           contact.setContactID(rs.getInt("contact_id"));
           contact.setContactName(rs.getString("contact_name"));
           contact.setContactWeb(rs.getString("contact_web"));
           contact.setContactEmail(rs.getString("contact_email"));
           contact.setContactTitle(rs.getString("contact_title"));
           contact.setContactMessage(rs.getString("contact_message"));
           contact.setDate(rs.getTimestamp("contact_date"));
           list.add(contact);
        }
        connection.close();
        return list;
    }
   
    
public boolean insertContact(Contact c) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO contact VALUES(?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
         ps.setInt(1, c.getContactID());    
         ps.setString(2, c.getContactName());
         ps.setString(3, c.getContactWeb());
         ps.setString(4, c.getContactEmail());
         ps.setString(5, c.getContactTitle());
         ps.setString(6, c.getContactMessage());
         ps.setTimestamp(7, c.getDate());
         
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ContactGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
public static void main(String args[]) throws SQLException {
	ContactGet contactGet=new ContactGet();
	Date dateTime=new Date();
	String massage="hello shop , shop có thể tư vấn thêm được không";
	Contact contact=new Contact("thuy", null, "thuy@", "dep",massage,new Timestamp(dateTime.getTime()));
	contactGet.insertContact(contact);
	for(Contact cpContact:contactGet.getListContact()) {
		System.out.println(cpContact.toString());
	}
}

}
