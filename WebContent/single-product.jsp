
<%@page import="java.util.Date"%>


<%@page import="model.admin.Comment"%>
<%@page import="get.admin.cmtGet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="get.admin.UserGet"%>
<%@page import="model.admin.Brand"%>
<%@page import="model.admin.Cart"%>
<%@page import="model.admin.user"%>
<%@page import="model.admin.Category"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="get.admin.CategoryGet"%>
<%@page import="model.admin.Review"%>
<%@page import="get.admin.ReviewGet"%>
<%@page import="model.admin.Product"%>
<%@page import="get.admin.BrandGet"%>
<%@page import="get.admin.ProductGet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	

 	<c:set var="root" value="${pageContext.request.contextPath}" />
 	<link rel="icon" type="image/png" href="${root}/images/favicon.ico"/>
	<meta charset="UTF-8">
	<link rel='stylesheet' type='text/css' media='screen' href='css/header.css'>
	<link rel='stylesheet' type='text/css' media='screen' href='css/header1.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/slider.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/main4.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/rating.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='${root }/css/review.css'>
      
    <script src="js/slider.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
     <link rel='stylesheet' type='text/css' media='screen' href='css/star.css'>
    <script src="js/slider.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <!-- <script src='https://kit.fontawesome.com/a076d05399.js'></script>-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>
