<!DOCTYPE  html>

<%@page import="get.admin.UserAdminGet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.admin.DateLoginAdmin"%>
<%@page import="get.admin.GetdateloginAdmin"%>
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
    <link href="css_main.css" rel="stylesheet">
    <link href="css_main1.css" rel="stylesheet">
     <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
      <link href="${root}/admin/css_body.css" rel='stylesheet' type='text/css'>
    <title>Trang chủ admin...</title>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel='stylesheet' type='text/css' media='screen' href='${root}/css/dangki.css'>
</head>
<%
	UserGet userGet=new UserGet();
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection
	("jdbc:mysql://localhost:3306/iphoneshop", "root", "123456");
	Statement st = con.createStatement();
	
%>
<body class="body1">
<%
            userAdmin useradmin1 = null;
            
			userAdmin userAdmin2=new userAdmin();
			UserAdminGet userAdminGet=new UserAdminGet();
			
		 if (session.getAttribute("userad") != null) {
			 useradmin1=(userAdmin) session.getAttribute("userad");
			 userAdmin2=userAdminGet.getUser(useradmin1.getId());
            
         }
		
		 if(userAdmin2.isRoleAdmin()==false){
			 response.sendRedirect("/dienthoai/admin/erro.jsp");
		 }
        %>
   <jsp:include page="header1.jsp"></jsp:include>
    <div class="container-left-top-index">
        
		<div class="form-tt">
                <form name="myForm_dangki" onsubmit="return validateFormdangki()" action="${root}/AdminUserServlet" method="post">
                    <p>Nhập Tên Đăng Nhập*:</p>
                    <input class="tt" type="text" name="name">
                   
                    
                    
                    <p>Nhập Role *:</p>
                    
                  	<select name="role" class="tt">
                                  
                                    <option value="true">Quản trị viên</option>
                                    <option value="false">Nhân viên</option>
                                        
                                </select>
                    <p>Nhập Mật Khẩu *:</p>
                    <input class="tt" type="password" name="pass">
                    <p>Nhập Lại Mật Khẩu *:</p>
                    <input class="tt" type="password" name="pass_2">
                    <p></p>           
                    <div class="active-tt">
                    	 <input type="hidden" name="commandadmin" value="insert">
                        <input class="nhap" type="submit" value="Đăng Ký">
                        <input class="reset" type="reset" value="Xóa">

                        
                    </div>
                </form>
            </div>
       
    </div>
    <div class="clear"></div>
    <jsp:include page="footer1.jsp"></jsp:include>
  
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