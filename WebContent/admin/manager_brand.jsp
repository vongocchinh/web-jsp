<%@page import="model.admin.userAdmin"%>
<%@page import="model.admin.Brand"%>
<%@page import="get.admin.BrandGet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.admin.Category"%>
<%@page import="get.admin.CategoryGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
   
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Thương Hiệu</title>

         <c:set var="root" value="${pageContext.request.contextPath}"/>
          <link href="${root}/admin/css_main.css" rel='stylesheet' type='text/css'>
    <link href="${root}/admin/css_main1.css" rel='stylesheet' type='text/css'>
     <link href="${root}/admin/css_body.css" rel='stylesheet' type='text/css'>
          <link href="${root}/css/chinh.css" rel='stylesheet' type='text/css' />
         
         <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
        
    <link rel="icon" type="image/png" href="${root}/admin/imagesAdmin/favicon.ico"/>
    </head>
    <body class="body1">
        <%
           
           
        
       
            BrandGet brandGet = new BrandGet();
            ArrayList<Brand> listBrand = brandGet.getListBrand();
            %>
        <jsp:include page="header1.jsp"></jsp:include>

            

           
<div class="container-right">

                    
					
                     <div class="table-container">

                   
                    
                   
                    <table id="table-one" class="table-one" style="width: 100%">
                        <tr class="data">
                            <th >STT</th>
                            <!-- <th >Mã thương hiệu</th> -->
                            <th >Tên thương hiệu</th>
                            
                            <th >Tùy chọn</th>
                        </tr>
                        <% 
                          int count =0;
                          for(Brand brand : listBrand){
                              count++;
                          
                            %>
                        <tr >
                            <td "><%=count%></td>
                            <!-- <td ><%=brand.getBrandID()%></td> -->
                            <td ><%=brand.getBrandName()%></td>
                            
                            <td >
                        <center>
                            <a href="${root}/admin/update_brand.jsp?command=update&brand_id=<%=brand.getBrandID()%>">Sửa</a>&nbsp;&nbsp; | &nbsp;&nbsp;
                                <a href="/dienthoai/ManagerBrandServlet?command=delete&brand_id=<%=brand.getBrandID()%>">Xóa</a>
                        </center>
                        </td>
                        </tr>
                        <% } %>
                    </table>
                </div>
                </div>
                </div>
               
                <div class="clear"></div>

            <jsp:include page="footer1.jsp"></jsp:include>

        

    </body>
</html>