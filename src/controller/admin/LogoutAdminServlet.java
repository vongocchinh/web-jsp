
package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/LogoutAdminServlet")
public class LogoutAdminServlet extends HttpServlet {

    
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            HttpSession session = request.getSession();
//            Object sessionuseradmin = session.getAttribute("userad");
//            if(sessionuseradmin != null){
//                session.removeAttribute("userad");
//                response.sendRedirect("/admin/login.jsp");
//            }
//        }
//    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//    	HttpSession session = request.getSession(false);
//        if (session != null) {
//            session.removeAttribute("userad");
//             
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/loginAdmin.jsp");
//            dispatcher.forward(request, response);
//        }
        if (request.getParameter("command").equals("logout")) {
        HttpSession session = request.getSession();
        session.invalidate();
        
        response.sendRedirect("/dienthoai/admin_QL/index.jsp");
    }
    }
    


   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}




	@Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
