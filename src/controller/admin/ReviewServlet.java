package controller.admin;


import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import get.admin.ReviewGet;
import model.admin.Review;
@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
ReviewGet reviewGet = new ReviewGet();
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        
        String name = request.getParameter("name");
        int product_id = Integer.parseInt(request.getParameter("product_id"));
        String email = request.getParameter("email");
        String message = request.getParameter("message");
        int rating =  Integer.parseInt(request.getParameter("rating"));
        
        
        

        String url = "", error = "";
        if (name.equals("")) {
            error = "Vui lòng nhập tên sản phẩm!";
            request.setAttribute("error", error);
        }
        	Date date=new Date();
        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        reviewGet.insertReview(new Review(product_id, name, email, rating, message, new Timestamp(date.getTime())));
                        url = "/single-product.jsp?productID="+product_id+"";
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
