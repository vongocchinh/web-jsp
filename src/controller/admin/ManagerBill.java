package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.swing.internal.plaf.basic.resources.basic;

import get.admin.BillDetailGet;
import get.admin.BillGet;
import get.admin.BrandGet;
import get.admin.CategoryGet;
import model.admin.BillDetail;
import model.admin.Brand;
import model.admin.Category;
@WebServlet("/ManagerBill")
public class ManagerBill extends HttpServlet {

	

	
	

	    BillGet brandDAO = new BillGet();
	    BillDetailGet billDetailGet=new BillDetailGet();
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
	        String command = request.getParameter("command");
	        String bill_id = request.getParameter("bill_id");
	        
	        String url = "";
	      
	        HttpSession session = request.getSession();
	        int a;
	        try {
	        	Integer count = new Integer(0);
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection
				("jdbc:mysql://localhost:3306/iphoneshop", "root", "123456");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from counter");
	            switch (command) {

	                case "delete":
	                    brandDAO.delete(Integer.parseInt(bill_id));
	                    billDetailGet.delete(Integer.parseInt(bill_id));	                    	                    	                        
	                    url = "/admin_QL/manager_bill.jsp";
	                    while (rs.next()) {
                            count = rs.getInt("count_");
                           count++;
      					st.executeUpdate("update counter set count_=" + count + "");
	                    }
	                    break;
	            }
	        } catch (Exception e) {
	        }
	        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
	        rd.forward(request, response);
	    }

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
	        String command = request.getParameter("command");
	        String tenThuongHieu = request.getParameter("tenThuongHieu");
	        

	        String url = "", error = "";
	        if (tenThuongHieu.equals("")) {
	            error = "Vui lòng nhập tên thương hiệu!";
	            request.setAttribute("error", error);
	        }

	        try {
	            if (error.length() == 0) {
	                switch (command) {
	                    case "insert":
	                      
	                        break;
	                    case "update":
	                        
	                        break;
	                }
	            } else {
	                url = "/admin/insert_brand.jsp";
	            }
	        } catch (Exception e) {
	        }
	        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
	        rd.forward(request, response);

	    }

	}