<title>Trang chủ của hàng...</title>
</head>
<body>
<%
    user user=null;
   user userName=new user();
   UserGet userGet=new UserGet();
    if(session.getAttribute("user") != null){
        user = (user) session.getAttribute("user");
        userName=userGet.getUser(user.getUserID());
    }else{
        user=null;
    }
      ProductGet productGet = new ProductGet();
    Category category=new Category();
    CategoryGet categoryGet=new CategoryGet();
    Brand brand=new Brand();
      BrandGet brandget = new BrandGet();
      Product product = new Product();
      String productID = "";
      if (request.getParameter("productID") != null) {
           productID = request.getParameter("productID");
           product = productGet.getProduct(Integer.parseInt(productID));
           brand=brandget.getBrand(product.getBrandID());
           category=categoryGet.getCategory(product.getCategoryID());
           
      }
      SimpleDateFormat formatterDate = new SimpleDateFormat("dd/MM/yyyy");
      ReviewGet reviewGet = new ReviewGet();
      int category_id = product.getCategoryID();
      Review review = new Review();
      CategoryGet categoryget = new CategoryGet();
      String category_id_1 = "1";
      DecimalFormat formatter = new DecimalFormat("###,###,###");
      
      Cart cart = (Cart) session.getAttribute("cart");
      if (cart == null) {
          cart = new Cart();
          session.setAttribute("cart", cart);
      }
    ReviewGet reviewGet2=new ReviewGet();
      %>
	<jsp:include page="header.jsp"></jsp:include>

		<div class="container">
		 <p style="padding-top: 20px"><strong> <%=categoryGet.getCategory(product.getCategoryID()).getCategoryName()%> / <%=brandget.getBrand(product.getBrandID()).getBrandName()%> / <%=product.getProductName() %></strong></p>
		
        <div class="pr-main-left">
            <jsp:include page="banner.jsp"></jsp:include>

        </div>
        <div class="pr-main-right">
            <div class="container-min">
                <div class="img-pt">
					<a class="zoom" href="/dienthoai/imagesphone/<%=product.getProductImage() %>">
						<img id="product-big" class="product-img-big" src="/dienthoai/imagesphone/<%=product.getProductImage() %>">
					</a>
                    <div class="img-pt-left">
                        <a class="zoom" href="/dienthoai/imagesphone/<%=product.getProductImagenext() %>"><img id="product-small" src="/dienthoai/imagesphone/<%=product.getProductImagenext() %>"></a>
                        <a class="zoom" href="/dienthoai/imagesphone/<%=product.getProductImage() %>"><img id="product-small" src="/dienthoai/imagesphone/<%=product.getProductImage() %>"></a>
                        <a class="zoom" href="/dienthoai/imagesphone/<%=product.getProductImagenext() %>"><img id="product-small" src="/dienthoai/imagesphone/<%=product.getProductImagenext() %>"></a>
                    </div>
                </div>


                <div></div>
                <div class="img-pt-right">
                    <h3><%=product.getProductName() %> – Hàng Chính Hãng</h3>
                    <%
                    int giasp=product.getProductPrice();
                	int giasale=(int)Integer.parseInt(product.getGiam_Gia());
                	float giasale2=(float)giasale/100;
                	float giacon=giasp-(giasale2*giasp);
                    %>
                   <strong>
                   	 <h3 class="gia">Giá:<%=formatter.format(giacon) %>đ</h3>
                    <a href="product.jsp?categoryID=1&&brandID=0" ><span style="color: black;">Hãng:</span> <span style="color: red"><%=category.getCategoryName() %> - <span style="color: red"><%=brand.getBrandName() %></span></a>
                    <a>Chính hãng, Nguyên seal, Mới 100%</a>
                    <a>Miễn phí giao hàng toàn quốc </a>
                    
                    <a>Hệ Điều Hành:<%=product.getHe_Dieu_Hanh() %></a>
                    <a>Camera Trước / Sau: <%=product.getCamera_Truoc()%>/<%=product.getCamera_Sau()%></a>
                    <a>CPU: <%=product.getHe_Dieu_Hanh() %></a>
                    <a>Bộ Nhớ:<%=product.getBo_Nho()%></a>
                    <a>Ram Máy:<%=product.getRam() %></a>
                   </strong>
                    <form method="POST" action="${root}/CartServlet">
                    	
                        <input name="quantity" class="qty" value="1" min="1" max="30" type="number">
                       <p class="tg">Mua Trả Góp</p>
                        <a class="tgh" href="CartServlet?command=plus&productID=<%=product.getProductID()%>" >Thêm Vào Giỏ Hàng</a>
                    </form>
                </div>
                <hr>
            </div>
            <div class="clear"></div>
            <div class="container-min">
           		
	           		<div class="danhgia">
	                    <h2>Thông tin chi tiết</h2>
	                </div>
	                <div class="mota">
	                   <%=
	                   	  product.getProductDescription()
	                   %>
	                </div>
           	
                
            </div>
            </div>
            <br>
           


        </div>
  <div class="clear"></div>
 <div class="container">
 	
 	<div class="container-min">
                <div class="danhgia">
                    <h3>Hãy Là Người Đầu Tiên Đánh Giá <ins><%=product.getProductName()%></ins> Của Cửa Hàng.</h3>
                </div>
                <div class="formdanhgia" style="border:1px solid white;background-color: #F0F0F0">
                    <form action="${root}/ReviewServlet" method="post">
                        <div class="form1">
                            <strong><p>Đánh Giá Của Bạn</p></strong>
                            <div class="stars">
                                <input class="star star-5" id="star-5" type="radio" value="5" name="rating" />
                                <label class="star star-5" for="star-5"></label>
                                <input class="star star-4" id="star-4" type="radio" value="4" name="rating" />
                                <label class="star star-4" for="star-4"></label>
                                <input class="star star-3" id="star-3" type="radio" value="3" name="rating" />
                                <label class="star star-3" for="star-3"></label>
                                <input class="star star-2" id="star-2" type="radio" value="2" name="rating" />
                                <label class="star star-2" for="star-2"></label>
                                <input class="star star-1" id="star-1" type="radio" value="1" name="rating" />
                                <label class="star star-1" for="star-1"></label>
                            </div>
                            <strong><p>Nhận xét của bạn</p></strong>
                            <textarea class="nhanxet" name="message" style="border: none;"></textarea>
                            <strong><p>Tên Của bạn:</p></strong>
                            <input  type="text" name="name">
                            <strong><p>Mail Của bạn:</p></strong>
                            <input  type="text" name="email">
                            <p></p>
                            <input style="background-color: #FF8200;margin-bottom: 20px;" type="submit" value="Nhận xét" >
                            <input type="hidden" name="command" value="insert"></p>
                            <input type="hidden" name="product_id" value="<%=product.getProductID()%>">
                        </div>
                    </form>

                </div>
               	</div>
				<div class="ratting">
               		<span class="heading">Khách Hàng Rating</span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star"></span>
					<p>Tổng số <%=reviewGet2.countTotalReview_product(product.getProductID())%> reviews. </p>
				
					
					<div class="row">
					 <div class="row-se">
						  <div class="side">
						    <div >5 star</div>
						  </div>
						  <div class="middle">
						    <div class="bar-container">
						      <div id="bar-5" class="bar-5" ></div>
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
						      <div id="bar-4" class="bar-4"></div>
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
						      <div id="bar-3" class="bar-3"></div>
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
							      <div id="bar-2" class="bar-2"></div>
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
						      <div id="bar-1" class="bar-1"></div>
						    </div>
						  </div>
						  <div class="side right">
						    <div><%=reviewGet2.countTotalReview_product_level(product.getProductID(),1)%></div>
						  </div>
					  </div>
					  <%
                         for(Review review2:reviewGet.getListReviewByProduct(product.getProductID())){
                            
                         %>
					 
					    <div class="row-cmt">
					        <div class="col-sm-3">
					            <img src="http://dummyimage.com/60x60/666/ffffff&text=No+Image" class="img-rounded">
					            <div class="review-block-name"><a href="#axa"><%=review2.getReviewName() %></a></div>
					            <div class="review-block-date"><%=review2.getReviewDate()%><br/>
					            <%
					            
					            %>
					            </div>
					        </div>
					        <div class="col-sm-9">
					            <div class="review-block-rate">
					          <%if(review2.getReviewStar()==5){
					        	  %>
					        	   <span class="fa fa-star checked"></span>
					                <span class="fa fa-star checked"></span>
					                <span class="fa fa-star checked"></span>
					                <span class="fa fa-star checked"></span>
					                <span class="fa fa-star checked"></span>
					        	  <% 
					       		   }else if(review2.getReviewStar()==4){
					        	  %>
					        	    <span class="fa fa-star checked"></span>
					                <span class="fa fa-star checked"></span>
					                <span class="fa fa-star checked"></span>
					                <span class="fa fa-star checked"></span>
					                <span class="fa fa-star "></span>
					        	  <%}else if(review2.getReviewStar()==3){
						        	  %>
						        	    <span class="fa fa-star checked"></span>
						                <span class="fa fa-star checked"></span>
						                <span class="fa fa-star checked"></span>
						                <span class="fa fa-star "></span>
						                <span class="fa fa-star "></span>
						        	  <%}
					        	  else if(review2.getReviewStar()==2){
						        	  %>
						        	    <span class="fa fa-star checked"></span>
						                <span class="fa fa-star checked"></span>
						                <span class="fa fa-star "></span>
						                <span class="fa fa-star "></span>
						                <span class="fa fa-star "></span>
						        	  <%}
					        	  else if(review2.getReviewStar()==1){
						        	  %>
						        	    <span class="fa fa-star checked"></span>
						                <span class="fa fa-star "></span>
						                <span class="fa fa-star "></span>
						                <span class="fa fa-star "></span>
						                <span class="fa fa-star "></span>
						        	  <%}%>
					          
					            	
					            	
					            	
					           
					               
					            </div>
					            <div class="review-block-title"><%=review2.getReviewMessage() %>.</div>
					            <div class="review-block-description">
					          <%=review2.getReviewMessage() %>
					            </div>
					        </div>
					    </div>
					    <%} %>
					 <%
					 if(reviewGet.countTotalReview_product(product.getProductID())>0){
						 %>
						  <a class="xtcmt">Xem thêm bình luận.</a>
						 <%
					 }
					 %>
					</div>
               </div>
 
 </div>
 
 
    <div style="margin-top: 30px;"></div>
    <div class="clear"></div>
    <br>
    <br>
	
    
