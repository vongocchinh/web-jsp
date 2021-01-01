
package controller.admin;

import get.admin.UserGet;
import mdhash.mdjavahash;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ChechPassUser extends HttpServlet {

        UserGet userGet = new UserGet();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 mdjavahash md = new mdjavahash();
            try {
                if (userGet.checkpassword(md.getHashPass(request.getParameter("name")))) {
                    response.getWriter().write("<img src=\"img/not-available.png\" /> Tai khoan nay da co nguoi su dung");
                } else {
                    response.getWriter().write("<img src=\"img/available.png\" /> Tai khoan hop le");
                }      } catch (SQLException ex) {
                Logger.getLogger(ChechPassUser.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
    }

  
   

}
