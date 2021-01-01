<!DOCTYPE  html>
<%@page import="get.admin.BrandGet"%>
<%@page import="get.admin.CategoryGet"%>
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
     <link href="${root}/admin_QL/css/product.css" rel="stylesheet">
     <link href="${root}/admin_QL/css/phantrang.css" rel="stylesheet">
	
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
	String brand_id="";
	if(request.getParameter("brandID")!=null){
	    brand_id = request.getParameter("brandID");
	    }
	String category_id="";
	if(request.getParameter("categoryID")!=null){
	    category_id = request.getParameter("categoryID");
	    }
	CategoryGet categoryGet=new CategoryGet();
	ProductGet productGet1=new ProductGet();
	String product_name = "";
	Product product1=new Product();
	if (request.getParameter("product_name") != null ) {

	    product_name = request.getParameter("product_name");
	    
	}
%>
<body>
<jsp:include page="header.jsp"></jsp:include>


    <div class="container-right-index2-left ">
        <div class="main-right">

            <div class="container">
                <div class="row">
                    <div class="col-8">
                        <a href="/dienthoai/admin_QL/manager_tc.jsp?tc=1" class="btn btn-outline-primary">Điện thoại</a>
                        <a href="/dienthoai/admin_QL/manager_tc.jsp?tc=4" class="btn btn-outline-secondary">Phụ kiện</a>
                        <a href="/dienthoai/admin_QL/manager_tc.jsp?tc=-77877681" class="btn btn-outline-success">Máy Ảnh</a>
                        <a href="/dienthoai/admin_QL/manager_tc.jsp?tc=12" class="btn btn-outline-danger">Máy Tính Bảng</a>
                        <a href="/dienthoai/admin_QL/manager_tc.jsp?tc=9" class="btn btn-outline-warning">Lap top</a>
                       
                    </div>
                     <div class="col-4">
                     
                     	 <form action="/dienthoai/searchAdmin" method="post">
                        	<input class="btn border border-warning" type="text" name="product_name" placeholder="Tìm sản phẩm">
                        	 <input type="hidden" name="command" value="Search">
                        </form>
                     </div>

                </div>
            </div>
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th class="stt" scope="col">STT</th>
                       <!--  <th class="stt1" scope="col">Tên mặt hàng</th> -->
                        <th class="stt2" scope="col">Tên sản phẩm</th>
                       <!--  <th class="stt3" scope="col">Tên thương hiệu</th> -->
                         <th class="stt3" scope="col">Số Lượng</th>
                          <th class="stt3" scope="col">Show</th>
                        <th class="stt4" scope="col">Giá</th>
                        <th class="stt5" scope="col">Sale</th>
                        <th class="stt6" scope="col">Mô tả</th>
                        <th scope="col" class="col1">Edit</th>
                    </tr>
                </thead>
                <%
                
                CategoryGet categoryGet14 = new CategoryGet();
                BrandGet brandGet = new BrandGet();
                ProductGet productGet1411 = new ProductGet();
   
                %>
                <tbody>
                 <%
                    ProductGet productGet=new ProductGet();
    int first = 0, last = 0, pages = 1;
     
    if (request.getParameter("pages") != null) {
        pages = (int) Integer.parseInt(request.getParameter("pages"));
    }
    
   
    int total = productGet.countproduct();
    
    if (total <= 10) {
        first = 0; 
        last = total; 
    } else {
        first = (pages - 1) * 10;
        last = 10;
    }
    
    
    int count=0;
    for(Product product:productGet.getSearch(product_name))  {
    	count++;
%>
                    <tr>
                        <th><%=count %></th>
                        <!-- <td><%=categoryGet14.getCategory(product.getCategoryID()).getCategoryName()%></td> -->
                        <td><%=product.getProductName()%></td>
                        <!-- <td><%=brandGet.getBrand(product.getBrandID()).getBrandName()%></td> -->
                        <td>100 sp</td>
                        <td><input type="checkbox" checked="checked" class="form-check-input" id="materialInline1"></td>
                        <td><%=formatter.format(product.getProductPrice())%></td>
                        <td><%=product.getGiam_Gia()%> %</td>
                        <td><a href="/dienthoai/admin_QL/product_description.jsp?product_id=<%=product.getProductID()%>">Chi tiết</a></td>
                        <td class="tt">
                           <a href="/dienthoai/ManagerProductServlet?command=delete&product_id=<%=product.getProductID()%>"><img src="${root}/admin_QL/images/de.png"></a>
                            <a href="${root}/admin_QL/update_product.jsp?command=update&product_id=<%=product.getProductID()%>"><img src="${root}/admin_QL/images/e.png"></a>
                        </td>
                    </tr>
<%} %>

                </tbody>
            </table>


        </div>
          <div class="clear"></div>

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