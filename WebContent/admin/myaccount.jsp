
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

    </head>
    <body class="body1">
       <%
userAdmin useradmin1 = null;

userAdmin userAdmin2=new userAdmin();
UserAdminGet userAdminGet=new UserAdminGet();



userAdmin useradmin111 = (userAdmin) session.getAttribute("userad");
if (useradmin111 == null) {

 response.sendRedirect("/dienthoai/admin/loginAdmin.jsp");
}


if (session.getAttribute("userad") != null) {
 useradmin1=(userAdmin) session.getAttribute("userad");
 userAdmin2=userAdminGet.getUser(useradmin1.getId());

}
if(userAdmin2.isRoleAdmin()==false){
	 response.sendRedirect("/dienthoai/admin/erro.jsp");
}
%>
        <jsp:include page="header1.jsp"></jsp:include>

            

                    <div class="container-right-insert" style="width: 1000px">
                   		<form action="/dienthoai/Baiviet" method="post">
                    <table class="table-insert">
                        <tr>
                            <td><b class="name-insert">UserName :</b></td>
                            <td><input type="text" class="sedang" name="post_name" value="<%=userAdmin2.getUserNameAdmin()%>"></td>
                        </tr>
                        <tr>
                            <td><b class="name-insert">PassWord :</b></td>
                            <td><input type="text" class="sedang" name="post_name" value="<%=userAdmin2.getPassWordAdmin()%>"></td>
                        </tr>
                        
                        </table>
                    </div>

                   
                    
                    
                    
               
                <div class="clear"></div>

            <jsp:include page="footer1.jsp"></jsp:include>

       

    </body>
</html>
