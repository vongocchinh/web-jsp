<!DOCTYPE  html>
<%@page import="model.admin.userAdmin"%>
<%@page import="get.admin.UserAdminGet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="get.admin.ReviewGet"%>
<%@page import="get.admin.BillGet"%>
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
	  <script src="${pageContext.request.contextPath}/admin_QL/js/show-detail.js "></script>
    <meta charset='utf-8'>
    <link href="${root}/admin_QL/css/style1.css" rel="stylesheet">
	<c:set var="root" value="${pageContext.request.contextPath}" />
 	<link rel="icon" type="image/png" href="${root}/images/favicon.ico"/>
	<meta charset="UTF-8">
    <title>Trang chủ admin...</title>

</head>
<%
userAdmin useradmin1 = null;

userAdmin userAdmin2=new userAdmin();
UserAdminGet userAdminGet=new UserAdminGet();



userAdmin useradmin111 = (userAdmin) session.getAttribute("userad");
if (useradmin111 == null) {

 response.sendRedirect("/dienthoai/admin_QL/login.jsp");
}





	UserGet userGet=new UserGet();
	
	
%>
<body>
    <jsp:include page="header.jsp"></jsp:include>

	  <%ProductGet productGettong=new ProductGet(); %>
	    <%BillGet billGettong=new BillGet(); %>
	      <%
                    ReviewGet reviewGet=new ReviewGet();
	    
                    %>
                    
    <div class="container-right-index2-left ">
        <div class="main-right">
        <div class="container">
                <div class="row">
                    <div class="col-12">
            <a class="btn btn-outline-primary" href="${root}/admin_QL/insert_brand.jsp">Insert brand</a>
                    <a class="btn btn-outline-secondary" href="${root }/admin_QL/insert_category.jsp">Insert category</a>
                    <a class="btn btn-outline-success" href="${root }/admin_QL/insert_product.jsp">Insert Product</a>
                     <a class="btn btn-outline-danger" href="${root }/admin_QL/insert_post.jsp">Insert Post</a>
                      <a class="btn btn-outline-dark" href="/dienthoai/admin_QL/insert_QC.jsp">Insert Qc</a>
                       <a class="btn btn-outline-warning" href="/dienthoai/admin_QL/insert_slider.jsp">Insert slider</a>
                       <a class="btn btn-outline-info" href="${root }/admin_QL/insert_nv.jsp">Insert staff</a>
           </div>
           </div>
           </div>
           
        </div>
       <jsp:include page="footer.jsp"></jsp:include>
    </div>
    <div class="clear "></div>
    
   
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <script src="${root}/admin_QL/js/search.js "></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>

</html>