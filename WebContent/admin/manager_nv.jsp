<%@page import="get.admin.UserAdminGet"%>
<%@page import="get.admin.chucvuGet"%>
<%@page import="model.admin.chucvu"%>
<%@page import="get.admin.nhanvienGet"%>
<%@page import="model.admin.nhanvien"%>
<%@page import="get.admin.ProductGet"%>
<%@page import="model.admin.Product"%>
<%@page import="get.admin.BillDetailGet"%>
<%@page import="model.admin.BillDetail"%>
<%@page import="model.admin.user"%>
<%@page import="model.admin.userAdmin"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="get.admin.UserGet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.admin.Bill"%>
<%@page import="get.admin.BillGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <link href="css_main.css" rel="stylesheet">
    <link href="css_main1.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý hóa đơn</title>
 <c:set var="root" value="${pageContext.request.contextPath}"/>
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
	
	 if(userAdmin2.isRoleAdmin()==false){
		 response.sendRedirect("/dienthoai/admin/erro.jsp");
	 }
           DecimalFormat formatter = new DecimalFormat("###,###,###");
        %>

        <jsp:include page="header1.jsp"></jsp:include>

            <div class="container-right">

                    
					 
                     <div class="table-container">

                   
                    
                   
                    <table id="table-one" class="table-one">

                  
                        <tr >
                            <th  width="20px">Mã NV</th>
                            <th >Name</th>
                            <th >Mail</th>
                            <th>Địa Chỉ</th>
                            <th >Số điện thoại</th>
                            <th >Chức Vụ</th>
                            <th >Lương</th>
                            
                           
                            <th >Tùy chọn</th>
                        </tr>
                        
                        <%
                        nhanvienGet nhanvienGet=new nhanvienGet();
                        for(nhanvien nv :nhanvienGet.getListNhanVien()){
                   		chucvu chucvu=new chucvu();
                   		chucvuGet chucvuGet=new chucvuGet();
                   		
                        %>
                        <tr >
                            <td  width="30px"><%=nv.getNv_id()%></td>
                            <td ><%=nv.getNv_name()%></td>
                            <td ><%=nv.getNv_mail()%></td>
                            <td ><%=nv.getNv_diachi()%></td>
                            <td ><%=nv.getSdt()%></td>
                            <td ><%=chucvuGet.getCV(nv.getChucvu_id()).getChucvu_name()%></td>
                            <td ><%=formatter.format(chucvuGet.getCV(nv.getChucvu_id()).getChucvu_luong())%>đ</td>
                            
                             
                                <center>
                                <td  width="75px">
                                   <a href="/dienthoai/admin/update_nv.jsp?nv_id=<%=nv.getNv_id()%>">Sửa</a> &nbsp;&nbsp; | &nbsp;&nbsp;
                                    <a href="/dienthoai/ManagerNhanVien?command=delete&nv_id=<%=nv.getNv_id()%>">Xóa</a>
                                     </td>
                                </center>
                           
                        </tr>
                        <%}%>

                    </table>
                    </div>
                    
                

			
			</div>
                
                <div class="clear"></div>
			
			
            <jsp:include page="footer1.jsp"></jsp:include>

       


    </body>
</html>