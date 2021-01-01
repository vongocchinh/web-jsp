<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
      if(user233.getUserName()==null||user233.equals("")){
          response.sendRedirect("login.jsp");
      }
      
       
               DecimalFormat formatter = new DecimalFormat("###,###,###");
               
           ProductGet productGet=new ProductGet();
           Cart cart = (Cart) session.getAttribute("cart");
           if (cart == null) {
               cart = new Cart();
               session.setAttribute("cart", cart);
           }
   
       
           %>
        <%
           if(user233==null){
               response.sendRedirect("login.jsp");
           }
           %>
	<jsp:include page="header.jsp"></jsp:include>
		 <div class="container">
        <div class="pr-main-left">
           <jsp:include page="banner.jsp"></jsp:include>


        </div>
        <div class="pr-main-right">
            <h3 class="h3">Tài Khoản Của Tôi</h3>
            <div class="form-tt">
                <form action="/dienthoai/UserServlet" method="post" name="myForm_myac" onsubmit="return validateFormmyac()">
                    <p>Tên Đăng Nhập*:</p>
                    <input class="tt" type="text" name="name" value="<%=user233.getUserName()%>">
                    <p>Mail *:</p>
                    <input class="tt" type="text" name="email" value="<%=user233.getUserEmail()%>">
                    <p>Họ và Tên *:</p>
                    <input class="tt" type="text" name="ten" value="<%=user233.getTen()%>" >
                    <p>Số Điện Thoại *:</p>
                   <input class="tt" name="phone" type="text" value="<%=user233.getUserPhone()%>" >
                    <p>Giới Tính *:</p>
                    <%if(user233.isUserRole()==false){%>
                    
                    	<input class="tt" type="text" name="gender" value="Nam">
                    	<% 
                    }else{
                    	%>
                    	<input class="tt" type="text" name="gender" value="Nữ">
                    	<%	}%>
                    <p>Địa Chỉ *:</p>
                    <input class="tt" type="text" name="diachi" value="<%=user233.getDiachi()%>" >
                    
                    <p>Nhập Mật Khẩu Xác Nhận *:</p>
                    <input class="tt" type="password" name="pass" >

                    <p></p>

                    <div class="active-tt">
                        <input type="hidden" name="command" value="update">
                        <input type="hidden" name="user_id" value="<%=user233.getUserID()%>">
                        <input class="nhap" type="submit" value="Chỉnh Sửa">
                        <input class="reset" type="reset" value="Xóa">

                        <a class="back" href="index.jsp">Trang chủ</a>
                    </div>
                </form>
            </div>

        </div>
    </div>
    <jsp:include page="footer-top.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">

function validateFormmyac() {
    var username = document.forms["myForm_myac"]["name"].value;
    var username = document.forms["myForm_myac"]["email"].value;
    var ten = document.forms["myForm_myac"]["ten"].value;
    var sdt = document.forms["myForm_myac"]["phone"].value;
    var diachi = document.forms["myForm_myac"]["diachi"].value;
    var password = document.forms["myForm_myac"]["pass"].value;
    if (username == "") {
        alert("Vui lòng nhập tên đăng nhập");
        return false;
    }
    if (password == "") {
        alert("Vui lòng nhập mật khẩu");
        return false;
    }
    if (mail == "") {
        alert("Vui lòng nhập mail");
        return false;
    }
    if (ten == "") {
        alert("Vui lòng nhập ten");
        return false;
    }
    if (sdt == "") {
        alert("Vui lòng nhập số điện thoại");
        return false;
    }
    if (diachi == "") {
        alert("Vui lòng nhập địa chỉ");
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