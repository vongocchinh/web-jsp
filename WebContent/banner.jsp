<%@page import="model.admin.post"%>
<%@page import="get.admin.postGet"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.admin.Product"%>
<%@page import="get.admin.ProductGet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
 	<c:set var="root" value="${pageContext.request.contextPath}" />
 	<link rel="icon" type="image/png" href="${root}/img/favicon.ico"/>
	<meta charset="UTF-8">
	<link rel='stylesheet' type='text/css' media='screen' href='css/header.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/slider.css'>
    <script src="js/slider.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Insert title here</title>
</head>
<body>
	
            <h4>Dành riêng cho bạn</h4>
            
            <%
            
            ProductGet productGet=new ProductGet();
            DecimalFormat format=new DecimalFormat("###,###,###");
            for(Product product1:productGet.getRanDom111()){
            %>
            <div class="sp-pr-pr-top">
                <div class="img-sp-pr">
                    <a href="single-product.jsp?productID=<%=product1.getProductID()%>"><img src="${root}/imagesphone/<%=product1.getProductImage()%>"></a>
                </div>
                <a style="color: black;" href="single-product.jsp?productID=<%=product1.getProductID()%>"><p style="color: black;"><%=product1.getProductName() %></p></a>
                 <%
                 int giasp=product1.getProductPrice();
             	int giasale=(int)Integer.parseInt(product1.getGiam_Gia());
             	float giasale2=(float)giasale/100;
             	float giacon=giasp-(giasale2*giasp);
                %>
               
                <p><del style="font-size: 12px"><%=format.format(product1.getProductPrice())%>đ</del> &nbsp; <%=format.format(giacon) %> đ</p>
            </div>
            <hr>
            <%} %>

            <h4 style="padding-top: 30px;">Bài viết Mới Nhất</h4>
            <%
            postGet postGet=new postGet();
            for(post post:postGet.getPost_5()){
            	
            %>
            <div class="sp-pr-pr-top">
                <div class="img-sp-pr">
                   <a href="bangtin.jsp?post_id=<%=post.getPost_id()%>"> <img src="/dienthoai/imagesphone/<%=post.getImg()%>"></a>
                </div>

                <span>
                    <%=post.getPost_name() %>
                </span>

            </div>
             <hr>
            <%} %>
           
           


        
</body>

</html>