<%@page import="model.admin.userAdmin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.admin.Category"%>
<%@page import="get.admin.CategoryGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
 <link href="css_main.css" rel="stylesheet">
    <link href="css_main1.css" rel="stylesheet">
   <c:set var="root" value="${pageContext.request.contextPath}"/>
   
          <link href="${root}/css/chinh.css" rel='stylesheet' type='text/css' />
          <link href="${root}/admin/css_body.css" rel='stylesheet' type='text/css'>
        <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
        
    
   
      
    <style type="text/css">
    td.data {
	color:  black;
}
		table.data {
	color: black;
}
		th.data {
	color: green;
}
table{
width: 100%;
}
    </style>
    <c:set var="root" value="${pageContext.request.contextPath}"/>
    <link rel="icon" type="image/png" href="${root}/admin/imagesAdmin/favicon.ico"/>
    <title>QUẢN LÝ DANH MỤC-CATEGORY</title>
</head>
<body class="body1">
        
        <jsp:include page="header1.jsp"></jsp:include>

            <div class="container-right">

                    
					
                     <div class="table-container">

                   
                    
                   
                    <table id="table-one" class="table-one">

                    
                   
                        <tr >
                            <th  >STT</th>
                            <!-- <th >Mã danh mục</th> -->
                            <th >Tên danh mục</th>
                            <th >Tùy chọn</th>
                        </tr>
                       <%
                       
                   
        CategoryGet categoryGet = new CategoryGet();
        ArrayList<Category> listCategory = categoryGet.getListCategory();
        %>
         <% 
                          int count =0;
                          for(Category category : listCategory){
                              count++;
                          
                            %>
                        <tr >
                            <td ><%=count%></td>
                           <!--  <td ><%=category.getCategoryID()%></td> -->
                            <td ><%=category.getCategoryName()%></td>
                            <td >
                      <center>
                            <a href="${root}/admin/update_category.jsp?command=update&category_id=<%=category.getCategoryID()%>">Sửa</a>&nbsp;&nbsp; | &nbsp;&nbsp;
                            <a href="/dienthoai/ManagerCategoryServlet?command=delete&category_id=<%=category.getCategoryID()%>">Xóa</a>
                      </center> 
                        </td>
                        </tr>
                        <% } %>
                    </table>
                </div>
                </div>
                
                <div class="clear"></div>

            <jsp:include page="footer1.jsp"></jsp:include>

      

    </body>
</html>
