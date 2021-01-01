<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
 	<c:set var="root" value="${pageContext.request.contextPath}" />
 	<link rel="icon" type="image/png" href="${root}/img/favicon.ico"/>
	<meta charset="UTF-8">
	<link rel='stylesheet' type='text/css' media='screen' href='css/header1.css'>
	<link rel='stylesheet' type='text/css' media='screen' href='css/header.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/slider.css'>
     <link rel='stylesheet' type='text/css' media='screen' href='css/banner.css'>
      <link rel='stylesheet' type='text/css' media='screen' href='css/main4.css'>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script src="js/slider.js"></script>
    <script src="js/topPage.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Insert title here</title>
</head>
<body>

<div class="footer" >
 <a class="btn-top" href="javascript:void(0);"><i style="color: #1E8DEE;" class='fas fa-arrow-alt-circle-up'></i></a>
        <div class="footer-left">
            <h3>Tin Tức</h3>
            <a class="menu-footer"><i class='fas fa-angle-right'></i>Giới Thiệu</a>
            <a class="menu-footer"><i class='fas fa-angle-right'></i>Tin Tức</a>
            <a class="menu-footer"><i class='fas fa-angle-right'></i>Tin Tức Sản Phẩm</a>
            <a class="menu-footer"><i class='fas fa-angle-right'></i>Tuyển Dụng</a>
            <a class="menu-footer"><i class='fas fa-angle-right'></i>Quan Hệ Cổ Đông</a>
        </div>
        <div class="footer-left">
            <h3>Hổ Trợ Mua Hàng</h3>
            <a class="menu-footer"><i class='fas fa-angle-right'></i>
                Hỗ trợ mua hàng trực tuyến
               </a>
            <a class="menu-footer"><i class='fas fa-angle-right'></i> Các hình thức thanh toán</a>
            <a class="menu-footer"><i class='fas fa-angle-right'></i> Hướng dẫn mua hàng trực tuyến</a>
            <a class="menu-footer"><i class='fas fa-angle-right'></i> Phát hành hóa đơn</a>
            <a class="menu-footer"><i class='fas fa-angle-right'></i> Chính sách chung</a>
            <a class="menu-footer"><i class='fas fa-angle-right'></i> Chính sách chung</a>


        </div>
        <div class="footer-left">
            <h3>Chính sách chung</h3>
            <a class="menu-footer"><i class='fas fa-angle-right'></i>
                Hỗ trợ mua hàng trực tuyến
               </a>
            <a class="menu-footer"><i class='fas fa-angle-right'></i> Các hình thức thanh toán</a>
            <a class="menu-footer"><i class='fas fa-angle-right'></i> Hướng dẫn mua hàng trực tuyến</a>
            <a class="menu-footer"><i class='fas fa-angle-right'></i> Phát hành hóa đơn</a>
            <a class="menu-footer"><i class='fas fa-angle-right'></i> Chính sách chung</a>


        </div>
        <div class="footer-left footer-left-left">
            <h3>Liên Hệ</h3>
            <p>Newserletter Email</p>
            <form name="myForm_newserletter" onsubmit="return validateForm3()" action="NewsletterServlet" method="post">
                <input class="text" type="text" name="email">
                <input type="hidden" value="insert" name="command">
                <input class="text1" type="submit" value="Đăng kí">
            </form>
            <a class="menu-footer"><i class='fas fa-angle-right'></i> Ngocchinh1410@gmail.com</a>
            <a class="menu-footer"><i class='fas fa-angle-right'></i> 07663717084</a>
        </div>
    </div>
    <div class="banner-footer-main">
    	<img src="/dienthoai/imagesphone/p.png">
    </div>
    <footer>
        <p>Author: Võ Ngọc Chính | Admin@gmail.com | @media</p>
    </footer>
    <div style="clear: both;"></div>
</body>
<script src="js/slider.js"></script>
<script type="text/javascript">
function validateForm3() {

    var y = document.forms["myForm_newserletter"]["email"].value;


    if (y == "") {
        alert("Vui lòng nhập mail");
        return false;
    }

}
</script>
</html>