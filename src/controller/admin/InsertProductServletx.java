package controller.admin;
import connect.DBConnect;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/InsertProductServletx")
@MultipartConfig(maxFileSize = 16177215)


public class InsertProductServletx extends HttpServlet {
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/iphoneshop";
    private String dbUser = "root";
    private String dbPass = "123456";
    private static final String UPLOAD_DIRECTORY = "images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 request.setCharacterEncoding("utf-8");
         response.setCharacterEncoding("utf-8");
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 request.setCharacterEncoding("utf-8");
         response.setCharacterEncoding("utf-8");
        String tenSanPham = request.getParameter("tenSanPhamx");
        int maloai = Integer.parseInt(request.getParameter("maloaix"));
        int mathuonghieu = Integer.parseInt(request.getParameter("mathuonghieux"));
    
        int gia = Integer.parseInt(request.getParameter("giax"));
        String mota = request.getParameter("motax");
        String giam_Gia=request.getParameter("giam_Giax");
    
        String camera_Sau=request.getParameter("camera_Sau");
        String camera_Truoc=request.getParameter("camera_Truoc");
        String he_Dieu_Hanh=request.getParameter("he_Dieu_Hanh");
       
        String bo_Nho=request.getParameter("bo_Nho");
        String ram=request.getParameter("ram");
        
       
//         
        InputStream inputStream = null;
        InputStream inputStream1 = null;
//        InputStream inputStream2 = null;// input stream of the upload file
//         
//       
        Part filePart = request.getPart("hinhdaidienx");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart. getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
           
            inputStream = filePart.getInputStream();
            
             
            
        }
        Part filePart1 = request.getPart("hinhmatsaux");
        if (filePart1 != null) {
            // prints out some information for debugging
            System.out.println(filePart1.getName());
            System.out.println(filePart1.getSize());
            System.out.println(filePart1.getContentType());
             
          
            inputStream1 = filePart1.getInputStream();
        }
//        
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
           
            Connection connection = DBConnect.getConnecttion();
 
        
   String sql = "INSERT INTO product(category_id, product_name, brand_id, product_image, product_image_next, product_price, product_description,giam_Gia,camera_Sau,camera_Truoc,he_Dieu_Hanh,bo_Nho,ram) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";           
            PreparedStatement ps = connection.prepareStatement(sql);
       
         ps.setInt(1, maloai);
         ps.setString(2, tenSanPham);
         ps.setInt(3, mathuonghieu);
         if (inputStream != null) {
            
             String filename = filePart.getSubmittedFileName();
                ps.setString(4,  filename);
            }
         if (inputStream1 != null) {
             
             String filename1 = filePart1.getSubmittedFileName();
                ps.setString(5,  filename1);
            }
//         
         ps.setLong(6, gia);
         ps.setString(7, mota);
         ps.setString(8, giam_Gia);
       
         ps.setString(9, camera_Sau);
         ps.setString(10, camera_Truoc);
         ps.setString(11, he_Dieu_Hanh);
        
         ps.setString(12, bo_Nho);
         ps.setString(13, ram);
         

            int row = ps.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            
            request.setAttribute("Message", message);
             
         
            getServletContext().getRequestDispatcher("/admin_QL/manager_product.jsp?pages=1").forward(request, response);
        }
    
    }


}
