
package controller.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import get.admin.BillDetailGet;
import get.admin.BillGet;
import model.admin.Bill;
import model.admin.BillDetail;
import model.admin.Cart;
import model.admin.Item;
import model.admin.user;

@WebServlet("/CheckOutServlet")
public class CheckOutServlet extends HttpServlet {

    private final BillGet billGet = new BillGet();
    private final BillDetailGet billDetailGet = new BillDetailGet();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String payment = request.getParameter("mail");
        String address = request.getParameter("thanhpho");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        user users = (user) session.getAttribute("user");
        String name = request.getParameter("username");
        String phone = request.getParameter("sdt");
        String huyen1 = request.getParameter("huyen");
        String xa1 = request.getParameter("xa");
        String sonha1 = request.getParameter("sonha");
        Date date=new Date();
        try {
            Integer ID = (int) new Date().getTime();
            Bill bill = new Bill();
            bill.setBillID(ID);
            bill.setAddress(address);
            bill.setPayment(payment);
            bill.setUserID(users.getUserID());
            bill.setDate(new Timestamp(date.getTime()));
            bill.setTotal(cart.totalCart());
            bill.setName(name);
            bill.setPhone(phone);
            bill.setHuyen(huyen1);
            bill.setXa(xa1);
            bill.setSonha(sonha1);
            billGet.insertBill(bill);
            for (Map.Entry<Integer, Item> list : cart.getCartItems().entrySet()) {
            	int giagoc=list.getValue().getProduct().getProductPrice();
            	int giasale=(int)Integer.parseInt(list.getValue().getProduct().getGiam_Gia());
            	float giasale2=(float) giasale/100;
            	float giacon=(float) giagoc-(giagoc*giasale2);
                billDetailGet.insertBillDetail(new BillDetail((int) new  Date().getTime(), ID,
                        list.getValue().getProduct().getProductID(),
                        giacon*list.getValue().getQuantity(),
                        list.getValue().getQuantity()));
            }
            cart = new Cart();
            session.setAttribute("cart", cart);
        } catch (Exception e) {
        }
        response.sendRedirect("/dienthoai/thanks.jsp");
    }
   

}