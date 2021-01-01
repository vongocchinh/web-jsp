
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
          nhanvien nv=new nhanvienGet().getNv(Integer.parseInt(request.getParameter("nv_id")));
          nhanvienGet nhanvienGet=new nhanvienGet();
            
        %>

        <jsp:include page="header1.jsp"></jsp:include>

           <div class="container-right-insert">
        		<div class="container-insert">
                    <form action="/dienthoai/ManagerNhanVien" method="post">
                    <table class="table-insert">
                        <tr>
                            <td><b class="name-insert">Tên Nhân Viên:</b></td>
                            <td><input type="text" class="sedang" name="nv_name" value="<%=nv.getNv_name()%>"><%=error%></td>
                        </tr>
                        <tr>
                            <td ><b class="name-insert">Mai Nhân Viên</b></td>
                            <td><input type="text" class="sedang" name="nv_mail" value="<%=nv.getNv_mail()%>"><%=error%></td>
                        </tr>
                        <tr>
                            <td ><b class="name-insert">Địa Chỉ</b></td>
                            <td><input type="text" class="sedang" name="nv_diachi" value="<%=nv.getNv_diachi()%>"><%=error%></td>
                        </tr>
                        <tr>
                            <td ><b class="name-insert">Số Điên Thoại</b></td>
                            <td><input type="text" class="sedang" name="nv_sdt" value="<%=nv.getSdt()%>"><%=error%></td>
                        </tr>
                        <tr>
                            <tr>
                            <td ><b class="name-insert">Chức vụ</b></td>
                             <td>
                             <span></span>
                                <select name="chucvu_id" class="sedang">
                                   <%
                                   chucvuGet chucvuGet2=new chucvuGet();
						           for (chucvu cv : chucvuGet2.getListChucVy()) {
						            %>
                                    <option value="<%=cv.getChucvu_id()%>"><%=cv.getChucvu_name()%></option>
                                    <% } %>
                                        
                                </select>
                             </td>
                              
                        </tr>
                        
                        <tr><td></td><td>
                                <input type="hidden" name="command" value="update">
                                <input type="hidden" name="nv_id" value="<%=request.getParameter("nv_id")%>">
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
