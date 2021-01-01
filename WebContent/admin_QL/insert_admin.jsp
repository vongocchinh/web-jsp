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
<meta charset='utf-8'>
<c:set var="root" value="${pageContext.request.contextPath}" />
	  <script src="${pageContext.request.contextPath}/admin_QL/js/show-detail.js "></script>
    
    <link href="${root}/admin_QL/css/style1.css" rel="stylesheet">
     <link href="${root}/admin_QL/css/product1.css" rel="stylesheet">
	
 	<link rel="icon" type="image/png" href="${root}/images/favicon.ico"/>
	<meta charset="UTF-8">
    <title>Trang chủ admin...</title>

</head>
<%


userAdmin userAdmin2=new userAdmin();
UserAdminGet userAdminGet=new UserAdminGet();



userAdmin useradmin111 = (userAdmin) session.getAttribute("userad");
if (useradmin111 == null) {

	 response.sendRedirect("/dienthoai/admin_QL/login.jsp");
	}




if(useradmin111.isRoleAdmin()==false){
	 response.sendRedirect("/dienthoai/admin_QL/erro.jsp");
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
            <h3>Dashdoard</h3>
            <div class="edit-product">
                <form name="myForm_dangki" onsubmit="return validateFormdangki()" action="${root}/AdminUserServlet" method="post">
               	 	<p>Mã taì khoản</p>
                    <input class="form-control" name="maThuongHieu" type="hidden" placeholder="mã brand...">
                    <p>Thêm Tên admin</p>
                    <input class="form-control" type="text" name="name" placeholder="name...">
                    <p>Thêm PassWord</p>
                    <input class="form-control" type="password" name="pass" placeholder="pass...">
                    <p>Nhập lại PassWord</p>
                    <input class="form-control" type="password" name="pass_2" placeholder="passConfilm...">
                    <p>Role</p>
                    <select name="role"class="form-control" >
                    	<option value="true">Super Admin</option>
                    	<option value="false">Administrator</option>
                    	
                    </select>
                    <input  type="submit" value="Save" class="btn btn-primary">
                    <input type="hidden" name="commandadmin" value="insert">
                     <input class="btn btn-outline-info" type="reset" name="command" value="xóa">
                </form>
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
<script type="text/javascript">
function validateFormdangki() {

    var username = document.forms["myForm_dangki"]["name"].value;
   
    var diachi = document.forms["myForm_dangki"]["role"].value;
    var password = document.forms["myForm_dangki"]["pass"].value;
    var pass_2 = document.forms["myForm_dangki"]["pass_2"].value;
   


    if (username == "") {
        alert("Vui lòng nhập tên đăng nhập");
        return false;
    }
   
    if (role == "") {
        alert("Vui lòng nhập role");
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
   
}
</script>
</html>