package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import get.admin.ProductGet;
import model.admin.Cart;
import model.admin.Item;
import model.admin.Product;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    
    private final ProductGet productGet = new ProductGet();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String command = request.getParameter("command");
        String productID = request.getParameter("productID");
        Cart cart = (Cart) session.getAttribute("cart");
        Integer idProduct = Integer.parseInt(productID);
        try {
            
            Product product = productGet.getProduct(idProduct);
            switch (command) {
                case "plus":
                    if (cart.getCartItems().containsKey(idProduct)) {
                        cart.plusToCart(idProduct, new Item(product,
                                cart.getCartItems().get(idProduct).getQuantity()));
                    } else {
                        cart.plusToCart(idProduct, new Item(product, 1));
                    }
                    break;
                case "remove":
                    cart.removeToCart(idProduct);
                    break;
                case "subToCart":
                	cart.subToCart(idProduct, new Item(product,cart.getCartItems().get(idProduct).getQuantity()));
                	 break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/dienthoai/single-product.jsp");
        }
        session.setAttribute("cart", cart);
        session.setAttribute("id_p", idProduct);
        response.sendRedirect("/dienthoai/cart.jsp");
    }
    
}
