
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng Nhập</title>
 <c:set var="root" value="${pageContext.request.contextPath}"/>
   
<link rel="icon" type="image/png" href="${root}/admin/login/images1/icons/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="${root}/admin/login/css1/util.css">
	<link rel="stylesheet" type="text/css" href="${root}/admin/login/css1/main.css">
</head>
<body class="body1">
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form action="/dienthoai/AdminUserServlet" method="post" class="login100-form validate-form">
					<span class="login100-form-title p-b-26">
						Welcome Admin
					</span>
					
					

					<div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
						<input class="input100" type="text" name="userAdmin">
						<span class="focus-input100" data-placeholder="userAdmin"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input class="input100" type="password" name="passAdmin">
						<span class="focus-input100" data-placeholder="passAdmin"></span>
					</div>
					 <%if(request.getParameter("login_erro")!=null){
                 %>
                 <div>
							<p style="color:red"><%=request.getParameter("login_erro")%></p>
							</div>
                   <%    } %>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							
							
                <input type="hidden" value="login" name="commandadmin">
                <input type="submit" class="login100-form-btn" value="Đăng Nhập">
						</div>
					</div>

					<div class="text-center p-t-115">
						<span class="txt1">
							Don’t have an account?
						</span>

						<a class="txt2" href="#">
							Sign Up
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<script src="${root}/login/js1/main.js"></script>
</body>
</html>
