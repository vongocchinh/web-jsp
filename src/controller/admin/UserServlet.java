package controller.admin;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import get.admin.UserGet;
import mdhash.mdjavahash;
import model.admin.Cart;
import model.admin.user;



@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

  UserGet userGet = new UserGet();
  Cart cart = new Cart();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        
        mdjavahash md = new mdjavahash();
        
        String url = "";
        user users = new user();
        HttpSession session = request.getSession();
        switch (command) {
            case "insert":

            	
                users.setUserID((int) new java.util.Date().getTime());
                users.setUserName(request.getParameter("name"));
                users.setUserEmail(request.getParameter("email"));    

			try {
				users.setUserPass(md.getHashPass(request.getParameter("pass")));
			} catch (NoSuchAlgorithmException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
                users.setUserRole(Boolean.parseBoolean(request.getParameter("gender")));
                
                users.setUserPhone(request.getParameter("phone"));  
                users.setTen(request.getParameter("ten"));  
                users.setDiachi(request.getParameter("diachi"));  
				try {
					if (!userGet.checkUserName(request.getParameter("name"))) {
						  
						 userGet.insertUser(users);  
						 url = "/dienthoai/login.jsp";   
						 session.setAttribute("loicheckname", "");
	                }else {
	                	url = "/dienthoai/dangki.jsp"; 
	                	session.setAttribute("loicheckname", "tontai");
	                }
				} catch (SQLException e) {
					
					 Logger.getLogger(CheckEmailServlet.class.getName()).log(Level.SEVERE, null, e);
				}
	                         
	               // session.setAttribute("user", users);
               
                break;
              case "update":
                  int user_id = Integer.parseInt(request.getParameter("user_id"));
        String username = request.getParameter("name");
        String useremail = request.getParameter("email");
			String password="";
			try {
				password = md.getHashPass(request.getParameter("pass"));
			} catch (NoSuchAlgorithmException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
        boolean role = false;
        String phone = request.getParameter("phone");
        String ten = request.getParameter("ten");
        String diachi = request.getParameter("diachi");
			try {
				if (userGet.checkpassword(password)) {
					   userGet.updateUser(new user(user_id, username, useremail, password, role, phone,ten,diachi));
				}else {
					url="/dienthoai/myaccount.jsp";
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				Logger.getLogger(CheckEmailServlet.class.getName()).log(Level.SEVERE, null, e1);
			}
                        url = "/dienthoai/myaccount.jsp";
                        break; 
            case "logindeal":
//                users = userGet.login(request.getParameter("name"), (request.getParameter("pass")));                
//                if (users != null) {
//                    session.setAttribute("user", users);
//                    url = "/deal.jsp";        
//                }
//                break;
//              
//                  
            case "login":
            	
			try {
				
				users = userGet.login(request.getParameter("name"), (md.getHashPass(request.getParameter("pass"))));
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}                
                if (users != null) {
                    session.setAttribute("user", users);
                    url = "/dienthoai/index.jsp";          
                }
                
                
                else{
                	String error="Loi Dang Nhap !!!";
                    request.setAttribute("error",error);
                    url = "/dienthoai/login.jsp";
                }
                break;
                
        }
        response.sendRedirect(url);
    

    }
    

}
