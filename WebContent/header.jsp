<%@page import="get.admin.BillDetailGet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.admin.BillDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="get.admin.BillGet"%>
<%@page import="model.admin.Bill"%>
<%@page import="model.admin.Cart"%>
<%@page import="get.admin.UserGet"%>
<%@page import="model.admin.user"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="get.admin.ProductGet"%>
<%@page import="model.admin.Product"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
 	<c:set var="root" value="${pageContext.request.contextPath}" />
 	<link rel="icon" type="image/png" href="${root}/img/favicon.ico"/>
	<meta charset="UTF-8">
	<link rel='stylesheet' type='text/css' media='screen' href='css/header.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/slider.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/header-2.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/logo.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/main3.css'>
    <script src="js/slider.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<link href="https://fonts.googleapis.com/css2?family=Lato:ital@1&display=swap" rel="stylesheet">
	<link rel='stylesheet' type='text/css' media='screen' href='css/main-index1.css'>
	<link rel='stylesheet' type='text/css' media='screen' href='css/main4.css'>
</head>
<body >
<%
user user1=null;
user usercheck=new user();
UserGet userGetcheck=new UserGet();
if(session.getAttribute("user") != null){
    user1 = (user) session.getAttribute("user");
    usercheck=userGetcheck.getUser(user1.getUserID());
}

Cart cart = (Cart) session.getAttribute("cart");
if (cart == null) {
    cart = new Cart();
    session.setAttribute("cart", cart);
}
DecimalFormat formatter = new DecimalFormat("###,###,###");
%>
 <header class="header-2" style="background-color: #FFBA00">
        <div class="header-top">
            <div class="header-top-1">
                <a class="logo" href="index.jsp" ><h3>NGỌC CHÍNH</h3><p>phone</p></a>
                <a class="logo1" href="index.jsp"><p>Điện thoại smartphone chính hãng</p></a>
            </div>
            <div class="header-top-2">
                <p> <strong>01263 717 084 </strong><br>
                    <span>Hộ trợ mua hàng </span>
                    <i class="fas fas-facebook"></i>
                </p>

            </div>
            <div class="header-top-3">
                <p> <strong> HỆ THỐNG CỬA HÀNG</strong><br>
                    <span> Mở cửa 08:00 - 21:30</span>
                </p>
            </div>
            <div class="header-top-4">
                <p><a href="cart.jsp" style="color: #070707"><strong>Giỏ Hàng</strong> / <%=formatter.format(cart.totalCart())%> đ<span class="cart-hv"><strong><%=cart.totalCart2() %></strong></span></a></p>
            </div>
            <div class="header-top-5">
                <div class="header-menu-header">
                    <a href="index.jsp" class="top">Trang chủ</a>
                    <%if(usercheck.getUserName()==null||usercheck.equals("")){ %>
                    <a href="login.jsp" class="top">Đăng nhập</a>
                    <a href="dangki.jsp" class="top">Đăng kí</a>
                    <%}else{ %>
                      <a href="/dienthoai/LogoutServlet?command=logout" class="top">Đăng xuất</a>
                      <a href="myaccount.jsp" class="top">My acount</a>
                    <%} %>
                    
                    <a href="cart.jsp" class="top">Giỏ hàng</a>
                    <a href="contact.jsp" class="top">Liên hệ</a>
                </div>
                <div class="header-menu-header2">
                    <form action="/dienthoai/SearchServlet" method="post" name="myForm_search" onsubmit="return validateFormsearch()">
                        <input class="search" name="product_name" type="search" placeholder="Bạn tìm gì...">
                        <input type="hidden" name="command" value="Search">
                        <input class="search_sb" type="submit"  value="Search">
                    </form>
                </div>
            </div>
        </div>
    </header>
    
        <i class='fab fa-facebook-messenger' style="z-index: 555"></i>
   
   

    <div class="container">

       
        
    </div>
   
   
</body>
<script>
    function myFunction1() {
        var x = document.getElementById("banner");
        if (x.style.display === "block") {
            x.style.display = "none";
        } else {
            x.style.display = "block";
        }
    }
    function validateFormsearch() {
        var search = document.forms["myForm_search"]["product_name"].value;

        if (search == "") {
            alert("Nhập tên sản phẩm tìm");
            return false;
        }


    }
</script>
</html>