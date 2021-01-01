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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${root}/admin/css_main.css" rel='stylesheet' type='text/css'>
    <link href="${root}/admin/css_main1.css" rel='stylesheet' type='text/css'>
     <link href="${root}/admin/css_main3.css" rel='stylesheet' type='text/css'>
      
    <meta charset='utf-8'>
     <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
    <title>Trang chủ admin...</title>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
     <link rel='stylesheet' type='text/css' media='screen' href='${root}/css/dangki.css'>
</head>
<%
        userAdmin useradmin = null;
		
        if(session.getAttribute("userad") != null){
            useradmin = (userAdmin) session.getAttribute("userad");
            
        }else{
                response.sendRedirect("/baitap/admin/loginAdmin.jsp");
        }
        %>
       
<body>
  <div class="header-area" style="z-index: 100;padding-top: 20px;">
        <div class="row">
            <div class="col-md-8">
                <div class="user-menu">
                    <ul>
                        <a class="logo"><img class="logo" src="${root}/images/images/logo (1).png"></a>
                        <li class="col2">
                            <a class="col2" href="TrangChu1.jsp"><img class="img-user" src="${root}/images/images/Home.png"> Trang Chủ</a>
                        </li>
                        <li class="col2">
                            <a class="col2" href="#"><img class="img-user" src="${root}/images/images/USER_MOI.png"> My Account</a>
                        </li>
                        <li class="col2">
                            <a class="col2" href="${root}/LogoutAdminServlet?command=logout"><img class="img-user" src="${root}/images/images/LOGOUT.png"> Logout</a>
                        </li>
                        <li class="col2">
                        	<a class="col2"> <%if(useradmin!=null){ %>
                    Chao Admin: <%=useradmin.getUserNameAdmin()%> <br>
                    <% } %></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    
       
            <div class="container-left-index2" >
            <div class="menu" style="height: auto;">

                <input type="text" id="mySearch" onkeyup="myFunction()" placeholder="Search.." title="Type in a category">
                <h4 class="menu-text">MENU</h4>

                <div class="table-menu">
                    <ul id="myMenu" >
                        <li class="acc">
                            <a class="text"><img src="${root }/admin/images/USER_MOI.png">Dashdoard</a>
                            <a class="icon"><img class="icon-mt" src="${root }/admin/images/mmt.png"></a>
                        </li>
                        <div class="panel">
                            <li><a href="${root }/admin/index.jsp">Trang Chủ</a></li>
                           
                            <li><a href="${root }/admin/myaccount.jsp">Myaccount</a></li>
                            <li><a href="${root}/LogoutAdminServlet?command=logout">Đăng xuất</a></li>
                            
                        </div>
                        <li class="acc">
                            <a class="text"><img src="${root }/admin/images/CATEGORY_moi.png">Quản lý danh mục</a>
                            <a class="icon"><img class="icon-mt" src="${root }/admin/images/mmt.png"></a>
                        </li>
                        <div class="panel">
                            <li><a href="${root }/admin/insert_category.jsp">Thêm Danh Mục</a></li>
                            <li><a href="${root }/admin/manager_category.jsp">Danh sách</a></li>
                            
                        </div>
                        <li class="acc">
                            <a class="text"><img src="${root }/admin/images/PRODUCT.png">Quản lý sản phẩm</a>
                            <a class="icon"><img class="icon-mt" src="${root }/admin/images/mmt.png"></a>

                        </li>
                        <div class="panel">
                            <li><a href="${root }/admin/insert_product.jsp">Thêm Sản phẩm</a></li>
                            <li><a href="${root }/admin/manager_product.jsp">Danh sách</a></li>
                          
                        </div>
                        <li class="acc">
                            <a class="text"><img src="${root }/admin/images/tb11.png">Quản lý brand</a>
                            <a class="icon"><img class="icon-mt" src="${root }/admin/images/mmt.png"></a>

                        </li>
                        <div class="panel">
                            <li><a href="${root}/admin/insert_brand.jsp">Thêm brand</a></li>
                            <li><a href="${root}/admin/manager_brand.jsp">Danh sách</a></li>
                            
                        </div>
                        <li class="acc">
                            <a class="text"><img src="${root }/admin/images/form.png">Hóa Đơn</a>
                            <a class="icon"><img class="icon-mt" src="${root }/admin/images/mmt.png"></a>

                        </li>
                        <div class="panel">
                            <li><a href="${root }/admin/manager_bill.jsp">Đơn hàng</a></li>
                            <li><a href="${root }/admin/manager_user.jsp">Khách Hàng</a></li>
                            
                        </div>
                        <li class="acc">
                            <a class="text"><img src="${root }/admin/images/USER_MOI.png">Quảng cáo</a>
                            <a class="icon"><img class="icon-mt" src="${root }/admin/images/mmt.png"></a>

                        </li>
                        <div class="panel">
                            <li><a href="${root }/admin/manager_slider.jsp">Slider</a></li>
                            <li><a href="${root }/admin/manager_QC.jsp">Quảng cáo</a></li>
                           
                        </div>
                        <li class="acc">
                            <a class="text"><img src="${root }/admin/images/BRAND_Moi.png">Liên hệ</a>
                            <a class="icon"><img class="icon-mt" src="${root }/admin/images/mmt.png"></a>

                        </li>
                        <div class="panel">
                            <li><a href="${root }/admin/manager_newsletter.jsp">NewSerletter</a></li>
                            <li><a href="${root }/admin/manager_contact.jsp">Contact</a></li>
                           
                        </div>
                        <li class="acc">
                            <a class="text"><img src="${root }/admin/images/icon.png">Nhân viên</a>
                            <a class="icon"><img class="icon-mt" src="${root }/admin/images/mmt.png"></a>

                        </li>
                        <div class="panel">
                            <li><a href="${root }/admin/danhsachAdmin.jsp">Admin</a></li>
                            <li><a href="${root }/admin/registNV.jsp">Đăng kí</a></li>
                             <li><a href="${root }/admin/manager_nv.jsp">Nhân viên</a></li>
                              <li><a href="${root }/admin/insert_nv.jsp">Thêm nhân viên</a></li>
                        </div>
                        <li class="acc">
                            <a class="text"><img src="${root }/admin/images/map.png">Bài Viết</a>
                            <a class="icon"><img class="icon-mt" src="${root }/admin/images/mmt.png"></a>

                        </li>
                        <div class="panel">
                            <li><a href="${root }/admin/insert_post.jsp">Thêm bài viết</a></li>
                            <li><a href="${root }/admin/manager_post.jsp">Bài viết</a></li>

                        </div>
                        <li class="acc">
                            <a class="text"><img src="${root }/admin/images/m_3.png">Thêm-Slider</a>
                            <a class="icon"><img class="icon-mt" src="${root }/admin/images/mmt.png"></a>

                        </li>
                        <div class="panel">
                            <li> <a href="/dienthoai/admin/insert_QC.jsp" class="add-lable">Thêm Qc</a></li>
                            <li> <a href="/dienthoai/admin/insert_slider.jsp" class="add-lable">Thêm Silde</a></li>
                            
                        </div>
                        <li class="acc">
                            <a class="text"><img src="${root }/admin/images/menu.png">Menu level</a>
                            <a class="icon"><img class="icon-mt" src="${root }/admin/images/mmt.png"></a>

                        </li>
                        <div class="panel">
                            <li><a>level-1</a></li>
                            <li><a>level-2</a></li>
                            <li><a>level-3</a></li>
                        </div>
                        <li class="acc">
                            <a class="text"><img src="${root }/admin/images/menu.png">Menu level</a>
                            <a class="icon"><img class="icon-mt" src="${root }/admin/images/mmt.png"></a>

                        </li>
                        <div class="panel">
                            <li><a>level-1</a></li>
                            <li><a>level-2</a></li>
                            <li><a>level-3</a></li>
                        </div>
                    </ul>
                </div>
                
            </div>
            </div>
            
        
    

