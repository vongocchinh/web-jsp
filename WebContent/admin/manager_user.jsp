
<%@page import="model.admin.userAdmin"%>
<%@page import="model.admin.user"%>
<%@page import="get.admin.UserGet"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Danh Mục</title>
 <c:set var="root" value="${pageContext.request.contextPath}"/>
       <!--  <c:set var="root" value="${pageContext.request.contextPath}"/> --> 
         <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
          <link href="${root}/admin/css_body.css" rel='stylesheet' type='text/css'>
        <link rel="icon" type="image/png" href="${root}/admin/imagesAdmin/favicon.ico"/>
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
    </head>
    <body class="body1">
        <%

            UserGet userGet = new UserGet();
            ArrayList<user> listUser = userGet.getListUser();
            %>
        <jsp:include page="header1.jsp"></jsp:include>

            

                    <div class="container-right">
                    <h3 style="color: white;">QUẢN LÝ USER</h3>
                    <div class="table-container">
                    <table id="table-one" class="table-one">
                        <tr class="data">
                            <th  width="30px">STT</th>
                            <th width="200px" >Mã User</th>
                            <th width="200px">Tên User</th>
                            <th width="120px">Email</th>
                            <th  width="30px">Role</th>
                            <th width="100px" >Phone</th>
                            
                            
                        </tr>
                        <% 
                          int count =0;
                          for(user user : listUser){
                              count++;
                          
                            %>
                        <tr >
                            <td  width="30px"><%=count%></td>
                            <td ><%=user.getUserID()%></td>
                            <td ><%=user.getUserName()%></td>
                            <td ><%=user.getUserEmail()%></td>
                             <td ><%=user.isUserRole()%></td>
                            <td ><%=user.getUserPhone()%></td>
                            
                            
                        </tr>
                        <% } %>
                    </table>
                    
                    </div>
                    </div>

                   
                    
                    
                    
               
                <div class="clear"></div>

            <jsp:include page="footer1.jsp"></jsp:include>

       

    </body>
</html>