<div class="clear"></div>
<div class="container">
<h3>Sản Phẩm Liên Quan</h3>
    <div class="main1-sp2">

        <% for(Product productSP: productGet.getListProductByBrand_Lienquan(product.getCategoryID(), product.getBrandID())) {%>

            <div class="slide" style="outline: none;">
                <div class="colsp1">
                    <a style="outline: none;" href="single-product.jsp?productID=<%=productSP.getProductID()%>"> <img  src="/dienthoai/imagesphone/<%=productSP.getProductImage()%>"></a>
                    <p class="GG" style="z-index: 100">-
                        <%=productSP.getGiam_Gia()%>%</p>
                    <a style="outline: none;" href="single-product.jsp?productID=<%=productSP.getProductID()%> ">
                        <p class="tsp" style="color: black;">
                            <%=productSP.getProductName() %> <br> Hàng Chính Hãng</p>
                    </a>
                    <%
                    int giaSP=product.getProductPrice();
                	int giaSALE=(int)Integer.parseInt(product.getGiam_Gia());
                	float giaSALE2=(float)giaSALE/100;
                	float giacon1=giaSP-(giaSALE2*giaSP);
                %>
                        <%
                	if(Integer.parseInt(productSP.getGiam_Gia())==0){ %>
                            <strong><p class="gia"><%=formatter.format(productSP.getProductPrice())%>đ	</p></strong>

                            <%}else{   %>
                                <strong><p class="gia"><del><%=formatter.format(productSP.getProductPrice())%>đ</del> &nbsp;&nbsp;&nbsp; <%=formatter.format(giacon1)%>đ</p></strong>

                                <%} %>
                                <div class="fs-dttrate fs-dttrate-kk">
            								<ul>
            								            								
						                        <li><span class="fa fa-star check-star "></span></li>
						                        <li><span class="fa fa-star check-star"></span></li>
						                        <li><span class="fa fa-star check-star"></span></li>
	                                            <li><span class="fa fa-star check-star"></span></li>
	                                            <li><span class="fa fa-star check-star"></span></li>
	                                            <span class="dd">&ensp;(<%=reviewGet.countTotalReview_product(productSP.getProductID())%> đánh giá)</span>
	                                            
							                </ul>
							                </div>
                </div>
            </div>
            <%} %>
