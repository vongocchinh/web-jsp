<!DOCTYPE  html>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.admin.Bill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="get.admin.BillGet"%>
<%@page import="get.admin.UserAdminGet"%>
<%@page import="model.admin.userAdmin"%>
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
    <link href="/dienthoai/admin_QL/css/style1.css" rel="stylesheet">
	<c:set var="root" value="${pageContext.request.contextPath}" />
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




	UserGet userGet=new UserGet();
	
	
%>
<body>
<jsp:include page="header.jsp"></jsp:include>


    <div class="container-right-index2-left ">
        <div class="main-right">

           
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th style="width: 50px" class="stt" scope="col">STT</th>
                        <th style="width: 180px" class="stt1" scope="col">Tên khach hàng</th>
                        <th style="width: 180px" class="stt2" scope="col">Tổng hóa đơn</th>
                        <th style="width: 350px" class="stt3" scope="col">Địa chỉ</th>
                        <th style="width: 100px" class="stt4" scope="col">Ngày mua</th>
                        <th style="width: 100px" class="stt5" scope="col">Điện thoại</th>
                      
                        <th style="width:150px" scope="col" class="col1">Tùy chọn</th>
                    </tr>
                </thead>
               <%        
           BillGet billGet = new BillGet();
           ArrayList<Bill> listBill = billGet.getListBill();
          
           user user=new user();
           DecimalFormat formatter = new DecimalFormat("###,###,###");
        %>
        <%int count=0;
                        SimpleDateFormat formatterdate = new SimpleDateFormat("MM/dd/yyyy");
                        formatterdate = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
                        for(Bill bill1 :billGet.getListBill()){
                        	count++;
                   		user=userGet.getUser(bill1.getUserID());
                        %>
                <tbody>

                    <tr>
                        <th><%=count %></th>
                        <td><%=bill1.getName()%></td>
                        <td><%=formatter.format(bill1.getTotal())%></td>
                        <td><%=bill1.getSonha()%>,<%=bill1.getXa()%>,<%=bill1.getHuyen()%>,<%=bill1.getAddress()%></td>
                        <td><%=formatterdate.format(bill1.getDate())%></td>
                      
                        <td><%=bill1.getPhone() %></td>
                        <td class="tt">
                            <a href="/dienthoai/ManagerBill?command=delete&bill_id=<%=bill1.getBillID()%>"><img style="width: 15px;height: 20px"src="${root}/admin_QL/images/t.png"></a>
                            <a href="/dienthoai/admin_QL/bill_detail.jsp?getBillID=<%=bill1.getBillID()%>"><img src="${root}/admin_QL/images/ey.png"></a>
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
   
    <script src="/dienthoai/admin_QL/js/search.js "></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
   
</body>

</html>