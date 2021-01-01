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

import get.admin.sliderGet;
import model.admin.slider;
@WebServlet("/sliderServlet")
public class sliderServlet extends HttpServlet {

	    sliderGet brandDAO = new sliderGet();

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
	        String command = request.getParameter("command");
	        String slider_id = request.getParameter("slider_id");

	        String url = "";
	        try {
	            switch (command) {

	                case "delete":
	                    brandDAO.delete(Integer.parseInt(slider_id));
	                    url = "/admin_QL/manager_slider.jsp";
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
	        String slider_name = request.getParameter("slider_name");
	        
	        

	        String url = "", error = "";
	        if (slider_name.equals("")) {
	            error = "Vui lòng nhập slider!";
	            request.setAttribute("error", error);
	        }

	        try {
	            if (error.length() == 0) {
	                switch (command) {
	                    case "insert":
	                    	int product_id=Integer.parseInt(request.getParameter("product_id"));
	                    	String slider_images=request.getParameter("slider_images");
	                        brandDAO.insertSlider(new slider((int) new Date().getTime(),product_id,slider_name,slider_images));
	                        url = "/admin_QL/manager_slider.jsp";
	                        break;
	                    case "update":
	                        int slider_id = Integer.parseInt(request.getParameter("slider_ma"));
	                        int product_idx=Integer.parseInt(request.getParameter("product_id"));
	                    	String slider_imagesx=request.getParameter("slider_images");
	                        brandDAO.updateSlider(new slider(slider_id, product_idx,slider_name,slider_imagesx));
	                        url = "/admin_QL/manager_slider.jsp";
	                        break;
	                }
	            } else {
	                url = "/admin_QL/insert_slider.jsp";
	            }
	        } catch (Exception e) {
	        }
	        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
	        rd.forward(request, response);

	    }

	}

