
<%@page import="get.admin.UserAdminGet"%>
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
        <link href="${root}/admin/css_body.css" rel='stylesheet' type='text/css'>
         <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
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
        userAdmin useradmin1 = null;
        
		userAdmin userAdmin2=new userAdmin();
		UserAdminGet userAdminGet=new UserAdminGet();
		
	 if (session.getAttribute("userad") != null) {
		 useradmin1=(userAdmin) session.getAttribute("userad");
		 userAdmin2=userAdminGet.getUser(useradmin1.getId());
        
     }
	
	 if(userAdmin2.isRoleAdmin()==false){
		 response.sendRedirect("/dienthoai/admin/erro.jsp");
	 }
            UserAdminGet userGet = new UserAdminGet();
            ArrayList<userAdmin> listUser = userGet.getListUser();
            %>
        <jsp:include page="header1.jsp"></jsp:include>

            

                    <div class="container-right">
                    <h3 style="color: white;">QUẢN LÝ USER</h3>
                    <div class="table-container">
                    <table id="table-one" class="table-one">
                        <tr class="data">
                            <th  width="30px">STT</th>
                            <th width="200px" >Mã user</th>
                            <th width="200px">Tên user</th>
                           
                            <th  width="30px">Role</th>
                            <th width="100px" >password</th>
                            
                            
                        </tr>
                        <% 
                          int count =0;
                          for(userAdmin user : listUser){
                              count++;
                          
                            %>
                        <tr >
                            <td  width="30px"><%=count%></td>
                            <td ><%=user.getId()%></td>
                            <td ><%=user.getUserNameAdmin()%></td>
                            
                             <td ><%=user.isRoleAdmin()%></td>
                            <td ><%=user.getPassWordAdmin()%></td>
                            
                            
                        </tr>
                        <% } %>
                    </table>
                    
                    </div>
                    </div>

                   
                    
                    
                    
               
                <div class="clear"></div>

            <jsp:include page="footer1.jsp"></jsp:include>

       

    </body>
</html>
