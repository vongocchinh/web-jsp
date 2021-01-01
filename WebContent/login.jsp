<%@page import="model.admin.Cart"%>
<%@page import="get.admin.UserGet"%>
<%@page import="model.admin.user"%>
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
<title>Insert title here</title>
</head>
<body>
<%
user user=null;
user user233=new user();
UserGet userGet=new UserGet();
if(session.getAttribute("user") != null){
   user = (user) session.getAttribute("user");
  
  user233=userGet.getUser(user.getUserID());
  
}
Cart cart = (Cart) session.getAttribute("cart");
if (cart == null) {
    cart = new Cart();
    session.setAttribute("cart", cart);
}
%>
	<jsp:include page="header.jsp"></jsp:include>
		<div class="container">
        <div class="pr-main-left">
           <jsp:include page="banner.jsp"></jsp:include>


        </div>
        <div class="pr-main-right">
            <h3 class="h3">Đăng Nhập</h3>
            <div class="form-tt">
                <form action="UserServlet" method="post" name="myForm_login" onsubmit="return validateFormlogin()">
                    <p>Nhập tên *:</p>
                    <input class="tt" type="text" name="name">
                    <p>Nhập Mật Khẩu *:</p>
                    <input class="tt" type="password" name="pass">

                    <p></p>
                    <div class="active-tt">
                    	<input type="hidden" name="command" value="login">
                        <input class="nhap" type="submit" value="Đăng Nhập">
                        <input class="reset" type="reset" value="Xóa">

                        <a class="back" href="dangki.jsp">Đăng Ký</a>
                    </div>
                </form>
            </div>

        </div>
    </div>
    <jsp:include page="footer-top.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
function validateFormlogin() {
    var username = document.forms["myForm_login"]["name"].value;
    var password = document.forms["myForm_login"]["pass"].value;
    if (username == "") {
        alert("Vui lòng nhập tên đăng nhập");
        return false;
    }
    if (password == "") {
        alert("Vui lòng nhập Mật Khẩu");
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