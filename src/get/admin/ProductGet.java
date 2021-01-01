package get.admin;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;



import model.admin.Product;



public class ProductGet {
    
   public ArrayList<Product> getListProductByNav(int categoryID, int firstResult, int maxResult) throws SQLException{
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM product WHERE category_id = '" + categoryID + "' limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProductID(rs.getInt("product_id"));
            product.setProductName(rs.getString("product_name"));
            product.setProductImage(rs.getString("product_image"));
            product.setBrandID(rs.getInt("brand_id"));
            product.setProductImagenext(rs.getString("product_image_next"));
            product.setProductPrice(rs.getInt("product_price"));
            product.setProductDescription(rs.getString("product_description"));
            product.setGiam_Gia(rs.getString("giam_Gia"));
           
            product.setCamera_Truoc(rs.getString("camera_Truoc"));
            product.setCamera_Sau(rs.getString("camera_Sau"));
            product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
            product.setBo_Nho(rs.getString("bo_Nho"));
            product.setRam(rs.getString("ram"));
        
         
            list.add(product);
        }
        connection.close(); 
        return list;
        
    }
   public ArrayList<Product> getListProduct_a_b(int a, int b) throws SQLException{
       Connection connection = DBConnect.getConnecttion();
       String sql = "SELECT * FROM product  limit ?,?";
       PreparedStatement ps = connection.prepareCall(sql);
       ps.setInt(1, a);
       ps.setInt(2, b);
       ResultSet rs = ps.executeQuery();
       ArrayList<Product> list = new ArrayList<>();
       while (rs.next()) {
           Product product = new Product();
           product.setProductID(rs.getInt("product_id"));
           product.setCategoryID(rs.getInt("category_id"));
           product.setProductName(rs.getString("product_name"));
           product.setProductImage(rs.getString("product_image"));
           product.setBrandID(rs.getInt("brand_id"));
           product.setProductImagenext(rs.getString("product_image_next"));
           product.setProductPrice(rs.getInt("product_price"));
           product.setProductDescription(rs.getString("product_description"));
           product.setGiam_Gia(rs.getString("giam_Gia"));
          
           product.setCamera_Truoc(rs.getString("camera_Truoc"));
           product.setCamera_Sau(rs.getString("camera_Sau"));
           product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
           product.setBo_Nho(rs.getString("bo_Nho"));
           product.setRam(rs.getString("ram"));
       
        
           list.add(product);
       }
       connection.close(); 
       return list;
   }
   public ArrayList<Product> getListProduct_a_b_tc(int category_id,int a, int b) throws SQLException{
       Connection connection = DBConnect.getConnecttion();
       String sql = "SELECT * FROM product   WHERE category_id = '" + category_id + "' limit ?,?";
       PreparedStatement ps = connection.prepareCall(sql);
       ps.setInt(1, a);
       ps.setInt(2, b);
       ResultSet rs = ps.executeQuery();
       ArrayList<Product> list = new ArrayList<>();
       while (rs.next()) {
           Product product = new Product();
           product.setProductID(rs.getInt("product_id"));
           product.setCategoryID(rs.getInt("category_id"));
           product.setProductName(rs.getString("product_name"));
           product.setProductImage(rs.getString("product_image"));
           product.setBrandID(rs.getInt("brand_id"));
           product.setProductImagenext(rs.getString("product_image_next"));
           product.setProductPrice(rs.getInt("product_price"));
           product.setProductDescription(rs.getString("product_description"));
           product.setGiam_Gia(rs.getString("giam_Gia"));
          
           product.setCamera_Truoc(rs.getString("camera_Truoc"));
           product.setCamera_Sau(rs.getString("camera_Sau"));
           product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
           product.setBo_Nho(rs.getString("bo_Nho"));
           product.setRam(rs.getString("ram"));
       
        
           list.add(product);
       }
       connection.close(); 
       return list;
   }
   public ArrayList<Product> getListproduct_khoan(int min, int max) throws SQLException {
       Connection connection = DBConnect.getConnecttion();
       String sql = "SELECT * FROM product WHERE product_price > '"+min+"' and product_price < '"+max+"'";
       PreparedStatement ps = connection.prepareCall(sql);
       ResultSet rs = ps.executeQuery();
       ArrayList<Product> list = new ArrayList<>();
       while (rs.next()) {
    	   Product product = new Product();
           product.setProductID(rs.getInt("product_id"));
           product.setProductName(rs.getString("product_name"));
           product.setProductImage(rs.getString("product_image"));
           product.setBrandID(rs.getInt("brand_id"));
           product.setProductImagenext(rs.getString("product_image_next"));
           product.setProductPrice(rs.getInt("product_price"));
           product.setProductDescription(rs.getString("product_description"));
           product.setGiam_Gia(rs.getString("giam_Gia"));
          
           product.setCamera_Truoc(rs.getString("camera_Truoc"));
           product.setCamera_Sau(rs.getString("camera_Sau"));
           product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
           product.setBo_Nho(rs.getString("bo_Nho"));
           product.setRam(rs.getString("ram"));
          
          list.add(product);
       }
       connection.close(); 
       return list;
   }
   public ArrayList<Product> getListproduct_sale() throws SQLException {
       Connection connection = DBConnect.getConnecttion();
       String sql = "SELECT * FROM product WHERE giam_Gia != 0 ";
       PreparedStatement ps = connection.prepareCall(sql);
       ResultSet rs = ps.executeQuery();
       ArrayList<Product> list = new ArrayList<>();
       while (rs.next()) {
    	   Product product = new Product();
           product.setProductID(rs.getInt("product_id"));
           product.setProductName(rs.getString("product_name"));
           product.setProductImage(rs.getString("product_image"));
           product.setBrandID(rs.getInt("brand_id"));
           product.setProductImagenext(rs.getString("product_image_next"));
           product.setProductPrice(rs.getInt("product_price"));
           product.setProductDescription(rs.getString("product_description"));
           product.setGiam_Gia(rs.getString("giam_Gia"));
          
           product.setCamera_Truoc(rs.getString("camera_Truoc"));
           product.setCamera_Sau(rs.getString("camera_Sau"));
           product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
           product.setBo_Nho(rs.getString("bo_Nho"));
           product.setRam(rs.getString("ram"));
         
          list.add(product);
       }
       connection.close(); 
       return list;
   }
   public ArrayList<Product> getListproduct_sale_dt() throws SQLException {
       Connection connection = DBConnect.getConnecttion();
       String sql = "SELECT * FROM product WHERE giam_Gia != 0 and category_id=1 ORDER BY giam_Gia DESC limit 7";
       PreparedStatement ps = connection.prepareCall(sql);
       ResultSet rs = ps.executeQuery();
       ArrayList<Product> list = new ArrayList<>();
       while (rs.next()) {
    	   Product product = new Product();
           product.setProductID(rs.getInt("product_id"));
           product.setProductName(rs.getString("product_name"));
           product.setProductImage(rs.getString("product_image"));
           product.setBrandID(rs.getInt("brand_id"));
           product.setProductImagenext(rs.getString("product_image_next"));
           product.setProductPrice(rs.getInt("product_price"));
           product.setProductDescription(rs.getString("product_description"));
           product.setGiam_Gia(rs.getString("giam_Gia"));
          
           product.setCamera_Truoc(rs.getString("camera_Truoc"));
           product.setCamera_Sau(rs.getString("camera_Sau"));
           product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
           product.setBo_Nho(rs.getString("bo_Nho"));
           product.setRam(rs.getString("ram"));
         
          list.add(product);
       }
       connection.close(); 
       return list;
   }
   public int countproduct_sale() throws SQLException{
       Connection connection = DBConnect.getConnecttion();
       String sql = "SELECT count(giam_Gia) FROM product WHERE giam_Gia != 0";
       PreparedStatement ps = connection.prepareCall(sql);
       ResultSet rs = ps.executeQuery();
       int count = 0;
       while (rs.next()) {
           count = rs.getInt(1);
       }
       connection.close(); 
       return count;  
   }
   public int countproduct() throws SQLException{
       Connection connection = DBConnect.getConnecttion();
       String sql = "SELECT count(product_id) FROM product WHERE product_id != 0";
       PreparedStatement ps = connection.prepareCall(sql);
       ResultSet rs = ps.executeQuery();
       int count = 0;
       while (rs.next()) {
           count = rs.getInt(1);
       }
       return count;  
   }
   public int countproduct_tc(int category) throws SQLException{
       Connection connection = DBConnect.getConnecttion();
       String sql = "SELECT count(product_id) FROM product WHERE product_id != 0 and category_id='"+category+"'";
       PreparedStatement ps = connection.prepareCall(sql);
       ResultSet rs = ps.executeQuery();
       int count = 0;
       while (rs.next()) {
           count = rs.getInt(1);
       }
       connection.close(); 
       return count;  
   }
