<!DOCTYPE  html>
<%@page import="get.admin.UserAdminGet"%>
<%@page import="model.admin.userAdmin"%>
<html>
<%@page import="model.admin.post"%>
<%@page import="controller.admin.Baiviet"%>
<%@page import="get.admin.postGet"%>
<%@page import="get.admin.UserGet"%>
<%@page import="model.admin.QC"%>
<%@page import="get.admin.QCGet"%>
<%@page import="get.admin.sliderGet"%>
<%@page import="model.admin.slider"%>
<%@page import="model.admin.Cart"%>
<%@page import="model.admin.user"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="get.admin.ProductGet"%>
<%@page import="model.admin.Product"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset='utf-8'>
     
  <c:set var="root" value="${pageContext.request.contextPath}" />
    <link href="${root}/admin_QL/css/style1.css" rel="stylesheet">
     <link href="${root}/admin_QL/css/style2.css" rel="stylesheet">
     
	
 	<link rel="icon" type="image/png" href="${root}/images/favicon.ico"/>
	<meta charset="UTF-8">
    <title>Trang chủ admin...</title>
<%
userAdmin useradmin1 = null;

userAdmin userAdmin2=new userAdmin();
UserAdminGet userAdminGet=new UserAdminGet();
userAdmin useradmin111 = (userAdmin) session.getAttribute("userad");
if (useradmin111 == null) {

 response.sendRedirect("/dienthoai/admin_QL/login.jsp");
 
}

%>

</head>

<body>
    <header class="header">

        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand1" href="/dienthoai/admin_QL/index.jsp">ADMIN</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link1" href="${root}/admin_QL/index.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link1" href="#">Mega <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown active">
                        <a class="nav-link1 dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   Login
                  </a>
                        <div class="dropdown-menu dropdown-menu1" aria-labelledby="navbarDropdown">
                        <%
                        if(useradmin111 == null){
                        	%>
                        	<a class="dropdown-item" href="${root}/admin_QL/login.jsp">Login</a>
                        	<% 
                        }else{
                        %>
                         <a class="dropdown-item" href="${root}/LogoutAdminServlet?command=logout">Logout</a>
                        <%} %>
                            
                           <a class="dropdown-item" href="register2.html">Register</a>
                            
                        </div>
                    </li>
                </ul>
                <ul class="navbar-nav mr-auto1">
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    </form>
                </ul>
            </div>
        </nav>
    </header>


    <div class="container-left-index2 ">


        <!-- <input type="text " id="mySearch " onkeyup="myFunction() " placeholder="Search.. " title="Type in a category "> -->

        <div class="table-menu">
            <ul id="myMenu">
                <%
                        if(useradmin111 != null){
                        	
                        	%>
                        	<p class="name">Chào : <%=useradmin111.getUserNameAdmin() %></p>
                        	<%} %>
                <h4 class="menu-text">CORE</h4>
                <li class="menu-item">
                    <a class="text-menu-item active-text-menu"><img src="${root}/admin_QL/images/USER_MOI.png ">Dashdoard</a>

                </li>
                <div class="panel">
                    <a href="${root}/admin_QL/danhsachAdmin.jsp">Quản lý admin</a>
                    <a href="${root }/admin_QL/manager_nv.jsp">Quản lý nhân viên</a>
                    <a href="${root}/admin_QL/chat.jsp ">Quản lý Chat</a>


                </div>

                <h4 class="menu-text">INTERFACE</h4>
                <li class="menu-item">
                    <a class="text-menu-item"><img src="${root}/admin_QL/images/CATEGORY_moi.png ">Quản lý danh mục</a>

                </li>
                <div class="panel">
                    <a href="${root }/admin_QL/manager_brand.jsp">Quản lý brand</a>
                    <a href="${root }/admin_QL/manager_category.jsp">Quản lý category</a>
                    <a href="${root }/admin_QL/manager_product.jsp">Quản lý product</a>
                    <a href="${root }/admin_QL/manager_bill.jsp">Quản lý bill</a>
                    <a href="${root}/admin_QL/user.jsp">Quản lý user</a>
                   <a href="${root }/admin_QL/manager_post.jsp">Quản lý bài viết</a>


                </div>

                <li class="menu-item ">
                    <a class="text-menu-item"><img src="${root}/admin_QL/images/form.png">Quan lý Mega</a>


                </li>
                <div class="panel">
                    <a href="${root }/admin_QL/insert.jsp">Insert</a>
                </div>
                <li class="menu-item ">
                    <a class="text-menu-item"><img src="${root}/admin_QL/images/menu.png ">Quản Lý Page</a>


                </li>
                <div class="panel">
                    <a href="${root }/admin_QL/manager_contact.jsp">Quản lý new,contact</a>
                    
                    <a href="${root }/admin_QL/manager_QC.jsp">Chạy quảng cáo</a>
                     <a href="${root }/admin_QL/manager_slider.jsp">Quản lý Banner</a>
                </div>
                <h4 class="menu-text"> ADDONS</h4>
                <li class="menu-item ">
                    <a class="text-menu-item"><img src="${root}/admin_QL/images/menu.png ">Quản lý page</a>


                </li>
                <div class="panel">
                    <a href="#">Admin</a>
                    <a href="${root }/admin_QL/insert_admin.jsp">Plugins</a>
                    <a href="${root }/admin_QL/index.jsp">Cài Đặt</a>
                </div>
                <h4 class="menu-text">LOGGED IN AS:ADMIN</h4>


            </ul>

        </div>


    </div>
  <div class="clear "></div>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  
    <script src="${root}/admin_QL/js/search.js "></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    var acc = document.getElementsByClassName("menu-item");
    var i;
    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            var pan = this.nextElementSibling;
            this.classList.toggle("active1");
            if (pan.style.maxHeight) {
                pan.style.maxHeight = null;
            } else {

                pan.style.maxHeight = pan.scrollHeight + "px";
            }
        });
    }
    </script>
</body>

</html>