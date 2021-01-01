<!DOCTYPE  html>
<%@page import="get.admin.BillDetailGet"%>
<%@page import="model.admin.BillDetail"%>
<%@page import="model.admin.Newsletter"%>
<%@page import="get.admin.NewsletterGet"%>
<%@page import="model.admin.Contact"%>
<%@page import="get.admin.ContactGet"%>
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
    <link href="${root}/admin_QL/css/style1.css" rel="stylesheet">
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



%>
<body>
    <jsp:include page="header.jsp"></jsp:include>

	  <%ProductGet productGettong=new ProductGet(); %>
	    <%BillGet billGettong=new BillGet(); %>
	      <%
                    ReviewGet reviewGet=new ReviewGet();
	            
          
          
          DecimalFormat formatter = new DecimalFormat("###,###,###");
          
         BillDetail billDetail1=new BillDetail();
         BillDetailGet billDetailGet=new BillDetailGet();
      		 String billID="";
      	 if (request.getParameter("getBillID") != null) {
       	billID = request.getParameter("getBillID");
       	billDetail1=billDetailGet.getBillDetail(Integer.parseInt(billID));
      		}
                    %>
                    
    <div class="container-right-index2-left ">
        <div class="main-right">
            
            
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Tên sản phẩm</th>
                       <th scope="col">Tiền</th>
                        <th scope="col">Số lượng</th>
                        <th scope="col">Tổng tiền</th>
                       
                        <th scope="col">Tùy chọn</th>
                       
                        
                    </tr>
                </thead>
                <tbody>
                <%
               
                int count=0;
                for(BillDetail billDetail:billDetailGet.getProductNameByBillID(Integer.parseInt(billID))){
              		count++;
                	Product product1=new Product();
              		ProductGet productGet=new ProductGet();
              		product1=productGet.getProduct(billDetail.getProductID());
                %>
        		
                    <tr>
                        <th><%=count %></th>
                        <td><%=product1.getProductName()%></td>
                        
                            <td><%=formatter.format(product1.getProductPrice())%> vnđ</td>
                            <td><%=billDetail.getQuantity()%></td>
                              <td><%=formatter.format(billDetail.getPrice())%> vnđ</td>
                        <td><a href="/dienthoai/ManagerBill?command=delete&bill_id=<%=Integer.parseInt(billID)%>">Xác Nhận</a></td>
                      
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