//   public ArrayList<Product> getListproduct_tra_gop(int tra_gop) throws SQLException {
//       Connection connection = DBConnect.getConnecttion();
//       String sql = "SELECT * FROM product WHERE tra_gop = '"+tra_gop+"'";
//       PreparedStatement ps = connection.prepareCall(sql);
//       ResultSet rs = ps.executeQuery();
//       ArrayList<Product> list = new ArrayList<>();
//       while (rs.next()) {
//    	   Product product = new Product();
//           product.setProductID(rs.getInt("product_id"));
//           product.setProductName(rs.getString("product_name"));
//           product.setProductImage(rs.getString("product_image"));
//           product.setBrandID(rs.getInt("brand_id"));
//           product.setProductImagenext(rs.getString("product_image_next"));
//           product.setProductPrice(rs.getInt("product_price"));
//           product.setProductDescription(rs.getString("product_description"));
//           product.setGiam_Gia(rs.getString("giam_Gia"));
//          
//           product.setCamera_Truoc(rs.getString("camera_Truoc"));
//           product.setCamera_Sau(rs.getString("camera_Sau"));
//           product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
//           product.setBo_Nho(rs.getString("bo_Nho"));
//           product.setRam(rs.getString("ram"));
//         
//          list.add(product);
//       }
//       return list;
//   }
    public int countProductByCategory(int categoryID) throws SQLException{
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT count(product_id) FROM product WHERE category_id = '" + categoryID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        connection.close(); 
        return count;  
    }
    public int coutBrand(int BrandID) throws SQLException{
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT count(product_id) FROM product WHERE brand_id = '" + BrandID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        connection.close(); 
        return count;  
    }
