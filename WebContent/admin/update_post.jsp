
<%@page import="get.admin.postGet"%>
<%@page import="model.admin.post"%>
<%@page import="model.admin.chucvu"%>
<%@page import="get.admin.chucvuGet"%>
<%@page import="get.admin.nhanvienGet"%>
<%@page import="model.admin.nhanvien"%>
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
         <script src="../ckeditor/ckeditor.js"></script>
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
          post post=new postGet().getpost(Integer.parseInt(request.getParameter("post_id")));
          
            
        %>

        <jsp:include page="header1.jsp"></jsp:include>

           <div class="container-right-insert" style="width: 1000px">
        		<div class="container-insert">
                    <form action="/dienthoai/Baiviet" method="post">
                    <table class="table-insert">
                        <tr>
                            <td><b class="name-insert">Tên Bai viet:</b></td>
                            <td><input type="text" class="sedang" name="post_name" value="<%=post.getPost_name()%>"><%=error%></td>
                        </tr>
                        <tr>
                            <td><b class="name-insert">Ảnh:</b></td>
                            <td><input type="text" class="sedang" name="post_img" value="<%=post.getImg()%>"><%=error%></td>
                        </tr>
                      
                        <tr>
                            <td ><b class="name-insert">Bai Viet</b></td>
                            <td><textarea name="post_post" id="editor1" rows="100" cols="80"><%=post.getPost_post() %></textarea> <%=error%></td>
                          <script>
            CKEDITOR.replace('editor1');
        </script>
                        </tr>
                       
                        
                        <tr><td></td><td>
                                <input type="hidden" name="command" value="update">
                                <input type="hidden" name="post_id" value="<%=request.getParameter("post_id")%>">
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
