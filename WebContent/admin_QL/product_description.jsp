<!DOCTYPE  html>
<%@page import="get.admin.CategoryGet"%>
<%@page import="get.admin.BrandGet"%>
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
    <link href="${root}/css/rating.css" rel="stylesheet">
	
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



ReviewGet reviewGet2=new ReviewGet();


	
	
%>
<body>
    <jsp:include page="header.jsp"></jsp:include>

	  <%ProductGet productGettong=new ProductGet(); %>
	    <%BillGet billGettong=new BillGet(); %>
	      <%
                    ReviewGet reviewGet=new ReviewGet();
	    
                    %>
                     <%
            
           
       
            ProductGet productGet = new ProductGet();
            Product product = new Product();
            String productID = "";
            if (request.getParameter("product_id") != null) {
          productID = request.getParameter("product_id");
          product = productGet.getProduct(Integer.parseInt(productID));
     }
        %>
                    
    <div class="container-right-index2-left ">
        <div class="main-right">
            <h3>Dashdoard</h3>
            
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">STT</th>
                         <th scope="col">Tên Mặt Hàng</th>
                          <th scope="col">Tên Hãng</th>
                          <th scope="col">Tên Sản Phẩm</th>
                         
                        <th scope="col">Cam trước</th>
                        <th scope="col">Cam sau</th>
                        <th scope="col">Bộ nhớ</th>
                        <th scope="col">Hệ điều hành</th>
                        <th scope="col">Ram</th>
                        <th scope="col">Ảnh 1</th>
                        <th scope="col">Ảnh 2</th>
                        <th  style="width: 150px">Edit</th>
                    </tr>
                </thead>
                <tbody>
                <%
        		UserGet uGet=new UserGet();
                ProductGet productGet14=new ProductGet();
                BrandGet brandGet=new BrandGet();
        		ArrayList<user> user=uGet.getListUser();
        		CategoryGet categoryGet14=new CategoryGet();
        		int stt=0;
        		
        		stt++;
        		%>
                    <tr>
                        <th><%=stt %></th>
                        <td>  <%=categoryGet14.getCategory(product.getCategoryID()).getCategoryName()%></td> 
                          <td><%=brandGet.getBrand(product.getBrandID()).getBrandName()%></td>
                          <td><%=product.getProductName()%></td>
                        <td><%=product.getCamera_Sau()%></td>
                        <td><%=product.getCamera_Truoc()%></td>
                        <td><%=product.getBo_Nho()%></td>
                         <td><%=product.getHe_Dieu_Hanh()%></td>
                          <td><%=product.getRam()%></td>
                         <td class="img"><img style="height: 100px" src="/dienthoai/imagesphone/<%=product.getProductImage() %>"></td>
                        <td class="img"><img style="height: 100px" src="/dienthoai/imagesphone/<%=product.getProductImagenext() %>"></td>
                        <td class="tt">
                             <a href="/dienthoai/ManagerProductServlet?command=delete&product_id=<%=product.getProductID()%>"><img src="${root}/admin_QL/images/de.png"></a>
                            <a href="${root}/admin_QL/update_product.jsp?command=update&product_id=<%=product.getProductID()%>"><img src="${root}/admin_QL/images/e.png"></a>
                        </td>
                    </tr>
                   
                </tbody>
            </table>
            <table class="table">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">STT</th>
                        
                        <th scope="col">Mô tả</th>
                       
                       
                    </tr>
                </thead>
                <tbody>
               
                    <tr>
                        <th>#</th>
                        <td><%=product.getProductDescription() %></td>
                       
                    </tr>
				
                    
                </tbody>
            </table>
            <div class="ratting">
               		<span class="heading">Khách Hàng Rating</span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star"></span>
					<p>Tổng số <%=reviewGet2.countTotalReview_product(product.getProductID())%> reviews.</p>
					<hr style="border:3px solid #f1f1f1">
					
					<div class="row">
					 <div class="row-se">
						  <div class="side">
						    <div>5 star</div>
						  </div>
						  <div class="middle">
						    <div class="bar-container">
						      <div class="bar-5"></div>
						    </div>
						  </div>
						  <div class="side right">
						    <div><%=reviewGet2.countTotalReview_product_level(product.getProductID(),5)%></div>
						  </div>
					 </div>
					  <div class="row-se">
					  	<div class="side">
						    <div>4 star</div>
						  </div>
						  <div class="middle">
						    <div class="bar-container">
						      <div class="bar-4"></div>
						    </div>
						  </div>
						  <div class="side right">
						    <div><%=reviewGet2.countTotalReview_product_level(product.getProductID(),4)%></div>
						  </div>
					  </div>
					  <div class="row-se">
							<div class="side">
						    <div>3 star</div>
						  </div>
						  <div class="middle">
						    <div class="bar-container">
						      <div class="bar-3"></div>
						    </div>
						  </div>
						  <div class="side right">
						    <div><%=reviewGet2.countTotalReview_product_level(product.getProductID(),3)%></div>
						  </div>
						  </div>
					  <div class="row-se">
					  		<div class="side">
							    <div>2 star</div>
							  </div>
							  <div class="middle">
							    <div class="bar-container">
							      <div class="bar-2"></div>
							    </div>
							  </div>
							  <div class="side right">
							    <div><%=reviewGet2.countTotalReview_product_level(product.getProductID(),2)%></div>
							  </div>
					  </div>
					  <div class="row-se">
					  	 <div class="side">
						    <div>1 star</div>
						  </div>
						  <div class="middle">
						    <div class="bar-container">
						      <div class="bar-1"></div>
						    </div>
						  </div>
						  <div class="side right">
						    <div><%=reviewGet2.countTotalReview_product_level(product.getProductID(),1)%></div>
						  </div>
					  </div>
					  
					 
					  
					</div>
               </div>
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