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
import model.admin.Brand;
import model.admin.Category;
import model.admin.nhanvien;

@WebServlet("/ManagerNhanVien")
public class ManagerNhanVien extends HttpServlet {

    BrandGet brandDAO = new BrandGet();
    nhanvienGet NVGet=new nhanvienGet();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String brand_id = request.getParameter("nv_id");

        String url = "";
        try {
            switch (command) {

                case "delete":
                    NVGet.delete(Integer.parseInt(brand_id));
                    url = "/admin_QL/manager_nv.jsp";
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
        String nv_name = request.getParameter("nv_name");
        String nv_mail = request.getParameter("nv_mail");
        String nv_diachi = request.getParameter("nv_diachi");
        String nv_sdt = request.getParameter("nv_sdt");
        int chucvu_id = Integer.parseInt(request.getParameter("chucvu_id"));
       

        String url = "", error = "";
        if (nv_name.equals("")) {
            error = "Vui lòng nhập tên thương hiệu!";
            request.setAttribute("error", error);
        }

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                       NVGet.insert(new nhanvien((int) new Date().getTime(), nv_name, nv_mail, nv_diachi, nv_sdt, chucvu_id));
                        url = "/admin_QL/manager_nv.jsp";
                        break;
                    case "update":
                    	int nv_id=Integer.parseInt(request.getParameter("nv_id"));
                        NVGet.update(new nhanvien(nv_id,nv_name,nv_mail,nv_diachi,nv_sdt,chucvu_id));
                        url = "/admin_QL/manager_nv.jsp";
                        break;
                }
            } else {
                url = "/admin_QL/insert_nv.jsp";
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }

}