public ArrayList<Product> getListProductByCategory(int category_id) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM product WHERE category_id = '" + category_id + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            
            Product product = new Product();
           
            product.setProductID(rs.getInt("product_id"));
            product.setProductName(rs.getString("product_name"));
            product.setProductImage(rs.getString("product_image"));
            product.setBrandID(rs.getInt("brand_id"));
            product.setProductImagenext(rs.getString("product_image_next"));
            product.setProductPrice(rs.getInt("product_price"));
            product.setProductDescription(rs.getString("product_description"));
            product.setGiam_Gia(rs.getString("giam_Gia"));
           
            product.setCamera_Truoc(rs.getString("camera_Truoc"));
            product.setCamera_Sau(rs.getString("camera_Sau"));
            product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
            product.setBo_Nho(rs.getString("bo_Nho"));
            product.setRam(rs.getString("ram"));
          
            list.add(product);
        }
        connection.close(); 
        return list;
    }
public ArrayList<Product> getListProductByCategory1(int category_id) throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product WHERE category_id = '" + category_id + "'  ";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
       
        product.setProductID(rs.getInt("product_id"));
        product.setProductName(rs.getString("product_name"));
        product.setProductImage(rs.getString("product_image"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
      
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
        product.setBo_Nho(rs.getString("bo_Nho"));
        product.setRam(rs.getString("ram"));
        
        list.add(product);
    }
    connection.close(); 
    return list;
}
public ArrayList<Product> getSearch(String product_name) throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product WHERE product_name like  '%"+product_name+"%' or product_price like  '%"+product_name+"%' ";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
        product.setCategoryID(rs.getInt("category_id"));
        product.setProductID(rs.getInt("product_id"));
        product.setProductName(rs.getString("product_name"));
        product.setProductImage(rs.getString("product_image"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
      
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
        product.setBo_Nho(rs.getString("bo_Nho"));
        product.setRam(rs.getString("ram"));
       
        list.add(product);
    }
    connection.close(); 
    return list;
}

