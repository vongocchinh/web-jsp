<%@page import="model.admin.Cart"%>
<%@page import="get.admin.UserGet"%>
<%@page import="model.admin.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="get.admin.ProductGet"%>
<%@page import="model.admin.Product"%>
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
<title>Đăng kí tài khoản ...</title>
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
            <h3 class="h3">Đăng Ký Tài Khoản</h3>
            <div class="form-tt">
                <form name="myForm_dangki" onsubmit="return validateFormdangki()" action="UserServlet" method="post">
                    <%if(session.getAttribute("loicheckname").equals("tontai")){
                    	%>
                    	<p style="color: red">Tài khoản tồn tại !</p>
                    	<% 
                    }
                    	%>
                    
                    <p>Nhập Tên Đăng Nhập*:</p>
                    <input class="tt" type="text" name="name">
                    <p>Nhập Mail *:</p>
                    <input class="tt" type="text" name="email">
                    <p>Nhập Họ và Tên *:</p>
                    <input class="tt" type="text" name="ten">
                    <p>Nhập Số Điện Thoại *:</p>
                    <input class="tt" type="text" name="phone">
                    <p>Nhập Địa Chỉ *:</p>
                    <input class="tt" type="text" name="diachi">
                    <p>Nhập Mật Khẩu *:</p>
                    <input class="tt" type="password" name="pass">
                    <p>Nhập Lại Mật Khẩu *:</p>
                    <input class="tt" type="password" name="pass_2">
                    <p></p>
                    <input id="checkbox" class="checkbox" type="checkbox" name="checkbox" value="">
                    <a onclick="check()">
                        <p5>*Chấp nhận điều khoản của chúng tôi</p5>
                    </a>
                    <p></p>
                    <div class="active-tt">
                    	 <input type="hidden" name="command" value="insert">
                        <input class="nhap" type="submit" value="Đăng Ký">
                        <input class="reset" type="reset" value="Xóa">

                        <a class="back" href="login.jsp">Đăng Nhập</a>
                    </div>
                </form>
            </div>

        </div>
    </div>
    <jsp:include page="footer-top.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
function validateFormdangki() {

    var username = document.forms["myForm_dangki"]["name"].value;
    var mail = document.forms["myForm_dangki"]["email"].value;
    var ten = document.forms["myForm_dangki"]["ten"].value;
    var sdt = document.forms["myForm_dangki"]["phone"].value;
    var diachi = document.forms["myForm_dangki"]["diachi"].value;
    var password = document.forms["myForm_dangki"]["pass"].value;
    var pass_2 = document.forms["myForm_dangki"]["pass_2"].value;
    var checkbox = document.getElementById("checkbox").checked;


    if (username == "") {
        alert("Vui lòng nhập tên đăng nhập");
        return false;
    }
    if (mail == "") {
        alert("Vui lòng nhập mail");
        return false;
    }
    if (ten == "") {
        alert("Vui lòng nhập họ và tên");
        return false;
    }
    if (sdt == "") {
        alert("Vui lòng nhập so điện thoại");
        return false;
    }
    if (diachi == "") {
        alert("Vui lòng nhập địa chỉ");
        return false;
    }
    if (password == "") {
        alert("Vui lòng nhập pass");
        return false;
    }
    if (pass_2 == "") {
        alert("Vui lòng nhập lai pass");
        return false;
    }
    if (password != pass_2) {
        alert("Vui lòng kiểm tra lại pass");
        return false;
    }
    if (checkbox == false) {
        alert("Vui lòng kiểm tra lại điều khoản");
        return false;
    }


}

function check() {
    document.getElementById("checkbox").checked = true;
}
</script>
</html>