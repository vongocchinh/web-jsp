<!DOCTYPE  html>

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
    <meta charset='utf-8'>
     <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
    <title>Trang chủ admin...</title>
    
</head>

<body>
 <div class="clear"></div>
    <footer class="footer-bottom">
        <p class="footer">2015 uCommerce. All Rights Reserved.</p>
    </footer>
    <div class="clear"></div>
</body>
</html>