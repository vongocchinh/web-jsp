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

@WebServlet("/insertSlider")
@MultipartConfig(maxFileSize = 16177215)

public class insertSlider extends HttpServlet {
	
	    // database connection settings
	    private String dbURL = "jdbc:mysql://localhost:3306/iphoneshop";
	    private String dbUser = "root";
	    private String dbPass = "123456";
	    private static final String UPLOAD_DIRECTORY = "images";

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	      
	    }

	 
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        
	        String slider_name = request.getParameter("slider_name");
	        int product_id = Integer.parseInt(request.getParameter("product_id"));
	        
	      
	    
	        
	       
//	         
	        InputStream inputStream = null;
	       
//	         
//	       
	        Part filePart = request.getPart("slider_images");
	        if (filePart != null) {
	            // prints out some information for debugging
	            System.out.println(filePart. getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	             
	            // obtains input stream of the upload file
	            inputStream = filePart.getInputStream();
	            
	             
	            
	        }
	        
//	        Part filePart2 = request.getPart("matsau");
//	        if (filePart2 != null) {
//	            // prints out some information for debugging
//	            System.out.println(filePart2.getName());
//	            System.out.println(filePart2.getSize());
//	            System.out.println(filePart2.getContentType());
//	             
//	            // obtains input stream of the upload file
//	            inputStream2 = filePart2.getInputStream();
//	        }
//	        
//	         
	        Connection conn = null; // connection to the database
	        String message = null;  // message will be sent back to client
	         
	        try {
	            // connects to the database
	            Connection connection = DBConnect.getConnecttion();
	 
	            // constructs SQL statement
	            String sql = "INSERT INTO slider (slider_id, product_id, slider_name, slider_images) VALUES(?,?,?,?)";
	           //,man_Hinh,camera_Sau,camera_Truoc,he_Dieu_Hanh,cpu,bo_Nho,ram,ket_Noi,pin_Sac,bao_Hanh
	            //,?,?,?,?,?,?,?,?,?,?
	            PreparedStatement ps = connection.prepareStatement(sql);
	         ps.setInt(1,(int) new Date().getTime());
	         ps.setInt(2, product_id);
	         ps.setString(3, slider_name);
	        
	         if (inputStream != null) {
	            
	             String filename = filePart.getSubmittedFileName();
	                ps.setString(4,  filename);
	            }
	        
//	         
	       
	         
	         
	         
	      
	             
	          
	 
	            // sends the statement to the database server
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
	            // sets the message in request scope
	            request.setAttribute("Message", message);
	             
	            // forwards to the message page
	            getServletContext().getRequestDispatcher("/admin_QL/manager_slider.jsp").forward(request, response);
	        }
	    
	    }


	}

