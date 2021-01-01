<%@page import="get.admin.ReviewGet"%>
<%@page import="model.admin.Product"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="get.admin.ProductGet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
 	<c:set var="root" value="${pageContext.request.contextPath}" />
 	<link rel="icon" type="image/png" href="${root}/img/favicon.ico"/>
	<meta charset="UTF-8">
	<link rel='stylesheet' type='text/css' media='screen' href='css/header.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/slider.css'>
     <link rel='stylesheet' type='text/css' media='screen' href='css/sl.css'>
      <link rel='stylesheet' type='text/css' media='screen' href='css/gs.css'>
              <link rel='stylesheet' type='text/css' media='screen' href='css/main3.css'>
    <script src="js/slider.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Insert title here</title>
</head>
<body>
	<div style="margin-top: 30px;"></div>
    <div class="clear"></div>
    <br>
    <br>
	<div class="container">
        <h4>Sản phẩm bạn có thể thích</h4>
        <div class="main1-sp2" >
	<%
	ReviewGet reviewGet=new ReviewGet();
		ProductGet productGet=new ProductGet();
		DecimalFormat decimalFormat=new DecimalFormat("###,###,###");
		for(Product productft:productGet.getRanDom()){
	%>
	 <div class="slide" style="outline: none;">
            <div class="colsp1">
                    <a style="outline: none;" href="single-product.jsp?productID=<%=productft.getProductID()%>"><img src="${root}/imagesphone/<%=productft.getProductImage()%>"></a>
                <p class="GG">-<%=productft.getGiam_Gia()%>%</p>
                <a style="outline: none;" href="single-product.jsp?productID=<%=productft.getProductID()%>"><p class="tsp"> <%=productft.getProductName()%><br> Hàng Chính Hãng</p></a>
                 <%
                 int giasp=productft.getProductPrice();
             	int giasale=(int)Integer.parseInt(productft.getGiam_Gia());
             	float giasale2=(float)giasale/100;
             	float giacon=giasp-(giasale2*giasp);
                %>
                <%
                	if(Integer.parseInt(productft.getGiam_Gia())==0){ %>
                	<strong><p class="gia"><%=decimalFormat.format(productft.getProductPrice())%>đ	</p></strong>
                		
               	<%}else{   %>
                <strong><p class="gia"><del><%=decimalFormat.format(productft.getProductPrice())%></del>&nbsp; <%=decimalFormat.format(giacon) %>đ</p></strong>
            
            		<%} %>
            		<div class="fs-dttrate fs-dttrate-kk">
            								<ul>
						                        <li><span class="fa fa-star check-star "></span></li>
						                        <li><span class="fa fa-star check-star"></span></li>
						                        <li><span class="fa fa-star check-star"></span></li>
	                                            <li><span class="fa fa-star check-star"></span></li>
	                                            <li><span class="fa fa-star check-star"></span></li>
	                                            <span class="dd">&ensp;(<%=reviewGet.countTotalReview_product(productft.getProductID())%> đánh giá)</span>
	                                            
							                </ul>
							                </div>
            </div>
            </div>
           <%} %>
        </div>
    </div>
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