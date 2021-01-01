package controller.admin;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import get.admin.UserGet;
import model.admin.Brand;
import model.admin.Cart;
import model.admin.user;



@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

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
        String product_name=request.getParameter("product_name");
        String url = "";
        user users = new user();
        HttpSession session = request.getSession();
       
        
        String error = "";
        if (product_name.equals("")) {
            error = "vui long nhap ten san pham";
            request.setAttribute("error", error);
        }

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "Search":
                       
                        url = "/search.jsp";
                        break;
                    
                }
            } else {
                url = "/single-product.jsp";
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
        
        
    }
}   
 