package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.jni.Time;

import get.admin.BrandGet;
import get.admin.CategoryGet;
import get.admin.nhanvienGet;
import get.admin.postGet;
import model.admin.Brand;
import model.admin.Category;
import model.admin.nhanvien;
import model.admin.post;

@WebServlet("/Baiviet")
public class Baiviet extends HttpServlet {

  postGet postGet=new postGet();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String post_id = request.getParameter("post_id");

        String url = "";
        try {
            switch (command) {

                case "delete":
                    postGet.delete(Integer.parseInt(post_id));
                    url = "/admin_QL/manager_post.jsp";
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
        String post_name = request.getParameter("post_name");
        String post_post = request.getParameter("post_post");
        String post_img = request.getParameter("post_img");
       
       

        String url = "", error = "";
        if (post_name.equals("")) {
            error = "Vui lòng nhập tên thương hiệu!";
            request.setAttribute("error", error);
        }

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                       postGet.insertPost(new post((int) new Date().getTime(), post_name, post_post,post_img));
                        url = "/admin_QL/manager_post.jsp";
                        break;
                    case "update":
                    	int nv_id=Integer.parseInt(request.getParameter("post_id"));
                        postGet.updateSlider(new post(nv_id,post_name,post_post,post_img));
                        url = "/admin_QL/manager_post.jsp";
                        break;
                }
            } else {
                url = "/admin_QL/insert_post.jsp";
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }

}
