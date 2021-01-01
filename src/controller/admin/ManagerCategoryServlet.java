package controller.admin;

import java.io.IOException;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import get.admin.CategoryGet;
import model.admin.Category;

@WebServlet("/ManagerCategoryServlet")
public class ManagerCategoryServlet extends HttpServlet {

    CategoryGet categoryDAO = new CategoryGet();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String category_id = request.getParameter("category_id");

        String url = "";
        try {
            switch (command) {

                case "delete":
                    categoryDAO.deleteCategory(Integer.parseInt(category_id));
                    url = "/admin_QL/manager_category.jsp";
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
        String tenDanhMuc = request.getParameter("tenDanhMuc");
        

        String url = "", error = "";
        if (tenDanhMuc.equals("")) {
            error = "Vui Long Nhap Ten Danh Muc!";
            request.setAttribute("error", error);
        }

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        categoryDAO.insertCategory(new Category((int) new Date().getTime(), tenDanhMuc));
                        url = "/admin_QL/manager_category.jsp";
                        break;
                    case "update":
                        int maDanhMuc = Integer.parseInt(request.getParameter("maDanhMuc"));
                        categoryDAO.updateCategory(new Category(maDanhMuc, tenDanhMuc));
                        url = "/admin_QL/manager_category.jsp";
                        break;
                }
            } else {
                url = "/admin_QL/insert_category.jsp";
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }

}