public ArrayList<Product> getRandomcategory(int category_id) throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product WHERE category_id = '" + category_id + "' ORDER BY RAND() LIMIT 6";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
       
        product.setProductID(rs.getInt("product_id"));
        product.setProductName(rs.getString("product_name"));
        product.setProductImage(rs.getString("product_image"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
      
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
        product.setBo_Nho(rs.getString("bo_Nho"));
        product.setRam(rs.getString("ram"));
   
        list.add(product);
    }
    connection.close(); 
    return list;
}
public ArrayList<Product> getRandomcategory_15sp(int category_id) throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product WHERE category_id = '" + category_id + "' ORDER BY RAND() LIMIT 8";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
       
        product.setProductID(rs.getInt("product_id"));
        product.setProductName(rs.getString("product_name"));
        product.setProductImage(rs.getString("product_image"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
      
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
        product.setBo_Nho(rs.getString("bo_Nho"));
        product.setRam(rs.getString("ram"));
   
        list.add(product);
    }
    connection.close(); 
    return list;
}
public ArrayList<Product> getRandomcategory_5sp(int category_id) throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product WHERE category_id = '" + category_id + "' ORDER BY RAND() LIMIT 5";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
       
        product.setProductID(rs.getInt("product_id"));
        product.setProductName(rs.getString("product_name"));
        product.setProductImage(rs.getString("product_image"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
      
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
        product.setBo_Nho(rs.getString("bo_Nho"));
        product.setRam(rs.getString("ram"));
   
        list.add(product);
    }
    connection.close(); 
    return list;
}
public ArrayList<Product> getRandomcategory_10sp(int category_id) throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product WHERE category_id = '" + category_id + "' ORDER BY RAND() LIMIT 10";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
       
        product.setProductID(rs.getInt("product_id"));
        product.setProductName(rs.getString("product_name"));
        product.setProductImage(rs.getString("product_image"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
      
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
        product.setBo_Nho(rs.getString("bo_Nho"));
        product.setRam(rs.getString("ram"));
   
        list.add(product);
    }
    connection.close(); 
    return list;
}
public ArrayList<Product> getRandombrand_category(int brand_id,int category_id) throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product WHERE brand_id = '" + brand_id + "' and category_id = '" + category_id + "' ORDER BY RAND() LIMIT 1";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
       
        product.setProductID(rs.getInt("product_id"));
        product.setProductName(rs.getString("product_name"));
        product.setProductImage(rs.getString("product_image"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
       
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
        product.setBo_Nho(rs.getString("bo_Nho"));
        product.setRam(rs.getString("ram"));
      
        list.add(product);
    }
    connection.close(); 
    return list;
}
public ArrayList<Product> getRandombrand_category_8(int brand_id,int category_id) throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product WHERE brand_id = '" + brand_id + "' and category_id = '" + category_id + "' ORDER BY RAND() LIMIT 10";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
       
        product.setProductID(rs.getInt("product_id"));
        product.setProductName(rs.getString("product_name"));
        product.setProductImage(rs.getString("product_image"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
       
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
        product.setBo_Nho(rs.getString("bo_Nho"));
        product.setRam(rs.getString("ram"));
      
        list.add(product);
    }
    connection.close(); 
    return list;
}
public ArrayList<Product> getRandombrand_category_12(int brand_id,int category_id) throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product WHERE brand_id = '" + brand_id + "' and category_id = '" + category_id + "' ORDER BY RAND() ";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
       
        product.setProductID(rs.getInt("product_id"));
        product.setProductName(rs.getString("product_name"));
        product.setProductImage(rs.getString("product_image"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
       
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
        product.setBo_Nho(rs.getString("bo_Nho"));
        product.setRam(rs.getString("ram"));
       
        list.add(product);
    }
    connection.close(); 
    return list;
}
public ArrayList<Product> getRandombrand_category1(int brand_id,int category_id) throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product WHERE brand_id = '" + brand_id + "' and category_id = '" + category_id + "' ORDER BY RAND() LIMIT 2";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
       
        product.setProductID(rs.getInt("product_id"));
        product.setProductName(rs.getString("product_name"));
        product.setProductImage(rs.getString("product_image"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
    
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
       
        product.setRam(rs.getString("ram"));
        product.setBo_Nho(rs.getString("bo_Nho"));
     
        list.add(product);
    }
    connection.close(); 
    return list;
}
public ArrayList<Product> getRandombrand_category2(int brand_id,int category_id) throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product WHERE brand_id = '" + brand_id + "' and category_id = '" + category_id + "' ORDER BY RAND() ";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
       
        product.setProductID(rs.getInt("product_id"));
        product.setProductName(rs.getString("product_name"));
        product.setProductImage(rs.getString("product_image"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
     
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
      
        product.setRam(rs.getString("ram"));
     
        list.add(product);
    }
    connection.close(); 
    return list;
}
public ArrayList<Product> getRanDom() throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product where brand_id = 1  ORDER BY RAND() LIMIT 7";
    //String sql="select * from product where random() < (4 / (select count(1) from product)) limit 4;";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
       
        product.setProductID(rs.getInt("product_id"));
        product.setProductName(rs.getString("product_name"));
        product.setProductImage(rs.getString("product_image"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
      
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
        product.setBo_Nho(rs.getString("bo_Nho"));
        product.setRam(rs.getString("ram"));
        
        list.add(product);
    }
    connection.close(); 
    return list;
}
public ArrayList<Product> getRanDom111() throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product where brand_id = 1  ORDER BY RAND() LIMIT 5";
    //String sql="select * from product where random() < (4 / (select count(1) from product)) limit 4;";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
       
        product.setProductID(rs.getInt("product_id"));
        product.setProductName(rs.getString("product_name"));
        product.setProductImage(rs.getString("product_image"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
      
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
        product.setBo_Nho(rs.getString("bo_Nho"));
        product.setRam(rs.getString("ram"));
        
        list.add(product);
    }
    connection.close(); 
    return list;
}
public ArrayList<Product> getRanDomtoanbo() throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product ORDER BY RAND() ";
    //String sql="select * from product where random() < (4 / (select count(1) from product)) limit 4;";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
       
        product.setProductID(rs.getInt("product_id"));
        product.setProductName(rs.getString("product_name"));
        product.setProductImage(rs.getString("product_image"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
      
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
        product.setBo_Nho(rs.getString("bo_Nho"));
        product.setRam(rs.getString("ram"));
       
        list.add(product);
    }
    connection.close(); 
    return list;
}
public ArrayList<Product> getRanDom_1sp() throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product ORDER BY RAND() LIMIT 1 ";
    //String sql="select * from product where random() < (4 / (select count(1) from product)) limit 4;";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
       
        product.setProductID(rs.getInt("product_id"));
        product.setProductName(rs.getString("product_name"));
        product.setProductImage(rs.getString("product_image"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
       
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
        product.setBo_Nho(rs.getString("bo_Nho"));
        product.setRam(rs.getString("ram"));
       
        list.add(product);
    }
    connection.close(); 
    return list;
}
public ArrayList<Product> getRanDom1() throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product ORDER BY RAND() LIMIT 2 ";
    //String sql="select * from product where random() < (4 / (select count(1) from product)) limit 4;";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
       
        product.setProductID(rs.getInt("product_id"));
        product.setProductName(rs.getString("product_name"));
        product.setProductImage(rs.getString("product_image"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
       
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
        product.setBo_Nho(rs.getString("bo_Nho"));
        product.setRam(rs.getString("ram"));
       
        list.add(product);
    }
    connection.close(); 
    return list;
}
public ArrayList<Product> getList3ProductByCategory(int category_id) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM product WHERE category_id = '" + category_id + "' LIMIT 6";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            
            Product product = new Product();
           
            product.setProductID(rs.getInt("product_id"));
            product.setProductName(rs.getString("product_name"));
            product.setProductImage(rs.getString("product_image"));
            product.setBrandID(rs.getInt("brand_id"));
            product.setProductImagenext(rs.getString("product_image_next"));
            product.setProductPrice(rs.getInt("product_price"));
            product.setProductDescription(rs.getString("product_description"));
            product.setGiam_Gia(rs.getString("giam_Gia"));
          
            product.setCamera_Truoc(rs.getString("camera_Truoc"));
            product.setCamera_Sau(rs.getString("camera_Sau"));
            product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
            product.setBo_Nho(rs.getString("bo_Nho"));
            product.setRam(rs.getString("ram"));
           
            list.add(product);
        }
        connection.close(); 
        return list;
    }

