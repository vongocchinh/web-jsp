<!DOCTYPE  html>
<%@page import="get.admin.mucQCGet"%>
<%@page import="get.admin.chucvuGet"%>
<%@page import="model.admin.chucvu"%>
<%@page import="model.admin.nhanvien"%>
<%@page import="get.admin.nhanvienGet"%>
<%@page import="model.admin.userAdmin"%>
<%@page import="get.admin.UserAdminGet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="get.admin.ReviewGet"%>
<%@page import="get.admin.BillGet"%>
<html>
<%@page import="model.admin.post"%>
<%@page import="controller.admin.Baiviet"%>
<%@page import="get.admin.postGet"%>
<%@page import="get.admin.UserGet"%>
<%@page import="model.admin.QC"%>
<%@page import="get.admin.QCGet"%>
<%@page import="get.admin.sliderGet"%>
<%@page import="model.admin.slider"%>
<%@page import="model.admin.Cart"%>
<%@page import="model.admin.user"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="get.admin.ProductGet"%>
<%@page import="model.admin.Product"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset='utf-8'>
   
	<c:set var="root" value="${pageContext.request.contextPath}" />
	 <link href="${root}/admin_QL/css/style1.css" rel="stylesheet">
 	<link rel="icon" type="image/png" href="${root}/images/favicon.ico"/>
	<meta charset="UTF-8">
    <title>Trang chủ admin...</title>

</head>
<%
userAdmin useradmin1 = null;

userAdmin userAdmin2=new userAdmin();
UserAdminGet userAdminGet=new UserAdminGet();



userAdmin useradmin111 = (userAdmin) session.getAttribute("userad");
if (useradmin111 == null) {

 response.sendRedirect("/dienthoai/admin_QL/login.jsp");
}




DecimalFormat formatter = new DecimalFormat("###,###,###");
	
	
%>
<body>
    <jsp:include page="header.jsp"></jsp:include>

	  <%ProductGet productGettong=new ProductGet(); %>
	    <%BillGet billGettong=new BillGet(); %>
	      <%
                    ReviewGet reviewGet=new ReviewGet();
	    
                    %>
                    
    <div class="container-right-index2-left ">
        <div class="main-right">
            
           
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th style="width: 50px" scope="col">STT</th>
                        <th style="width: 200px" scope="col">Tên san pham</th>
                        <th style="width: 200px" scope="col">Tên Mục</th>
                        <th style="width: 400px" scope="col">Ảnh Mục</th>
                       
                        <th scope="col" class="col1">Edit</th>
                    </tr>
                </thead>
                <tbody>
               <%
                       
                   
       QCGet qcGet=new QCGet();
        ArrayList<QC> listCategory = qcGet.getQC();
        ProductGet productGet=new ProductGet();
        mucQCGet mucQCGet=new mucQCGet();
        %>
         <% 
                          int count =0;
                          for(QC sl : listCategory){
                              count++;
                          
                            %>
                    <tr>
                        <th><%=count %></th>
                        <td><%=productGet.getProduct(sl.getProduct_id()).getProductName()%></td>
                         <td><%=mucQCGet.getmucQc(sl.getMucQC()).getMuc_Name()%></td>
                          <td><img width="70%" height="100" class="hinhql" src="/dienthoai/imagesphone/<%=sl.getImages_QC()%>"/></td>
                           
                       
                        <td class="tt">
                             <a href="/dienthoai/QCServlet?command=delete&qc_id=<%=sl.getQC_id()%>"><img src="${root}/admin_QL/images/de.png"></a>
                            
                        </td>
                    </tr>
                   <%} %>
                </tbody>
            </table>
            
        </div>
       <jsp:include page="footer.jsp"></jsp:include>
    </div>
    <div class="clear "></div>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  
    <script src="${root}/admin_QL/js/search.js "></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>

</html>