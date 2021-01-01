<%@page import="model.admin.post"%>
<%@page import="get.admin.postGet"%>
<%@page import="get.admin.mucQCGet"%>
<%@page import="model.admin.QC"%>
<%@page import="get.admin.QCGet"%>
<%@page import="get.admin.ProductGet"%>
<%@page import="model.admin.slider"%>
<%@page import="get.admin.sliderGet"%>
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
                            <th  width="30px">STT</th>
                            <th width="40px" >Mã muc post</th>
                            <th>post_name</th>
                           <th >Ảnh</th>
                           <th width="90px">Chi Tiết</th>
                            <th  width="120px">Tùy chọn</th>
                        </tr>
                       <%
                       
                   
       postGet postGet=new postGet();
        ArrayList<post> listCategory = postGet.getPost();
        
        
        %>
         <% 
                          int count =0;
                          for(post sl : listCategory){
                              count++;
                          
                            %>
                        <tr >
                            <td  width="30px"><%=count%></td>
                            <td ><%=sl.getPost_id()%></td>
                            
                            <td ><%=sl.getPost_name()%></td>
                           <td><a href="${root}/admin/post_description.jsp?post_id=<%=sl.getPost_id()%>">Chi tiết</a></td>

                            <td><img style="width: 200px" alt="" src="/dienthoai/imagesphone/<%=sl.getImg()%>"></td>
                            <td  width="90px">
                      <center>
                            <a href="${root}/admin/update_post.jsp?command=update&post_id=<%=sl.getPost_id()%>">Sửa</a>&nbsp;&nbsp; | &nbsp;&nbsp;
                            <a href="/dienthoai/Baiviet?command=delete&post_id=<%=sl.getPost_id()%>">Xóa</a>
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