public ArrayList<Product> getListProductByBrand(int brand_id) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM product WHERE brand_id = '" + brand_id + "' ORDER BY RAND() LIMIT 5";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            
            Product product = new Product();
           product.setCategoryID(rs.getInt("category_id"));
            product.setProductID(rs.getInt("product_id"));
            product.setProductName(rs.getString("product_name"));
            product.setProductImage(rs.getString("product_image"));
            product.setBrandID(rs.getInt("brand_id"));
            product.setProductImagenext(rs.getString("product_image_next"));
            product.setProductPrice(rs.getInt("product_price"));
            product.setProductDescription(rs.getString("product_description"));
            product.setGiam_Gia(rs.getString("giam_Gia"));
         
            product.setCamera_Truoc(rs.getString("camera_Truoc"));
            product.setCamera_Sau(rs.getString("camera_Sau"));
            product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
            product.setBo_Nho(rs.getString("bo_Nho"));
            product.setRam(rs.getString("ram"));
           
            list.add(product);
        }
        connection.close(); 
        return list;
    }
public ArrayList<Product> getListProductByBrand_Lienquan(int category_ID,int brand_id) throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product WHERE brand_id = '" + brand_id + "' and category_id = '" + category_ID + "' ORDER BY RAND() LIMIT 10";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
       product.setCategoryID(rs.getInt("category_id"));
        product.setProductID(rs.getInt("product_id"));
        product.setProductName(rs.getString("product_name"));
        product.setProductImage(rs.getString("product_image"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
     
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
        product.setBo_Nho(rs.getString("bo_Nho"));
        product.setRam(rs.getString("ram"));
        
        list.add(product);
    }
    connection.close(); 
    return list;
}
public ArrayList<Product> getListProductRelated(int category_id, int product_id) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM product WHERE category_id = '" + category_id + "' and product_id != '" + product_id + "'LIMIT 8" ;
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            
            Product product = new Product();
           
            product.setProductName(rs.getString("product_name"));
            product.setBrandID(rs.getInt("brand_id"));
            product.setProductImage(rs.getString("product_image"));
            product.setProductImagenext(rs.getString("product_image_next"));
            product.setProductPrice(rs.getInt("product_price"));
            product.setProductDescription(rs.getString("product_description"));
            product.setGiam_Gia(rs.getString("giam_Gia"));
          
            product.setCamera_Truoc(rs.getString("camera_Truoc"));
            product.setCamera_Sau(rs.getString("camera_Sau"));
            product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
            product.setBo_Nho(rs.getString("bo_Nho"));
            product.setRam(rs.getString("ram"));
           
            list.add(product);
        }
        connection.close(); 
        return list;
    }
