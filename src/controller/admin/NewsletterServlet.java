package controller.admin;


import get.admin.NewsletterGet;

import model.admin.Newsletter;

import java.io.IOException;

import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/NewsletterServlet")
public class NewsletterServlet extends HttpServlet {

 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        
        String email = request.getParameter("email");
        
        
        	NewsletterGet newsletterGet=new NewsletterGet();
        String url = "", error = "";
        if (email.equals("")) {
            error = "Vui long nhap đia chỉ email !";
            request.setAttribute("error", error);
        }

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":    
                    	
                        newsletterGet.insertNewsletter(new Newsletter( (int)new Date().getTime(), email, new Timestamp(new Date().getTime())));
                        url = "/thanks.jsp";
                        break; 
                   
                }
            } else {
                url = "/index.jsp";
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }

}
