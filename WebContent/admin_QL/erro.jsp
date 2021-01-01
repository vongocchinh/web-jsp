<!DOCTYPE  html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset='utf-8'>
    <c:set var="root" value="${pageContext.request.contextPath}" />
    <link href="${root }/admin_QL/css/style1.css" rel="stylesheet">
    <link href="${root }/admin_QL/css/login.css" rel="stylesheet">
    <link href="${root }/admin_QL/css/erro.css" rel="stylesheet">
 	<link rel="icon" type="image/png" href="${root}/images/favicon.ico"/>
	<meta charset="UTF-8">
    <title>erro...</title>
</head>
<body>
<div class="flex-main">
        <div class="ex-page-content bootstrap snippets">
            <div class="container">
                <div class="row">
                    <div class="message-box">
                        <h1 class="m-b-0">Lỗi</h1>
                        <p>Vượt quá trình điều khiển của admin.</p>
                        <div class="buttons-con">
                            <div class="action-link-wrap">
                                <a href="#" class="btn btn-custom btn-info waves-effect waves-light m-t-20" onclick="window.history.back()">Go Back</a>
                                <a href="${root }/admin_QL/index.jsp" class="btn btn-custom btn-info waves-effect waves-light m-t-20">Go to Home Page</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</body>
</html>