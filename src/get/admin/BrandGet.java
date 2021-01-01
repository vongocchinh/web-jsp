package get.admin;
import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.admin.Brand;
public class BrandGet {
    public ArrayList<Brand> getListBrand() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM iphoneshop.brand";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Brand> list = new ArrayList<>();
        while (rs.next()) {
            Brand brand = new Brand();
            brand.setBrandID(rs.getInt("brand_id"));
            brand.setBrandName(rs.getString("brand_name"));
            list.add(brand);
        }
        connection.close();
        return list;
    }
    
    public Brand getBrand(int brandID) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql =  "SELECT * FROM brand WHERE brand_id = '" + brandID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Brand brand = new Brand();
        while (rs.next()) {
            
            brand.setBrandID(rs.getInt("brand_id"));
            brand.setBrandName(rs.getString("brand_name"));
           
        }
        return brand;
    }
    

public boolean insert(Brand c) throws SQLException {
    try {
         Connection connection = DBConnect.getConnecttion();
         String sql = "INSERT INTO brand VALUE(?,?)";
         PreparedStatement ps = connection.prepareCall(sql);
         ps.setInt(1, c.getBrandID());
         ps.setString(2, c.getBrandName());
         int temp = ps.executeUpdate();
         return temp == 1;
    } catch (Exception e) {
         return false;
    }
}
public int countCategory() throws SQLException{
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT count(brand_id) FROM brand WHERE brand_id != 0";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    int count = 0;
    while (rs.next()) {
        count = rs.getInt(1);
    }
    connection.close();
    return count;  
}
public boolean update(Brand c) throws SQLException {
    try {
         Connection connection = DBConnect.getConnecttion();
         String sql = "UPDATE brand SET brand_name = ? WHERE brand_id = ?";
         PreparedStatement ps = connection.prepareCall(sql);
         ps.setString(1, c.getBrandName());
         ps.setInt(2, c.getBrandID());
         int temp = ps.executeUpdate();
         return temp == 1;
    } catch (Exception e) {
         return false;
    }
}

public boolean delete(int brand_id) throws SQLException {
    try {
        Connection connection = DBConnect.getConnecttion();
        String sql = "DELETE FROM brand WHERE brand_id = ?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, brand_id);
        int temp = ps.executeUpdate();
            return temp == 1;
    } catch (Exception e) {
        return false;
    }
}
 public boolean insertBrand(Brand c) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO brand VALUES(?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, c.getBrandID());
            ps.setString(2, c.getBrandName());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(BrandGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

  
    public boolean updateBrand(Brand c) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "UPDATE brand SET brand_name = ? WHERE brand_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getBrandName());
            ps.setInt(2, c.getBrandID());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(BrandGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // xóa dữ liệu
    public boolean deleteBrand(int brand_id) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "DELETE FROM brand WHERE brand_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, brand_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(BrandGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }


    public static void main(String[] args)throws SQLException {
        BrandGet get = new BrandGet();
       
        
       
        for(Brand ds : get.getListBrand()){
        System.out.println(ds.toString());
        }
    }
    
    
}

