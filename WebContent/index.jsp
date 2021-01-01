<%@page import="get.admin.ReviewGet"%>
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
<html>
<head>
<%
user user=null;
user user233=new user();
UserGet userGet=new UserGet();
if(session.getAttribute("user") != null){
   user = (user) session.getAttribute("user");
  
  //user233=userGet.getUser(user.getUserID());
}
Cart cart = (Cart) session.getAttribute("cart");
if (cart == null) {
    cart = new Cart();
    session.setAttribute("cart", cart);
}
%>
 	<c:set var="root" value="${pageContext.request.contextPath}" />
 	<link rel="icon" type="image/png" href="${root}/images/favicon.ico"/>
	<meta charset="UTF-8">
	<link rel='stylesheet' type='text/css' media='screen' href='css/header.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/slider.css'>
	<link rel='stylesheet' type='text/css' media='screen' href='css/sl.css'>
	<link rel='stylesheet' type='text/css' media='screen' href='css/gs.css'>
	<link rel='stylesheet' type='text/css' media='screen' href='css/banner.css'>
	<link rel='stylesheet' type='text/css' media='screen' href='css/main-index.css'>
	<link rel='stylesheet' type='text/css' media='screen' href='css/main-index1.css'>
	<link rel='stylesheet' type='text/css' media='screen' href='css/main2.css'>
	<link rel='stylesheet' type='text/css' media='screen' href='css/main3.css'>
	<link rel='stylesheet' type='text/css' media='screen' href='css/main4.css'>
	<link rel='stylesheet' type='text/css' media='screen' href='css/main5.css'>
	<link rel='stylesheet' type='text/css' media='screen' href='css/main6.css'>
    <script src="js/slider.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital@1&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Trang chủ cửa hàng điện thoại...</title>

</head>
<body >
<%
String category_id_1="1";
if(request.getParameter("category")!=null){
    category_id_1 = request.getParameter("category");
    }
String category_id_4="4";
if(request.getParameter("category")!=null){
    category_id_4 = request.getParameter("category");
    }
String category_id_5="-77877681";
if(request.getParameter("category")!=null){
    category_id_5 = request.getParameter("category");
    }
String category_id_3="9";
if(request.getParameter("category")!=null){
    category_id_3 = request.getParameter("category");
    }
String category_id_2="12";
if(request.getParameter("category")!=null){
    category_id_2 = request.getParameter("category");
    }