public ArrayList<Product> getListProductbrand(int category_id, int brand_id) throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product WHERE category_id = '" + category_id + "' and brand_id = '" + brand_id + "'LIMIT 8" ;
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
        product.setProductID(rs.getInt("product_id"));
        product.setCategoryID(rs.getInt("category_id"));
        product.setProductName(rs.getString("product_name"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImage(rs.getString("product_image"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
       
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
        product.setBo_Nho(rs.getString("bo_Nho"));
        product.setRam(rs.getString("ram"));
      
        list.add(product);
    }
    connection.close(); 
    return list;
}
public ArrayList<Product> getListProductbrandtoanbo(int category_id, int brand_id) throws SQLException {
    Connection connection = DBConnect.getConnecttion();
    String sql = "SELECT * FROM product WHERE category_id = '" + category_id + "' and brand_id = '" + brand_id + "'" ;
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while (rs.next()) {
        
        Product product = new Product();
        product.setProductID(rs.getInt("product_id"));
        product.setCategoryID(rs.getInt("category_id"));
        product.setProductName(rs.getString("product_name"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setProductImage(rs.getString("product_image"));
        product.setProductImagenext(rs.getString("product_image_next"));
        product.setProductPrice(rs.getInt("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        product.setGiam_Gia(rs.getString("giam_Gia"));
       
        product.setCamera_Truoc(rs.getString("camera_Truoc"));
        product.setCamera_Sau(rs.getString("camera_Sau"));
        product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
        product.setBo_Nho(rs.getString("bo_Nho"));
        product.setRam(rs.getString("ram"));
       
        list.add(product);
    }
    connection.close(); 
    return list;
}

public ArrayList<Product> getListProduct() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM product ORDER BY product_id DESC";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
           
            product.setProductID(rs.getInt("product_id"));
            product.setCategoryID(rs.getInt("category_id"));
            product.setProductName(rs.getString("product_name"));
            product.setBrandID(rs.getInt("brand_id"));
            product.setProductImage(rs.getString("product_image"));
            product.setProductImagenext(rs.getString("product_image_next"));
            product.setProductPrice(rs.getInt("product_price"));
            product.setProductDescription(rs.getString("product_description"));
            product.setGiam_Gia(rs.getString("giam_Gia"));
          
            product.setCamera_Truoc(rs.getString("camera_Truoc"));
            product.setCamera_Sau(rs.getString("camera_Sau"));
            product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
            product.setBo_Nho(rs.getString("bo_Nho"));
            product.setRam(rs.getString("ram"));
         
            list.add(product);
        }
        connection.close(); 
        return list;
    }





public Product getProduct(int productID) throws SQLException {
     Connection connection = DBConnect.getConnecttion();
     String sql = "SELECT * FROM product WHERE product_id = '" + productID + "'";
     PreparedStatement ps = connection.prepareCall(sql);
     ResultSet rs = ps.executeQuery();
     Product product = new Product();
     while (rs.next()) {
          product.setProductID(rs.getInt("product_id"));
          product.setCategoryID(rs.getInt("category_id"));
          product.setProductName(rs.getString("product_name"));
          product.setBrandID(rs.getInt("brand_id"));
          product.setProductImage(rs.getString("product_image"));
          product.setProductImagenext(rs.getString("product_image_next"));
          product.setProductPrice(rs.getInt("product_price"));
          product.setProductDescription(rs.getString("product_description"));
          product.setGiam_Gia(rs.getString("giam_Gia"));
         
          product.setCamera_Truoc(rs.getString("camera_Truoc"));
          product.setCamera_Sau(rs.getString("camera_Sau"));
          product.setHe_Dieu_Hanh(rs.getString("he_Dieu_Hanh"));
          product.setBo_Nho(rs.getString("bo_Nho"));
          product.setRam(rs.getString("ram"));
         
     }
     connection.close(); 
     return product;
}

public boolean insert(Product c) throws SQLException {
    try {
         Connection connection = DBConnect.getConnecttion();
         String sql = "INSERT INTO product VALUE(?,?,?,?,?,?,?,?,?,?,?,?,?)";
         PreparedStatement ps = connection.prepareCall(sql);
         ps.setInt(1, c.getProductID());
         ps.setInt(2, c.getCategoryID());
         ps.setString(3, c.getProductName());
         ps.setInt(4, c.getBrandID());
         ps.setString(5, c.getProductImage());
         ps.setString(6, c.getProductImagenext());
         ps.setInt(7, c.getProductPrice());
         ps.setString(8, c.getProductDescription());
         ps.setString(9, c.getGiam_Gia());
         ps.setString(10,c.getCamera_Sau() );
         ps.setString(11, c.getCamera_Truoc());
         ps.setString(12,c.getHe_Dieu_Hanh() );
        
         ps.setString(13,c.getBo_Nho() );
         ps.setString(14, c.getRam());
    
         int temp = ps.executeUpdate();
         return temp == 1;
    } catch (Exception e) {
         return false;
    }
    
    
}

public boolean update(Product c) throws SQLException {
    try {
         Connection connection = DBConnect.getConnecttion();
         String sql = "UPDATE iphoneshop.product SET  category_id=?, product_name=?, brand_id=?, product_image=?, product_image_next=?,  product_price=?, product_description = ?,giam_Gia=? ,camera_Sau=?,camera_Truoc=?,he_Dieu_Hanh=?,bo_Nho=?,ram=? WHERE product_id = ?";
         PreparedStatement ps = connection.prepareCall(sql);
         
         ps.setInt(1, c.getCategoryID());
         ps.setString(2, c.getProductName());
         ps.setInt(3, c.getBrandID());
         ps.setString(4, c.getProductImage());
         ps.setString(5, c.getProductImagenext());
         ps.setInt(6, c.getProductPrice());
         ps.setString(7, c.getProductDescription());
         ps.setString(8, c.getGiam_Gia());
        
        
         ps.setString(9,c.getCamera_Sau() );
         ps.setString(10, c.getCamera_Truoc());
         ps.setString(11,c.getHe_Dieu_Hanh() );
        
         ps.setString(12,c.getBo_Nho() );
         ps.setString(13, c.getRam());
        
         ps.setInt(14, c.getProductID());
         int temp = ps.executeUpdate();
         return temp == 1;
    } catch (SQLException ex) {
    	 Logger.getLogger(ProductGet.class.getName()).log(Level.SEVERE, null, ex);
    }
    
	return false;
}

public boolean delete(int product_id) throws SQLException {
    try {
        Connection connection = DBConnect.getConnecttion();
        String sql = "DELETE FROM product WHERE product_id = ?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, product_id);
        int temp = ps.executeUpdate();
            return temp == 1;
    } catch (Exception e) {
        return false;
    }
}
 public boolean insertProduct(Product c) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO product VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
         ps.setInt(1, c.getProductID());
         ps.setInt(2, c.getCategoryID());
         ps.setString(3, c.getProductName());
         ps.setInt(4, c.getBrandID());
         ps.setString(5, c.getProductImage());
         ps.setString(6, c.getProductImagenext());
         ps.setInt(7, c.getProductPrice());
         ps.setString(8, c.getProductDescription());
         ps.setString(9, c.getGiam_Gia());
       
         ps.setString(10,c.getCamera_Sau() );
         ps.setString(11, c.getCamera_Truoc());
         ps.setString(12,c.getHe_Dieu_Hanh() );
        
         ps.setString(13,c.getBo_Nho() );
         ps.setString(14, c.getRam());
        
       
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ProductGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        connection.close(); 
        return false;
    }

    // cập nhật dữ liệu
    public boolean updateProduct(Product c) throws SQLException{
        
        Connection connection = DBConnect.getConnecttion();
       // String sql = "UPDATE product SET product_id = ?, category_id = ?, product_name = ?, product_image = ?, product_image_forward = ?, product_image_back = ?, product_price = ?, product_description = ? WHERE product_id = ?";
        String sql = "UPDATE iphoneshop.product SET  category_id=?,"
        		+ " product_name=?, brand_id=?, "
        		+ "product_image=?, product_image_next=?, "
        		+ " product_price=?, product_description = ?,giam_Gia=?,"
        		+ "camera_Sau=?,camera_Truoc=?,he_Dieu_Hanh=?,bo_Nho=?,ram=?"
        		+" WHERE product_id = ?";
        
        try {
            PreparedStatement ps = connection.prepareCall(sql);
        
         ps.setInt(1, c.getCategoryID());
         ps.setString(2, c.getProductName());
         ps.setInt(3, c.getBrandID());
         ps.setString(4, c.getProductImage());
         ps.setString(5, c.getProductImagenext());
         ps.setInt(6, c.getProductPrice());
         ps.setString(7, c.getProductDescription());
         ps.setString(8, c.getGiam_Gia());
        
         ps.setString(9,c.getCamera_Sau() );
         ps.setString(10, c.getCamera_Truoc());
         ps.setString(11,c.getHe_Dieu_Hanh() );
        
         ps.setString(12,c.getBo_Nho() );
         ps.setString(13, c.getRam());
         
         
         ps.setInt(14, c.getProductID());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ProductGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        connection.close(); 
        return false;
    }

  
    public boolean deleteProduct(int product_id) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "DELETE FROM product WHERE product_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, product_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ProductGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        connection.close(); 
        return false;
    }


    public static void main(String[] args)throws SQLException {
//      ProductGet get = new ProductGet();
//      get.insertProduct(new Product( 1, "chinhthuy", 1, null, null, 1, null, null, null, null, null, null, null) );
//      get.updateProduct(new Product(100, 1, "chinhthuy1", 1, null, null, 1, null, null, null, null, null, null, null));
//      get.delete(100);
//      for(Product p:get.getListProduct()) {
//    	  System.out.println(p.toString());
//      }
  
     
}
}
