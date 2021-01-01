
<%@page import="get.admin.postGet"%>
<%@page import="model.admin.post"%>
<%@page import="get.admin.BrandGet"%>
<%@page import="model.admin.Brand"%>
<%@page import="model.admin.Category"%>
<%@page import="get.admin.CategoryGet"%>
<%@page import="get.admin.ProductGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật thương hiệu</title>
 <c:set var="root" value="${pageContext.request.contextPath}"/>
 <link href="css_main.css" rel="stylesheet">
    <link href="css_main1.css" rel="stylesheet">
        <!-- <c:set var="root" value="${pageContext.request.contextPath}"/> -->
         <link href="${root}/admin/css_body.css" rel='stylesheet' type='text/css'>
         <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
<link rel="icon" type="image/png" href="${root}/admin/imagesAdmin/favicon.ico"/>
    </head>
    <body class="body1">
        
        <%
            String error = "";
            if(request.getParameter("error")!=null){
                error = (String) request.getParameter("error");
            }
            post post = new postGet().getpost(Integer.parseInt(request.getParameter("post_id")));
           
            postGet postGet = new postGet();
            
        %>

        <jsp:include page="header1.jsp"></jsp:include>

           <div class="container-right-insert" style="width: 1000px">
            
					 
           		
        		<div class="container-insert5" style="height: auto;padding: 10px 10px">
                    <%=post.getPost_post() %>
                </div>
                </div>
                <div class="clear"></div>

            <jsp:include page="footer1.jsp"></jsp:include>

      


    </body>
</html>
