<!DOCTYPE  html>

<%@page import="model.admin.userAdmin"%>
<%@page import="get.admin.CategoryGet"%>
<%@page import="get.admin.BrandGet"%>
<%@page import="get.admin.BillGet"%>
<%@page import="get.admin.ReviewGet"%>
<%@page import="get.admin.ProductGet"%>
<%@page import="get.admin.UserGet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<html>

<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="icon" type="image/png" href="${root}/admin/imagesAdmin/favicon_1.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset='utf-8'>
     <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
    <title>Trang chủ admin...</title>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>

<body class="body1">
<%
            userAdmin useradmin = (userAdmin) session.getAttribute("userad");
		 if (useradmin == null) {
             response.sendRedirect("/baitap/admin/loginAdmin.jsp");
         }
        %>
   <jsp:include page="header1.jsp"></jsp:include>
 <div class="container-right-2">
        <div class="row-right-2">
            <div class="row-container-right">
                <div id="post1">
                    <a href="${root}/admin/TrangChu1.jsp">
                        <div id="post2">
                            <img class="colsp" src="${root}/images/images/Home.png">
                        </div>
                        <div id="post3">
                            <p class="icon-text">Quản Lý Trang Chủ</p>

                        </div>
                    </a>
                </div>

                <div id="post1">
                    <a href="${root}/admin/manager_user.jsp">
                        <div id="post2">
                            <img class="colsp" src="${root}/images/images/USER_MOI.png">
                        </div>
                        <div id="post3">
                            <p class="icon-text">Quản Lý User</p>

                        </div>
                    </a>
                </div>

                <div id="post1">
                    <a href="${root}/admin/manager_brand.jsp">
                        <div id="post2">
                            <img class="colsp" src="${root}/images/images/BRAND_Moi.png">
                        </div>
                        <div id="post3">
                            <p class="icon-text">Quản Lý Brand</p>

                        </div>
                    </a>
                </div>

                <div id="post1">
                    <a href="${root}/admin/manager_category.jsp">
                        <div id="post2">
                            <img class="colsp" src="${root}/images/images/CATEGORY_moi.png">
                        </div>
                        <div id="post3">
                            <p class="icon-text">Quản Lý Category</p>

                        </div>
                    </a>
                </div>

                <div id="post1">
                    <a href="${root}/admin/manager_product.jsp">
                        <div id="post2">
                            <img class="colsp" src="${root}/images/images/PRODUCT.png">
                        </div>
                        <div id="post3">
                            <p class="icon-text">Quản Lý Sản Phẩm</p>

                        </div>
                    </a>
                </div>
                <div id="post1">
                    <a href="${root}/admin/manager_contact.jsp">
                        <div id="post2">
                            <img class="colsp" src="${root}/images/images/CONATC.png">
                        </div>
                        <div id="post3">
                            <p class="icon-text">Quản Lý Contact</p>

                        </div>
                    </a>
                </div>
                <div id="post1">
                    <a href="${root}/admin/manager_bill.jsp">
                        <div id="post2">
                            <img class="colsp" src="${root}/images/images/BILL_Moi.png">
                        </div>
                        <div id="post3">
                            <p class="icon-text">Quản Lý Bill</p>

                        </div>
                    </a>
                </div>
                <div id="post1">
                    <a href="${root}/admin/manager_newsletter.jsp">
                        <div id="post2">
                            <img class="colsp" src="${root}/images/images/NEWSLETTER.png">
                        </div>
                        <div id="post3">
                            <p class="icon-text">Quản Lý NewSletter</p>

                        </div>
                    </a>
                </div>
                <div id="post1">
                    <a href="${root}/admin/manager_chart.jsp">
                        <div id="post2">
                            <img class="colsp" src="${root}/images/images/CHArt.png">
                        </div>
                        <div id="post3">
                            <p class="icon-text">Quản Lý Chart</p>

                        </div>
                    </a>
                </div>
                <div id="post1">
                    <a href="#">
                        <div id="post2">
                            <img class="colsp" src="${root}/images/images/TRA_GOP_.png">
                        </div>
                        <div id="post3">
                            <p class="icon-text">Quản Lý Trả Góp</p>

                        </div>
                    </a>
                </div>
                <div id="post1">
                    <a href="${root}/admin/manager_slider.jsp">
                        <div id="post2">
                            <img class="colsp" src="${root}/images/images/Slider_moi.png">
                        </div>
                        <div id="post3">
                            <p class="icon-text">Quản Lý Slider</p>

                        </div>
                    </a>
                </div>
                <div id="post1">
                    <a href="${root}/admin/manager_QC.jsp">
                        <div id="post2">
                            <img class="colsp" src="${root}/images/images/QC.png">
                        </div>
                        <div id="post3">
                            <p class="icon-text">Quản Lý Quang Cáo</p>

                        </div>
                    </a>
                </div>

                <div class="clear"></div>
            </div>
        </div>

    </div>
    <jsp:include page="footer1.jsp"></jsp:include>
  
</body>

</html>