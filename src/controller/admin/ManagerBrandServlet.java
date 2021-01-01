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

import get.admin.BrandGet;
import get.admin.CategoryGet;
import model.admin.Brand;
import model.admin.Category;

@WebServlet("/ManagerBrandServlet")
public class ManagerBrandServlet extends HttpServlet {

    BrandGet brandDAO = new BrandGet();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String brand_id = request.getParameter("brand_id");

        String url = "";
        try {
            switch (command) {

                case "delete":
                    brandDAO.deleteBrand(Integer.parseInt(brand_id));
                    url = "/admin_QL/manager_brand.jsp";
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
                        brandDAO.insertBrand(new Brand((int) new Date().getTime(), tenThuongHieu));
                        url = "/admin_QL/manager_brand.jsp";
                        break;
                    case "update":
                        int maThuongHieu = Integer.parseInt(request.getParameter("maThuongHieu"));
                        brandDAO.updateBrand(new Brand(maThuongHieu, tenThuongHieu));
                        url = "/admin_QL/manager_brand.jsp";
                        break;
                }
            } else {
                url = "/admin_QL/insert_brand.jsp";
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }

}