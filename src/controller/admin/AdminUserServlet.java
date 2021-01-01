
package controller.admin;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.accessibility.internal.resources.accessibility;

import get.admin.GetdateloginAdmin;
import get.admin.UserAdminGet;
import mdhash.mdjavahash;
import model.admin.DateLoginAdmin;
import model.admin.userAdmin;


@WebServlet("/AdminUserServlet")
public class AdminUserServlet extends HttpServlet {

  UserAdminGet userAdminGet = new UserAdminGet();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 request.setCharacterEncoding("utf-8");
         response.setCharacterEncoding("utf-8");
        String commandadmin = request.getParameter("commandadmin");
        String url = "";
        userAdmin userAdmin = new userAdmin();
        mdjavahash md = new mdjavahash();
        HttpSession session = request.getSession();
        GetdateloginAdmin getdateloginAdmin=new GetdateloginAdmin();
        switch (commandadmin) {
            
            case "login":
			try {
				userAdmin = userAdminGet.login2(request.getParameter("userAdmin"), (md.getHashPass(request.getParameter("passAdmin"))));
			} catch (NoSuchAlgorithmException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
               
              
                if (userAdmin != null) {
                	 session.setAttribute("userad", userAdmin);
                	int id=userAdmin.getId();
                	
                	 try {
 						getdateloginAdmin.insert(new DateLoginAdmin( (int) new Date().getTime(),new Timestamp(new Date().getTime()),id));
 					} catch (SQLException e) {
 						// TODO Auto-generated catch block
 						e.printStackTrace();
 					}
                   
                   url = "/dienthoai/admin_QL/index.jsp";
                   
                }
                
                else{
                	System.out.println("yes");
                    request.setAttribute("login_erro", "Loi Danh Nhap");
                    url = "/dienthoai/admin_QL/login.jsp";
                }
                break;
                
          
            	case "insert":

            	userAdmin users=new userAdmin();
            	UserAdminGet userAdminGet=new UserAdminGet();
                users.setId((int) new java.util.Date().getTime());
			
				users.setUserNameAdmin((request.getParameter("name")));
			
                  
			try {
				users.setPassWordAdmin(md.getHashPass(request.getParameter(("pass"))));
			} catch (NoSuchAlgorithmException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
                
                boolean a=Boolean.parseBoolean(request.getParameter("role"));
                System.out.println(request.getParameter("role"));
                users.setRoleAdmin(a);
                
                     
			try {
				userAdminGet.insertUserAdmin(users);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}             
              
                url = "/dienthoai/admin_QL/danhsachAdmin.jsp";   
                break;
        }
        response.sendRedirect(url);
       
    }
    
  
    

 }

