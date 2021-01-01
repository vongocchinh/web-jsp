
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
         <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
          <link href="${root}/admin/css_body.css" rel='stylesheet' type='text/css'>
<link rel="icon" type="image/png" href="${root}/admin/imagesAdmin/favicon.ico"/>
    </head>
    <body class="body1">
        
        <%
            String error = "";
            if(request.getParameter("error")!=null){
                error = (String) request.getParameter("error");
            }
            Brand brand = new BrandGet().getBrand(Integer.parseInt(request.getParameter("brand_id")));
           
            BrandGet brandGet = new BrandGet();
            
        %>

        <jsp:include page="header1.jsp"></jsp:include>

           <div class="container-right-insert">
        		<div class="container-insert">
                    <form action="/dienthoai/ManagerBrandServlet" method="post">
                    <table class="table-insert">
                        <tr>
                            <td><b class="name-insert">Tên danh mục:</b></td>
                            <td><input type="text" class="sedang" name="tenThuongHieu" value="<%=brand.getBrandName()%>"><%=error%></td>
                        </tr>
                        <tr>
                            <td ><b class="name-insert">Mã danh mục:</b></td>
                            <td><input type="text" class="sedang" name="maThuongHieu" value="<%=brand.getBrandID()%>"><%=error%></td>
                        </tr>
                        <tr><td></td><td>
                                <input type="hidden" name="command" value="update">
                                <input type="hidden" name="brand_id" value="<%=request.getParameter("brand_id")%>">
                                <input type="submit" class="button-insert" value="Lưu dữ liệu">
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
                </div>
                <div class="clear"></div>

            <jsp:include page="footer1.jsp"></jsp:include>

      


    </body>
</html>
