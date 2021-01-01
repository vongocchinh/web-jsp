<%@page import="get.admin.UserAdminGet"%>
<%@page import="get.admin.chucvuGet"%>
<%@page import="model.admin.chucvu"%>
<%@page import="model.admin.userAdmin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm Thương Hiệu</title>
 <c:set var="root" value="${pageContext.request.contextPath}"/>
 <link href="css_main.css" rel="stylesheet">
    <link href="css_main1.css" rel="stylesheet">
       <!--  <c:set var="root" value="${pageContext.request.contextPath}"/> -->
         <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
          <link href="${root}/admin/css_body.css" rel='stylesheet' type='text/css'>
<link rel="icon" type="image/png" href="${root}/admin/imagesAdmin/favicon.ico"/>
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
	
	 if(userAdmin2.isRoleAdmin()==true){
		 response.sendRedirect("/dienthoai/admin_QL/erro.jsp");
	 }
       
            String error = "";
            if(request.getParameter("error")!=null){
                error = (String) request.getParameter("error");
            }
        %>
        <jsp:include page="header1.jsp"></jsp:include>
<div class="container-right-insert">
        <div class="container-insert">
          
                    <form action="/dienthoai/ManagerNhanVien" method="post" >
                   <table class="table-insert">
                         <tr>
                            <td ><b class="name-insert">Mã Nhân Viên</b></td>
                            <td><input type="hidden" class="sedang" name="nv_id"><%=error%></td>
                        </tr>
                        <tr>
                            <td ><b class="name-insert">Tên Nhân Viên</b></td>
                            <td><input type="text" class="sedang" name="nv_name"><%=error%></td>
                        </tr>
                         <tr>
                            <td ><b class="name-insert">Mail Nhân Viên</b></td>
                            <td><input type="text" class="sedang" name="nv_mail"><%=error%></td>
                        </tr>
                         <tr>
                            <td ><b class="name-insert">Địa Chỉ Nhân Viên</b></td>
                            <td><input type="text" class="sedang" name="nv_diachi"><%=error%></td>
                        </tr>
                         <tr>
                            <td ><b class="name-insert">Phone Nhân Viên</b></td>
                            <td><input type="text" class="sedang" name="nv_sdt"><%=error%></td>
                        </tr>
                          <tr>
                            <td ><b class="name-insert">Chức vụ</b></td>
                             <td>
                             <span></span>
                                <select name="chucvu_id" class="sedang">
                                   <%
                                   chucvuGet chucvuGet=new chucvuGet();
						           for (chucvu cv : chucvuGet.getListChucVy()) {
						            %>
                                    <option value="<%=cv.getChucvu_id()%>"><%=cv.getChucvu_name()%></option>
                                    <% } %>
                                        
                                </select>
                             </td>
                              
                        </tr>
                        <tr>
                        <td>
                                
                                </td>
                                <td>
                                <input type="hidden" name="command" value="insert">        
                                <input type="submit"  class="button-insert" value="Lưu dữ liệu">
                                <input type="reset" class="button-insert" value="Phục hồi">
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

