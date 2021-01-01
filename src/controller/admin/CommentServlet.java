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
import javax.servlet.http.HttpSession;

import get.admin.BrandGet;
import get.admin.cmtGet;
import model.admin.Brand;
import model.admin.Comment;
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	BrandGet brandDAO = new BrandGet();
	cmtGet cmtGet=new cmtGet();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String cmt_id = request.getParameter("cmt_id");

        String url = "";
        try {
            switch (command) {

                case "delete":
                    cmtGet.delete_(Integer.parseInt(cmt_id));
                    url = "/single-product.jsp";
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
        String cmt = request.getParameter("cmt");
        int product_id=Integer.parseInt(request.getParameter("product_id"));
        HttpSession session = request.getSession();
        Comment comment=new Comment();
        String url = "", error = "";
        if (cmt.equals("")) {
            error = "Vui lòng nhập tên thương hiệu!";
            request.setAttribute("error", error);
        }

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                    	int review_id=Integer.parseInt(request.getParameter("review_id"));
                    	
                    	String cmt_name = request.getParameter("cmt_name");
                    	if(cmt_name==null) {
                    		comment.setComment_name("Nguoi Khac");
                    	}
                        cmtGet.insertcmt(new Comment((int) new Date().getTime(),review_id,cmt,cmt_name,new Timestamp(new Date().getTime()),product_id));
                        url = "/single-product.jsp?productID="+product_id+"";
                        session.setAttribute("product_id", product_id);
                        break;
                    case "update":
                       
                }
            } else {
                url = "/single-product.jsp";
                session.setAttribute("product_id", product_id);
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
        session.setAttribute("product_id", product_id);

    }
}