</div>

    </div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
<%
	
	int tong5=reviewGet2.countTotalReview_product_level(product.getProductID(), 5);
	int tong4=reviewGet2.countTotalReview_product_level(product.getProductID(), 4);
	int tong3=reviewGet2.countTotalReview_product_level(product.getProductID(), 3);
	int tong2=reviewGet2.countTotalReview_product_level(product.getProductID(), 2);
	int tong1=reviewGet2.countTotalReview_product_level(product.getProductID(), 1);
	int tong=reviewGet.countTotalReview_product(product.getProductID());
	if(tong<50){
		tong5=tong5*10;
		tong4=tong4*10;
		tong3=tong3*10;
		tong2=tong2*10;
		tong1=tong1*10;
	}else if(tong>50&&tong<500){
		tong5=tong5*1;
		tong4=tong4*1;
		tong3=tong3*1;
		tong2=tong2*1;
		tong1=tong1*1;
	}else if(tong>500&&tong<5000){
		tong5=tong5/10;
		tong4=tong4/10;
		tong3=tong3/10;
		tong2=tong2/10;
		tong1=tong1/10;
	}
		else if(tong>5000&&tong<50000){
			tong5=tong5/100;
			tong4=tong4/100;
			tong3=tong3/100;
			tong2=tong2/100;
			tong1=tong1/100;
		}
		else if(tong>50000&&tong<500000){
			tong5=tong5/1000;
			tong4=tong4/1000;
			tong3=tong3/1000;
			tong2=tong2/1000;
			tong1=tong1/1000;
		}
	
%>
	document.getElementById("bar-5").style.width ="<%=tong5%>";
	document.getElementById("bar-4").style.width = "<%=tong4%>";
	document.getElementById("bar-3").style.width = "<%=tong3%>";
	document.getElementById("bar-2").style.width = "<%=tong2%>";
	document.getElementById("bar-1").style.width = "<%=tong1%>";
	
		

</script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css" />
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
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
