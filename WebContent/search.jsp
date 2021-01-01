<%@page import="get.admin.ReviewGet"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="get.admin.ProductGet"%>
<%@page import="get.admin.CategoryGet"%>
<%@page import="model.admin.Product"%>
<%@page import="model.admin.Cart"%>
<%@page import="get.admin.UserGet"%>
<%@page import="model.admin.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
 	<c:set var="root" value="${pageContext.request.contextPath}" />
 	<link rel="icon" type="image/png" href="${root}/images/favicon.ico"/>
	<meta charset="UTF-8">
	<link rel='stylesheet' type='text/css' media='screen' href='css/header.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/slider.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/main3.css'>
     <link rel='stylesheet' type='text/css' media='screen' href='css/sl.css'>
      <link rel='stylesheet' type='text/css' media='screen' href='css/gs.css'>
       
        <link rel='stylesheet' type='text/css' media='screen' href='css/main-index.css'>
    <script src="js/slider.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Trang chủ cửa hàng...</title>
</head>
<body>
<%
user user=null;
user user233=new user();
UserGet userGet=new UserGet();
if(session.getAttribute("user") != null){
   user = (user) session.getAttribute("user");
  
  user233=userGet.getUser(user.getUserID());
  
}	
Cart cart = (Cart) session.getAttribute("cart");
if (cart == null) {
    cart = new Cart();
    session.setAttribute("cart", cart);
   
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
ProductGet productGet=new ProductGet();
String product_name = "";
Product product1=new Product();
ReviewGet reviewGet=new ReviewGet();
if (request.getParameter("product_name") != null ) {

    product_name = request.getParameter("product_name");
    
}
%>
	<jsp:include page="header.jsp"></jsp:include>
	<div style="margin-top: 30px"></div>
	<div class="container">
        <div class="main1-top">
            <strong>
               <h3>search</h3>
            </strong>
        </div>
        <div class="main1-sp">
<%		
			for(Product product:productGet.getSearch(product_name)) {
			if(product.getProductName()==""){
				out.print("khong co sp");
			}else{
				
			
			%>
			
			 <div class="colsp1">
                <a href="single-product.jsp?productID=<%=product.getProductID()%>"><img src="${root}/imagesphone/<%=product.getProductImage()%>"></a>
                <p class="GG">-<%=product.getGiam_Gia()%>%</p>
               	<a href="single-product.jsp?productID=<%=product.getProductID()%>"><p class="tsp"> <%=product.getProductName()%><br> Hàng Chính Hãng</p></a>
                <%
                int giasp=product.getProductPrice();
            	int giasale=(int)Integer.parseInt(product.getGiam_Gia());
            	float giasale2=(float)giasale/100;
            	float giacon=giasp-(giasale2*giasp);
                %>
                <strong><p class="gia"><del><%=formatter.format(product.getProductPrice())%>đ</del> &nbsp;&nbsp;&nbsp; <%=formatter.format(giacon)%>đ</p></strong>
           		 <p class="tra-gop">Trả góp 0 %</p>
                                       <div class="fs-dttrate fs-dttrate-kk">
            								<ul>
						                        <li><span class="fa fa-star check-star "></span></li>
						                        <li><span class="fa fa-star check-star"></span></li>
						                        <li><span class="fa fa-star check-star"></span></li>
	                                            <li><span class="fa fa-star "></span></li>
	                                            <li><span class="fa fa-star "></span></li>
	                                            <span class="dd">&ensp;(<%=reviewGet.countTotalReview_product(product.getProductID())%> đánh giá)</span>
	                                            
							                </ul>
							                </div>
            </div>
			<%}}%>
			
	
        </div>
    </div>
	<jsp:include page="footer-top.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css" />
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js " integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n " crossorigin="anonymous "></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js "></script>
<script type="text/javascript">
    $(document).ready(function() {
        $(".main1-sp2").slick({
            slidesToShow: 5,
            slidesToScroll: 1,
            autoplay: 100,
            infinite: true,
            autoplaySpeed: 2000,


        })
    })
</script>
</html>