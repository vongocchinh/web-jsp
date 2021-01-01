<%@page import="get.admin.ProductGet"%>
<%@page import="model.admin.Product"%>
<%@page import="model.admin.Item"%>
<%@page import="java.util.Map"%>
<%@page import="model.admin.user"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.admin.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
 	<c:set var="root" value="${pageContext.request.contextPath}" />
 	<link rel="icon" type="image/png" href="${root}/images/favicon.ico"/>
	<meta charset="UTF-8">
	<link rel='stylesheet' type='text/css' media='screen' href='css/header.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/slider.css'>
    <script src="js/slider.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Giỏ hàng của bạn ...</title>
</head>
<body>
<% 
       user user=null;
    
    if(session.getAttribute("user") != null){
        user = (user) session.getAttribute("user");
    }
    ProductGet productGet33=new ProductGet();
    Product product33=new Product();
    String productID33 = "";
    
    ProductGet productGet=new ProductGet();
    Product product3=new Product();
    String productID="";
    
   String category="1";
   String brand="1";
   if(request.getParameter("category")!=null){
       category=request.getParameter("category");
   }
   if(request.getParameter("brand")!=null){
       category=request.getParameter("brand");
   }
    
    if (request.getParameter("productID") != null) {
         productID33 = request.getParameter("productID");
         product33 = productGet.getProduct(Integer.parseInt(productID33));
    }
             Cart cart = (Cart) session.getAttribute("cart");
             if (cart == null) {
                 cart = new Cart();
                 session.setAttribute("cart", cart);
             }
             DecimalFormat formatter = new DecimalFormat("###,###,###");
             
         
         
         %>
	<jsp:include page="header.jsp"></jsp:include>
	 <div class="container">
        <div class="pr-main-left">
        <jsp:include page="banner.jsp"></jsp:include>
        </div>
        <div class="pr-main-right">
        <form action="/baitap/CartServlet" method="post">
        <div class="cart">
                <h3>Giỏ hàng Của Bạn</h3>
                <table id="tb1">
                    <tr>
                    	<th>Xóa</th>
                        <th>Sản Phẩm</th>
                        <th>Hình ảnh</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Tổng Tiền</th>
                    </tr>
                     <%for (Map.Entry<Integer, Item> list : cart.getCartItems().entrySet()) {%>
                    <tr>
                    	<td><a  href="CartServlet?command=remove&productID=<%=list.getValue().getProduct().getProductID()%>">&#215;</a></td>
                        <td> <%=list.getValue().getProduct().getProductName() %> - Hàng Chính Hãng</td>
                         <td><img style="width: 90px;height: 100px" src="/dienthoai/imagesphone/<%=list.getValue().getProduct().getProductImage()%>"></td>
                          <%
			                	int giasp=list.getValue().getProduct().getProductPrice();
			                	int giasale=(int)Integer.parseInt(list.getValue().getProduct().getGiam_Gia());
			                	float giasale2=(float)giasale/100;
			                	float giacon=giasp-(giasale2*giasp);
               				 %>
                        <td><%=formatter.format(giacon)%> đ</td>
                        <td>
                        <a class="non-textdecoration" style="color: red;" class="cart_quantity_up" href="CartServlet?command=subToCart&productID=<%=list.getValue().getProduct().getProductID()%>">-</a>
                        <%=list.getValue().getQuantity()%>
                        <input type="hidden" value="plus" name="command">
                        <a style="color: red;text-decoration: none;" class="cart_quantity_up" href="CartServlet?command=plus&productID=<%=list.getValue().getProduct().getProductID()%>"> + </a>
                        
                        
                        </td>
                        <td><%=formatter.format(giacon*list.getValue().getQuantity())%></td>
                    </tr>
                    
<%} %>
                </table>
               
                <div class="clear"></div>
                <h4></h4>
                <div class="form-sl">

                    <table id="tb2">
                        <tr>
                            <th>Tổng cộng</th>
                            <td class="right"><%=formatter.format(cart.totalCart())%> Đồng</td>
                        </tr>
                        <tr>
                            <th>Tổng Số Lượng</th>
                            <td class="right"><%=cart.totalCart2()%></td>
                        </tr>
                        <tr>
                            <th>
                                <p>Mã Giảm Giá:</p>
                            </th>
                            <td><input class="main-gg" type="text"></td>
                        </tr>
                        <tr>
                            <th>Tổng cộng</th>
                            <td class="right"><%=formatter.format(cart.totalCart())%> Đồng</td>
                        </tr>
                    </table>
                    <div style="margin-top: 30px;margin-left: 10px">
	                    <a style="padding: 6px 10px;background-color: #46B1FF;color: white;border-radius: 5px" type="sumbit" href="checkout.jsp">Đặt Hàng</a>
	                	<a style="padding: 6px 10px;background-color: #46B1FF;color: white;border-radius: 5px">Đặt Hàng Ngay</a>
                    </div>
                	</div>
            </div>
            </form>
        </div>
       </div> 
       <jsp:include page="footer-top.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css" />
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js " integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n " crossorigin="anonymous "></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js "></script>
<script type="text/javascript">
    $(document).ready(function() {
        $(".main1-sp2").slick({
            slidesToShow: 5,
            slidesToScroll: 1,
            autoplay: 100,
            infinite: true,
            autoplaySpeed: 2000,


        })
    })
</script>
</html>