package controller.admin;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.swing.internal.plaf.basic.resources.basic;

import get.admin.QCGet;
import model.admin.QC;
import model.admin.slider;
@WebServlet("/QCServlet")
public class QCServlet extends HttpServlet {
	QCGet bGet=new QCGet();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String qc_id = request.getParameter("qc_id");

        String url = "";
        try {
            switch (command) {

                case "delete":
                	bGet.delete(Integer.parseInt(qc_id));
                    url = "/admin_QL/manager_QC.jsp";
                    break;
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        
        
        

        String url = "", error = "";
        

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                    	int muc_id=Integer.parseInt(request.getParameter("muc_id"));
                    	String images_qc = request.getParameter("images_qc");
                    	int product_id=Integer.parseInt(request.getParameter("product_id"));
                        bGet.insertSlider(new QC((int) new Date().getTime(),product_id,muc_id,images_qc));
                        url = "/admin_QL/manager_QC.jsp";
                        break;
                    case "update":
                    	String images_qcx = request.getParameter("images_qc");
                        int qc_id = Integer.parseInt(request.getParameter("qc_id"));
                        int product_idx=Integer.parseInt(request.getParameter("product_id"));
                    	int muc_idx=Integer.parseInt(request.getParameter("muc_id"));
                        bGet.updateSlider(new QC(qc_id, product_idx,muc_idx,images_qcx));
                        url = "/admin_QL/manager_QC.jsp";
                        break;
                }
            } else {
                url = "/admin_QL/insert_QC.jsp";
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }
}