</body>
<script>
    var acc = document.getElementsByClassName("acc");
    var i;
    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            var pan = this.nextElementSibling;
            this.classList.toggle("active");
            if (pan.style.maxHeight) {
                pan.style.maxHeight = null;
            } else {

                pan.style.maxHeight = pan.scrollHeight + "px";
            }
        });
    }


    function myFunction() {
        var input, filter, ul, li, a, i;
        input = document.getElementById("mySearch");
        filter = input.value.toUpperCase();
        ul = document.getElementById("myMenu");
        li = ul.getElementsByTagName("li");
        for (i = 0; i < li.length; i++) {
            a = li[i].getElementsByTagName("a")[0];
            if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
                li[i].style.display = "";
            } else {
                li[i].style.display = "none";
            }
        }
    }
</script>
</html>
<!-- 
<div class="banner"><img class="banner-img" src="${root}/images/images/Home.png"> <a href="${root}/admin/index.jsp" class="banner">Trang Chủ</a></div>
            <div class="banner"> <img class="banner-img" src="${root}/images/images/USER_MOI.png"><a href="${root}/admin/manager_user.jsp"" class="banner">User</a></div>
            <div class="banner"><img class="banner-img" src="${root}/images/images/BRAND_Moi.png"> <a href="${root}/admin/manager_brand.jsp" class="banner">Brand</a></div>
            <div class="banner"><img class="banner-img" src="${root}/images/images/CATEGORY_moi.png"> <a href="${root}/admin/manager_category.jsp" class="banner">Category</a></div>
            <div class="banner"><img class="banner-img" src="${root}/images/images/PRODUCT.png"> <a href="${root}/admin/manager_product.jsp" class="banner">Product</a></div>
            <div class="banner"><img class="banner-img" src="${root}/images/images/CONATC.png"> <a href="${root}/admin/manager_contact.jsp" class="banner">Contact</a></div>
            <div class="banner"><img class="banner-img" src="${root}/images/images/BILL_Moi.png"> <a href="${root}/admin/manager_bill.jsp" class="banner">Bill detail</a></div>
            <div class="banner"><img class="banner-img" src="${root}/images/images/NEWSLETTER.png"> <a href="${root}/admin/manager_newsletter.jsp" class="banner">NewSletter</a></div>
            <div class="banner"><img class="banner-img" src="${root}/images/images/m_3.png"> <a href="${root}/admin/manager_chart.jsp" class="banner">Thóng kê</a></div>
 -->