Product product=new Product();
ProductGet productGet=new ProductGet();
DecimalFormat formatter = new DecimalFormat("###,###,###");
postGet postGet=new postGet();
ReviewGet reviewGet=new ReviewGet();
%>
<jsp:include page="header.jsp"></jsp:include>
<div class="main-white">
    <jsp:include page="slider.jsp"></jsp:include>
    <div class="body-main">
        <div class="clear"></div>
        <div class="container2 container2-main">
            <img alt="" src="/dienthoai/imagesphone/km.png" class="kms">
        </div>
        <div class="container2">
            <div class="main1-sp2">
                <% for(Product productSP: productGet.getListproduct_sale_dt()) {%>

                    <div class="slide" style="outline: none;">
                        <div class="colsp1">
                            <a style="outline: none;" href="single-product.jsp?productID=<%=productSP.getProductID()%>"> <img  src="/dienthoai/imagesphone/<%=productSP.getProductImage()%>"></a>

                            <a style="outline: none;" href="single-product.jsp?productID=<%=productSP.getProductID()%> ">
                                <p class="tsp">
                                    <%=productSP.getProductName() %> <br> Hàng Chính Hãng</p>
                            </a>
                            <%
                	int giasp=productSP.getProductPrice();
                	int giasale=(int)Integer.parseInt(productSP.getGiam_Gia());
                	float giasale2=(float)giasale/100;
                	float giacon=giasp-(giasale2*giasp);
                %>
                                <%
                	if(Integer.parseInt(productSP.getGiam_Gia())==0){ %>
                                    <strong><p class="gia"><%=formatter.format(productSP.getProductPrice())%>đ	</p></strong>

                                    <%}else{   %>
                                        <strong><p class="gia"><del><%=formatter.format(productSP.getProductPrice())%>đ</del> &nbsp;&nbsp;&nbsp; <%=formatter.format(giacon)%>đ</p></strong>

                                        <%} %>
                                    
            							<p class="tra-gop-1">Siêu Tiết Kiệm</p>
            							<div class="fs-dttrate fs-dttrate-kk">
            								<ul>
						                        <li><span class="fa fa-star check-star "></span></li>
						                        <li><span class="fa fa-star check-star"></span></li>
						                        <li><span class="fa fa-star check-star"></span></li>
	                                            <li><span class="fa fa-star check-star"></span></li>
	                                            <li><span class="fa fa-star "></span></li>
	                                            <span class="dd">&ensp;(<%=reviewGet.countTotalReview_product(productSP.getProductID())%> đánh giá)</span>     
							                </ul>
							                </div>
                        </div>
                    </div>
                    <%} %>
            </div>
        </div>
         <div class="bg"></div>
        <div  class="clear"></div>
        <div class="container1">
            <div class="main1-sp">
                <div class="main1-top">
                    <strong>
		                <a id="action" class="main-menu">Điện thoại</a>
		                <a href="product.jsp?categoryID=1&&brandID=1" class="main-menu">Iphone</a>
		                <a href="product.jsp?categoryID=1&&brandID=2" class="main-menu">Samsung</a>
		                <a href="product.jsp?categoryID=1&&brandID=3" class="main-menu">Oppo</a>
		                <a href="product.jsp?categoryID=1&&brandID=12" class="main-menu">Redmi</a>
		                <a href="product.jsp?categoryID=1&&brandID=-77903279" class="main-menu">Vsmart</a>
		                <a href="product.jsp?categoryID=1&&brandID=-173488884" class="main-menu">Vivo</a>
		      	   </strong>
                </div>
                <div class="main1-sp-right-main-2">
                    <% for(Product productSP: productGet.getRandombrand_category_8(Integer.parseInt(category_id_1),1)) {%>
                        <div class="colsp1">
                            <a href="single-product.jsp?productID=<%=productSP.getProductID()%>"> <img src="/dienthoai/imagesphone/<%=productSP.getProductImage()%>"></a>
                            <p class="GG">-
                                <%=productSP.getGiam_Gia()%>%</p>
                            <a href="single-product.jsp?productID=<%=productSP.getProductID()%> ">
                                <p class="tsp">
                                    <%=productSP.getProductName() %> <br> Hàng Chính Hãng</p>
                            </a>
                            <%
                	int giasp=productSP.getProductPrice();
                	int giasale=(int)Integer.parseInt(productSP.getGiam_Gia());
                	float giasale2=(float)giasale/100;
                	float giacon=giasp-(giasale2*giasp);
                %>
                                <%
                	if(Integer.parseInt(productSP.getGiam_Gia())==0){ %>
                                    <strong><p class="gia"><%=formatter.format(productSP.getProductPrice())%> đ</p></strong>

                                    <%}else{   %>
                                        <strong><p class="gia"><del><%=formatter.format(productSP.getProductPrice())%> đ</del> &nbsp;&nbsp;&nbsp; <%=formatter.format(giacon)%> đ</p></strong>
                                        <%} %>
                                        <p class="tra-gop">Trả góp 0 %</p>
                                    <div class="fs-dttrate fs-dttrate-kk">
            								<ul>
						                        <li><span class="fa fa-star check-star "></span></li>
						                        <li><span class="fa fa-star check-star"></span></li>
						                        <li><span class="fa fa-star check-star"></span></li>
	                                            <li><span class="fa fa-star check-star"></span></li>
	                                            <li><span class="fa fa-star "></span></li>
	                                            <span class="dd">&ensp;(<%=reviewGet.countTotalReview_product(productSP.getProductID())%> đánh giá)</span>
	                                            
							                </ul>
							                </div>
                        </div>
                        <%} %>
                </div>
            </div>
        </div>
        <div class="margin"></div>
        <div class="clear"></div>
        <div class="container1">
            <div class="main1-sp">
                <div class="main1-sp-right-main-2">
                    <% for(Product productSP: productGet.getRandombrand_category_8(12,1))  {%>
                        <div class="colsp1">
                            <a href="single-product.jsp?productID=<%=productSP.getProductID()%>"> <img src="/dienthoai/imagesphone/<%=productSP.getProductImage()%>"></a>
                            <p class="GG">-
                                <%=productSP.getGiam_Gia()%>%</p>
                            <a href="single-product.jsp?productID=<%=productSP.getProductID()%> ">
                                <p class="tsp">
                                    <%=productSP.getProductName() %> <br> Hàng Chính Hãng</p>
                            </a>
                            <%
                	int giasp=productSP.getProductPrice();
                	int giasale=(int)Integer.parseInt(productSP.getGiam_Gia());
                	float giasale2=(float)giasale/100;
                	float giacon=giasp-(giasale2*giasp);
                %>
                                <%
                	if(Integer.parseInt(productSP.getGiam_Gia())==0){ %>
                                    <strong><p class="gia"><%=formatter.format(productSP.getProductPrice())%> đ</p></strong>
                                    <%}else{   %>
                                        <strong><p class="gia"><del><%=formatter.format(productSP.getProductPrice())%> đ</del> &nbsp;&nbsp;&nbsp; <%=formatter.format(giacon)%> đ</p></strong>
                                        <%} %>
                                         <p class="tra-gop">Trả góp 0 %</p>
                                     <div class="fs-dttrate fs-dttrate-kk">
            								<ul>
						                        <li><span class="fa fa-star check-star "></span></li>
						                        <li><span class="fa fa-star check-star"></span></li>
						                        <li><span class="fa fa-star check-star"></span></li>
	                                            <li><span class="fa fa-star check-star"></span></li>
	                                            <li><span class="fa fa-star "></span></li>
	                                            <span class="dd">&ensp;(<%=reviewGet.countTotalReview_product(productSP.getProductID())%> đánh giá)</span>
	                                            
							                </ul>
							                </div>
                        </div>
                        <%} %>
                </div>
            </div>
        </div>
       <div class="bg"></div>
       <div class="container2-logo">
        <div class="main-logo">
            <div class="logo-shop">
                <img src="images/sam.png" alt="" class="img-logo-main">
            </div>
            <div class="logo-shop">
                <img src="images/oppo.jpg" alt="" class="img-logo-main">
            </div>
            <div class="logo-shop">
                <img src="images/redmi.jpg" alt="" class="img-logo-main">
            </div>
            <div class="logo-shop">
                <img src="images/xia.png" alt="" class="img-logo-main">
            </div>
            <div class="logo-shop">
                <img src="images/hua.jpg" alt="" class="img-logo-main">
            </div>
            <div class="logo-shop">
                <img src="images/sony.png" alt="" class="img-logo-main">
            </div>
            <div class="logo-shop">
                <img src="images/vs.png" alt="" class="img-logo-main">
            </div>
            <div class="logo-shop">
                <img src="images/no.png" alt="" class="img-logo-main">
            </div>
			 <div class="logo-shop">
                <img src="images/app.png" alt="" class="img-logo-main">
            </div>
        </div>
    </div>
        <div class="bg"></div>
        <div class="clear"></div>
        <div class="container1">
            <h3>Bài Viết Nổi Bật</h3>
            <div class="main1-sp2">
                <% 
        for(post baiviet:postGet.getPost()) {%>
                    <div class="slide" style="outline: none;">
                        <div class="colsp1">
                            <a style="outline: none;" href="bangtin.jsp?post_id=<%=baiviet.getPost_id()%>"> <img   src="/dienthoai/imagesphone/<%=baiviet.getImg()%>"></a>

                            <a style="outline: none;" href="bangtin.jsp?post_id=<%=baiviet.getPost_id()%> ">
                                <p class="tsp">
                                    <%=baiviet.getPost_name()%>
                                </p>
                            </a>

                        </div>
                    </div>
                    <%} %>
            </div>
        </div>
    </div>
</div>
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
<script type="text/javascript">
    $(document).ready(function() {
        $(".main-logo").slick({
            slidesToShow: 7,
            slidesToScroll: 1,
            autoplay: 100,
            infinite: true,
            autoplaySpeed: 4000,
        })
    })
</script>
</html>