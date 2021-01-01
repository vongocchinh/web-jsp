<%@page import="get.admin.UserGet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="get.admin.ProductGet"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.admin.Cart"%>
<%@page import="model.admin.Product"%>
<%@page import="model.admin.user"%>
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
<title>Đặt hàng ...</title>
</head>
<body>

 <% 
 user user=null;
 user user2333=new user();
 UserGet userGet2333=new UserGet();
 if(session.getAttribute("user") != null){
     user = (user) session.getAttribute("user");
     user2333=userGet2333.getUser(user.getUserID());
 }
 if(user==null){
     response.sendRedirect("login.jsp");
 }
    ProductGet productGet=new ProductGet();
        
           
           
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
            <h3 class="h3">Vui Lòng Điền Thông Tin Để Đặt Hàng</h3>
            <div class="form-tt">
                <form action="CheckOutServlet" method="post" name="myForm_checkout" onsubmit="return validateFormcheckout()">
                    <p>Nhập tên *:</p>
                    <input class="tt" type="text" value="<%=user2333.getUserName() %>" name="username">
                    <p>Nhập Mail *:</p>
                    <input class="tt" type="text" value="<%=user2333.getUserEmail() %>" name="mail">
                    <p>Nhập Số Điện Thoại *:</p>
                    <input class="tt" type="text" value="<%=user2333.getUserPhone() %>" name="sdt">
                    <p>Nhập Thành Phố/Tỉnh *:</p>
                    <input class="tt" type="text"  name="thanhpho">
                    <p>Nhập Huyện/Quận *:</p>
                    <input class="tt" type="text" name="huyen">
                    <p>Nhập Phường/Xã *:</p>
                    <input class="tt" type="text" name="xa">
                    <p>Nhập Số Nhà/... *:</p>
                    <input class="tt" type="text" name="sonha">
                    <p></p>
                    <p>* Thông tin đơn hàng *</p>
                    <table id="table-tt">
                        <tr>
                            <th>Tổng tiền </th>
                            <td><%=formatter.format(cart.totalCart()) %> đ</td>
                        </tr>
                        <tr>
                            <th>Sô lượng </th>
                            <td><%=cart.totalCart2()%></td>
                        </tr>
                        <tr>
                            <th>Sản phẩm </th>
                            <td><%=cart.sp() %></td>
                        </tr>
                    </table>
                    <p></p>
                    <div class="active-tt">
                        <input class="nhap" name="thanh toan" type="submit" value="Xác Nhận">
                        <input class="reset" type="reset" value="Địa Chỉ Khác">

                        <a class="back" href="cart.jsp">Quay Lại Giỏ Hàng</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
	<jsp:include page="footer-top.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
function validateFormcheckout() {
    var username = document.forms["myForm_checkout"]["username"].value;
    var mail = document.forms["myForm_checkout"]["mail"].value;
    var sdt = document.forms["myForm_checkout"]["sdt"].value;
    var thanhpho = document.forms["myForm_checkout"]["thanhpho"].value;
    var huyen = document.forms["myForm_checkout"]["huyen"].value;
    var xa = document.forms["myForm_checkout"]["xa"].value;
    var sonha = document.forms["myForm_checkout"]["sonha"].value;

    if (username == "") {
        alert("Vui lòng nhập tên đăng nhập");
        return false;
    }
    if (mail == "") {
        alert("Vui lòng nhập mail");
        return false;
    }
    if (sdt == "") {
        alert("Vui lòng nhập số điện thoại");
        return false;
    }
    if (thanhpho == "") {
        alert("Vui lòng nhập thành phố");
        return false;
    }
    if (huyen == "") {
        alert("Vui lòng nhập huyện");
        return false;
    }
    if (xa == "") {
        alert("Vui lòng nhập xã");
        return false;
    }
    if (sonha == "") {
        alert("Vui lòng nhập số nhà");
        return false;
    }
}
</script>
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