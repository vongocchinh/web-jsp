
package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import get.admin.ContactGet;
import get.admin.ReviewGet;
import model.admin.Contact;
import model.admin.Product;
import model.admin.Review;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
ContactGet contactGet = new ContactGet();
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        
        String name = request.getParameter("name");
        
        

        String url = "", error = "";
        if (name.equals("")) {
            error = "Vui lòng nhập tên sản phẩm!";
            request.setAttribute("error", error);
        }

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
					                        
					        String web = request.getParameter("web");
					        String email = request.getParameter("email");
					        String message = request.getParameter("message");
					        String title =  request.getParameter("title");
					        
                        contactGet.insertContact(new Contact( name, web, email, title, message, new Timestamp(new Date().getTime())));
                        url = "/thanks.jsp";
                        break; 
                   
                }
            } else {
                url = "/dienthoai/contact.jsp";
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }

}
