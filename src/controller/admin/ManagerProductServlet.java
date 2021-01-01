
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

import get.admin.CategoryGet;
import get.admin.ProductGet;
import model.admin.Category;
import model.admin.Product;

@WebServlet("/ManagerProductServlet")
public class ManagerProductServlet extends HttpServlet {

    ProductGet productGet = new ProductGet();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String product_id = request.getParameter("product_id"); 
        String url = "";
        try {
            switch (command) {

                case "delete":
                    productGet.deleteProduct(Integer.parseInt(product_id));
                    url = "/admin_QL/manager_product.jsp";
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
        
        String tenSanPham = request.getParameter("tenSanPham");
        ;

        String url = "", error = "";
        if (tenSanPham==null) {
            error = "Vui Long Nhap Tên San Pham!";
            request.setAttribute("error", error);
        }
        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                    	String tenSanPhamxx = request.getParameter("tenSanPhamx");
                        int maloai = Integer.parseInt(request.getParameter("maloaix"));
                        int mathuonghieu = Integer.parseInt(request.getParameter("mathuonghieux"));
                        String daidien = request.getParameter("hinhdaidienx");
                        String matsau = request.getParameter("hinhmatsaux");
                        int gia = Integer.parseInt(request.getParameter("giax"));
                        String mota= request.getParameter("motax");
                        String giam_Gia=request.getParameter("giam_Giax");
                       
                        String camera_Sau=request.getParameter("camera_Saux");
                        String camera_Truoc=request.getParameter("camera_Truocx");
                        String he_Dieu_Hanh=request.getParameter("he_Dieu_Hanhx");
                       
                        String bo_Nho=request.getParameter("bo_Nhox");
                        String ram=request.getParameter("ramx");
                       
                       

                    	System.out.println("toi da truy cap insert");
                    	Product product=new Product((int) new Date().getTime(), maloai,tenSanPhamxx, mathuonghieu, 
                                daidien,  matsau, gia, mota,giam_Gia,camera_Sau,camera_Truoc,he_Dieu_Hanh,bo_Nho,ram);
                    		productGet.insertProduct(product);
                        url = "/admin_QL/manager_product.jsp";
                        break;
                    case "update":
                    	String tenSanPhamx = request.getParameter("tenSanPham");
                        int maloaix = Integer.parseInt(request.getParameter("maloai"));
                        int mathuonghieux = Integer.parseInt(request.getParameter("mathuonghieu"));
                        String daidienx = request.getParameter("hinhdaidien");
                        String matsaux = request.getParameter("hinhmatsau");
                        int giax = Integer.parseInt(request.getParameter("gia"));
                        String motax = request.getParameter("mota");
                        String giam_Giax=request.getParameter("giam_Gia");
                       
                        String camera_Saux=request.getParameter("camera_Sau");
                        String camera_Truox=request.getParameter("camera_Truoc");
                        String he_Dieu_Hanhx=request.getParameter("he_Dieu_Hanh");
                      
                        String bo_Nhox=request.getParameter("bo_Nho");
                        String ramx=request.getParameter("ram");
                      
                      
                    	 int product_id = Integer.parseInt(request.getParameter("product_id"));
                    	 	productGet.updateProduct(new Product(product_id, maloaix,tenSanPham, mathuonghieux,
                             daidienx,  matsaux, giax, motax,giam_Giax,camera_Saux,camera_Truox,he_Dieu_Hanhx,bo_Nhox,ramx));
                        	url = "/admin_QL/product_description.jsp?product_id="+product_id+"";
                        break;
                    
                    
                }
            } else {
                url = "/admin_QL/insert_product.jsp";
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }

    
}





//,man_Hinh,camera_Sau,camera_Truoc,he_Dieu_Hanh,cpu,bo_Nho,ram,ket_Noi,pin_Sac,bao_Hanh



//String man_Hinh=request.getParameter("man_Hinh");
//String camera_Sau=request.getParameter("camera_Sau");
//String camera_Truoc=request.getParameter("camera_Truoc");
//String he_Dieu_Hanh=request.getParameter("he_Dieu_Hanh");
//String cpu=request.getParameter("cpu");
//String bo_Nho=request.getParameter("bo_Nho");
//String ram=request.getParameter("ram");
//String ket_Noi=request.getParameter("ket_Noi");
//String pin_Sac=request.getParameter("pin_Sac");
//String bao_Hanh=request.getParameter("bao_Hanh");










//,man_Hinhx,camera_Saux,camera_Truox,he_Dieu_Hanhx,cpux,bo_Nhox,ramx,ket_Noix,pin_Sacx,bao_Hanhx
