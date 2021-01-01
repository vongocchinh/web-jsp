
<%@page import="java.util.List"%>
<%@page import="model.admin.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="get.admin.ProductGet"%>
<%@page import="get.admin.BrandGet"%>
<%@page import="get.admin.CategoryGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <link href="css_main.css" rel="stylesheet">
    <link href="css_main1.css" rel="stylesheet">
     <link href="/dienthoai/admin/css_main2.css" rel="stylesheet">
    
     <c:set var="root" value="${pageContext.request.contextPath}"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Sản Phẩm</title>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
         <link href="${root}/admin/css_body.css" rel='stylesheet' type='text/css'>
        <link rel="icon" type="image/png" href="${root}/admin/imagesAdmin/favicon.ico"/>

    </head>
    <body class="body1">
     
     
        <jsp:include page="header1.jsp"></jsp:include>
<div class="container-right">
	<div class="menu-top">
	<a class="menu-tc" href="/dienthoai/admin/manager_tc.jsp?tc=1">Điện Thoại</a>
	<a class="menu-tc" href="/dienthoai/admin/manager_tc.jsp?tc=4">Phụ Kiện</a>
	<a class="menu-tc" href="/dienthoai/admin/manager_tc.jsp?tc=-77877681">Máy Ảnh</a>
	<a class="menu-tc" href="/dienthoai/admin/manager_tc.jsp?tc=12">Máy Tính Bảng</a>
	<a class="menu-tc" href="/dienthoai/admin/manager_tc.jsp?tc=9">Lap Top</a>
	</div>
	
	<%
	int category_ID1=0;
    if(request.getParameter("tc")!=null){
    category_ID1= Integer.parseInt(request.getParameter("tc"));
    }
   
   if(category_ID1==1){
	  
	   %>
	      <div class="table-container">
                    <table id="table-one" class="table-one" style="width: 100%">
                        <tr class="data">
                            <th class="data" width="30px">STT</th>
                            <!--  <th class="data">Mã sản phẩm</th> -->
                            <th class="data">Tên mặt hàng</th>
                            <th class="data">Tên sản phẩm</th>
                            <th class="data">Thương hiệu</th>
                            <th class="data">Giá</th>
                            <th class="data">Giam Gia</th>           
							<th class="data" width="100px">Hình đại diện</th>
                            <th class="data" width="100px">Hình sau</th>
                            <th class="data">Mô tả</th>
                        </tr>
                    <%
                    CategoryGet categoryGet14 = new CategoryGet();
                    BrandGet brandGet = new BrandGet();
                    ProductGet productGet1411 = new ProductGet();
        DecimalFormat formatter = new DecimalFormat("###,###,###");
                    
                      
      
                    %>
                    <%
                    ProductGet productGet=new ProductGet();
    int first = 0, last = 0, pages = 1;
    
    if (request.getParameter("pages") != null) {
        pages = (int) Integer.parseInt(request.getParameter("pages"));
    }
    
    
    
    
  int total= productGet.countproduct_tc(1);
    if (total <= 10) {
        first = 0; 
        last = total; 
    } else {
        first = (pages - 1) * 10;
        last = 10;
    }
    
   
    int count=0;
    for (Product product : productGet.getListProduct_a_b_tc(1, first, last)) {
    	count++;
%>
                    <tr class="data">
                        <td class="data" width="30px"><%=count%></td>
                       <!--  <td class="data"><%=product.getProductID()%></td> -->
                        <td class="data"><%=categoryGet14.getCategory(product.getCategoryID()).getCategoryName()%></td>
                        <td class="data"><%=product.getProductName()%></td>
                        <td class="data"><%=brandGet.getBrand(product.getBrandID()).getBrandName()%></td>
                        <td class="data"><%=formatter.format(product.getProductPrice())%></td>
                        <td class="data"><%=product.getGiam_Gia()%> %</td>
                        
                        
                        <td class="data"><img width="85" height="100" class="hinhql" src="/dienthoai/imagesphone/<%=product.getProductImage()%>"/></td>
                        <td class="data"><img width="85" height="100" style="padding: center"; class="hinhql" src="/dienthoai/imagesphone/<%=product.getProductImagenext()%>"/></td>
                       
                        <td class="data"><a href="/dienthoai/admin/product_description.jsp?product_id=<%=product.getProductID()%>">Xem chi tiết</a></td>
						
                    </td>
                    </tr>
                    <% }%>
                </table>
                </div>
            </div>
            
            


            <div class="clear"></div>
		<div class="phantrang">   
    <%                
        int back = 0;
        if (pages == 0 || pages == 1) {
            back = 1;
        } else {
            back = pages - 1;
        }
    %>
    <a class="back" href="/dienthoai/admin/manager_tc.jsp?pages=<%=back%>&&tc=1"><i class='far fa-arrow-alt-circle-left'></i></a>
                <%
                    
                    int loop = 0, num = 0;
                    if ((total / 10) % 2 == 0) {
                        num = total / 10;
                    } else {
                        num = (total + 1) / 10;
                    }
                   
                    if (total % 2 != 0) {
                        loop = (total / 10) + 1;

                    } else {
                       
                        if (total < (num * 10) + 10 && total != num * 10) {
                            loop = (total / 10) + 1;
                        } else {
                           
                            loop = (total / 10);
                        }
                    }
                   
                    for (int i = 1; i <= loop; i++) {%>
                <% if (pages == i) {%> 

    <a href="/dienthoai/admin/manager_tc.jsp?pages=<%=i%>&&tc=1"><%=i%></a>
                <%} else {%>
    <a href="/dienthoai/admin/manager_tc.jsp?pages=<%=i%>&&tc=1"><%=i%></a> 

        <%}
             }%>
        <%
            
            int next = 0;
           
            if (total % 2 != 0) {
                if (pages == (total / 10) + 1) {
                    next = pages;
                } else {
                    next = pages + 1;
                }
            } else {
                
                if (total < (num * 10) + 10 && total != num * 10) {
                    if (pages == (total / 10) + 1) {
                        next = pages;
                    } else {
                        next = pages + 1;
                    }
                } else {
                    
                    if (pages == (total / 10)) {
                        next = pages;
                    } else {
                        next = pages + 1;
                    }
                }
            }
        %>
    <a class="next" href="/dienthoai/admin/manager_tc.jsp?pages=<%=next%>&&tc=1"><i class='far fa-arrow-alt-circle-right'></i></a>
</div>
	   <% 
	   
   }else  if(category_ID1==4){
	   
	  %>
	     <div class="table-container">
                    <table id="table-one" class="table-one" style="width: 100%">
                        <tr class="data">
                            <th class="data" width="30px">STT</th>
                            <!--  <th class="data">Mã sản phẩm</th> -->
                            <th class="data">Tên mặt hàng</th>
                            <th class="data">Tên sản phẩm</th>
                            <th class="data">Thương hiệu</th>
                            <th class="data">Giá</th>
                            <th class="data">Giam Gia</th>           
							<th class="data" width="100px">Hình đại diện</th>
                            <th class="data" width="100px">Hình sau</th>
                            <th class="data">Mô tả</th>
                        </tr>
                    <%
                    CategoryGet categoryGet14 = new CategoryGet();
                    BrandGet brandGet = new BrandGet();
                    ProductGet productGet1411 = new ProductGet();
        DecimalFormat formatter = new DecimalFormat("###,###,###");
                    
                      
      
                    %>
                    <%
                    ProductGet productGet=new ProductGet();
    int first = 0, last = 0, pages = 1;
    
    if (request.getParameter("pages") != null) {
        pages = (int) Integer.parseInt(request.getParameter("pages"));
    }
    
    
    
    
  int total= productGet.countproduct_tc(4);
    if (total <= 10) {
        first = 0; 
        last = total; 
    } else {
        first = (pages - 1) * 10;
        last = 10;
    }
    
   
    int count=0;
    for (Product product : productGet.getListProduct_a_b_tc(4, first, last)) {
    	count++;
%>
                    <tr class="data">
                        <td class="data" width="30px"><%=count%></td>
                       <!--  <td class="data"><%=product.getProductID()%></td> -->
                        <td class="data"><%=categoryGet14.getCategory(product.getCategoryID()).getCategoryName()%></td>
                        <td class="data"><%=product.getProductName()%></td>
                        <td class="data"><%=brandGet.getBrand(product.getBrandID()).getBrandName()%></td>
                        <td class="data"><%=formatter.format(product.getProductPrice())%></td>
                        <td class="data"><%=product.getGiam_Gia()%> %</td>
                        
                        
                        <td class="data"><img width="85" height="100" class="hinhql" src="/dienthoai/imagesphone/<%=product.getProductImage()%>"/></td>
                        <td class="data"><img width="85" height="100" style="padding: center"; class="hinhql" src="/dienthoai/imagesphone/<%=product.getProductImagenext()%>"/></td>
                       
                        <td class="data"><a href="/dienthoai/admin/product_description.jsp?product_id=<%=product.getProductID()%>">Xem chi tiết</a></td>
						
                    </td>
                    </tr>
                    <% }%>
                </table>
                </div>
            </div>
            
            


            <div class="clear"></div>
		<div class="phantrang">   
    <%                
        int back = 0;
        if (pages == 0 || pages == 1) {
            back = 1;
        } else {
            back = pages - 1;
        }
    %>
    <a class="back" href="/dienthoai/admin/manager_tc.jsp?pages=<%=back%>&&tc=4"><i class='far fa-arrow-alt-circle-left'></i></a>
                <%
                    
                    int loop = 0, num = 0;
                    if ((total / 10) % 2 == 0) {
                        num = total / 10;
                    } else {
                        num = (total + 1) / 10;
                    }
                   
                    if (total % 2 != 0) {
                        loop = (total / 10) + 1;

                    } else {
                       
                        if (total < (num * 10) + 10 && total != num * 10) {
                            loop = (total / 10) + 1;
                        } else {
                           
                            loop = (total / 10);
                        }
                    }
                   
                    for (int i = 1; i <= loop; i++) {%>
                <% if (pages == i) {%> 

    <a href="/dienthoai/admin/manager_tc.jsp?pages=<%=i%>&&tc=4"><%=i%></a>
                <%} else {%>
    <a href="/dienthoai/admin/manager_tc.jsp?pages=<%=i%>&&tc=4"><%=i%></a> 

        <%}
             }%>
        <%
            
            int next = 0;
           
            if (total % 2 != 0) {
                if (pages == (total / 10) + 1) {
                    next = pages;
                } else {
                    next = pages + 1;
                }
            } else {
                
                if (total < (num * 10) + 10 && total != num * 10) {
                    if (pages == (total / 10) + 1) {
                        next = pages;
                    } else {
                        next = pages + 1;
                    }
                } else {
                    
                    if (pages == (total / 10)) {
                        next = pages;
                    } else {
                        next = pages + 1;
                    }
                }
            }
        %>
    <a class="next" href="/dienthoai/admin/manager_tc.jsp?pages=<%=next%>&&tc=4"><i class='far fa-arrow-alt-circle-right'></i></a>
</div>
	  <%
   }
   else  if(category_ID1==-77877681){
	   
		  %>
		     <div class="table-container">
	                    <table id="table-one" class="table-one" style="width: 100%">
	                        <tr class="data">
	                            <th class="data" width="30px">STT</th>
	                            <!--  <th class="data">Mã sản phẩm</th> -->
	                            <th class="data">Tên mặt hàng</th>
	                            <th class="data">Tên sản phẩm</th>
	                            <th class="data">Thương hiệu</th>
	                            <th class="data">Giá</th>
	                            <th class="data">Giam Gia</th>           
								<th class="data" width="100px">Hình đại diện</th>
	                            <th class="data" width="100px">Hình sau</th>
	                            <th class="data">Mô tả</th>
	                        </tr>
	                    <%
	                    CategoryGet categoryGet14 = new CategoryGet();
	                    BrandGet brandGet = new BrandGet();
	                    ProductGet productGet1411 = new ProductGet();
	        DecimalFormat formatter = new DecimalFormat("###,###,###");
	                    
	                      
	      
	                    %>
	                    <%
	                    ProductGet productGet=new ProductGet();
	    int first = 0, last = 0, pages = 1;
	    
	    if (request.getParameter("pages") != null) {
	        pages = (int) Integer.parseInt(request.getParameter("pages"));
	    }
	    
	    
	    
	    
	  int total= productGet.countproduct_tc(-77877681);
	    if (total <= 10) {
	        first = 0; 
	        last = total; 
	    } else {
	        first = (pages - 1) * 10;
	        last = 10;
	    }
	    
	   
	    int count=0;
	    for (Product product : productGet.getListProduct_a_b_tc(-77877681, first, last)) {
	    	count++;
	%>
	                    <tr class="data">
	                        <td class="data" width="30px"><%=count%></td>
	                       <!--  <td class="data"><%=product.getProductID()%></td> -->
	                        <td class="data"><%=categoryGet14.getCategory(product.getCategoryID()).getCategoryName()%></td>
	                        <td class="data"><%=product.getProductName()%></td>
	                        <td class="data"><%=brandGet.getBrand(product.getBrandID()).getBrandName()%></td>
	                        <td class="data"><%=formatter.format(product.getProductPrice())%></td>
	                        <td class="data"><%=product.getGiam_Gia()%> %</td>
	                        
	                        
	                        <td class="data"><img width="85" height="100" class="hinhql" src="/dienthoai/imagesphone/<%=product.getProductImage()%>"/></td>
	                        <td class="data"><img width="85" height="100" style="padding: center"; class="hinhql" src="/dienthoai/imagesphone/<%=product.getProductImagenext()%>"/></td>
	                       
	                        <td class="data"><a href="/dienthoai/admin/product_description.jsp?product_id=<%=product.getProductID()%>">Xem chi tiết</a></td>
							
	                    </td>
	                    </tr>
	                    <% }%>
	                </table>
	                </div>
	            </div>
	            
	            


	            <div class="clear"></div>
			<div class="phantrang">   
	    <%                
	        int back = 0;
	        if (pages == 0 || pages == 1) {
	            back = 1;
	        } else {
	            back = pages - 1;
	        }
	    %>
	    <a class="back" href="/dienthoai/admin/manager_tc.jsp?pages=<%=back%>&&tc=-77877681"><i class='far fa-arrow-alt-circle-left'></i></a>
	                <%
	                    
	                    int loop = 0, num = 0;
	                    if ((total / 10) % 2 == 0) {
	                        num = total / 10;
	                    } else {
	                        num = (total + 1) / 10;
	                    }
	                   
	                    if (total % 2 != 0) {
	                        loop = (total / 10) + 1;

	                    } else {
	                       
	                        if (total < (num * 10) + 10 && total != num * 10) {
	                            loop = (total / 10) + 1;
	                        } else {
	                           
	                            loop = (total / 10);
	                        }
	                    }
	                   
	                    for (int i = 1; i <= loop; i++) {%>
	                <% if (pages == i) {%> 

	    <a href="/dienthoai/admin/manager_tc.jsp?pages=<%=i%>&&tc=-77877681"><%=i%></a>
	                <%} else {%>
	    <a href="/dienthoai/admin/manager_tc.jsp?pages=<%=i%>&&tc=-77877681"><%=i%></a> 

	        <%}
	             }%>
	        <%
	            
	            int next = 0;
	           
	            if (total % 2 != 0) {
	                if (pages == (total / 10) + 1) {
	                    next = pages;
	                } else {
	                    next = pages + 1;
	                }
	            } else {
	                
	                if (total < (num * 10) + 10 && total != num * 10) {
	                    if (pages == (total / 10) + 1) {
	                        next = pages;
	                    } else {
	                        next = pages + 1;
	                    }
	                } else {
	                    
	                    if (pages == (total / 10)) {
	                        next = pages;
	                    } else {
	                        next = pages + 1;
	                    }
	                }
	            }
	        %>
	    <a class="next" href="/dienthoai/admin/manager_tc.jsp?pages=<%=next%>&&tc=-77877681"><i class='far fa-arrow-alt-circle-right'></i></a>
	</div>
		  <%
	   }
   else  if(category_ID1==12){
	   
		  %>
		     <div class="table-container">
	                    <table id="table-one" class="table-one" style="width: 100%">
	                        <tr class="data">
	                            <th class="data" width="30px">STT</th>
	                            <!--  <th class="data">Mã sản phẩm</th> -->
	                            <th class="data">Tên mặt hàng</th>
	                            <th class="data">Tên sản phẩm</th>
	                            <th class="data">Thương hiệu</th>
	                            <th class="data">Giá</th>
	                            <th class="data">Giam Gia</th>           
								<th class="data" width="100px">Hình đại diện</th>
	                            <th class="data" width="100px">Hình sau</th>
	                            <th class="data">Mô tả</th>
	                        </tr>
	                    <%
	                    CategoryGet categoryGet14 = new CategoryGet();
	                    BrandGet brandGet = new BrandGet();
	                    ProductGet productGet1411 = new ProductGet();
	        DecimalFormat formatter = new DecimalFormat("###,###,###");
	                    
	                      
	      
	                    %>
	                    <%
	                    ProductGet productGet=new ProductGet();
	    int first = 0, last = 0, pages = 1;
	    
	    if (request.getParameter("pages") != null) {
	        pages = (int) Integer.parseInt(request.getParameter("pages"));
	    }
	    
	    
	    
	    
	  int total= productGet.countproduct_tc(12);
	    if (total <= 10) {
	        first = 0; 
	        last = total; 
	    } else {
	        first = (pages - 1) * 10;
	        last = 10;
	    }
	    
	   
	    int count=0;
	    for (Product product : productGet.getListProduct_a_b_tc(12, first, last)) {
	    	count++;
	%>
	                    <tr class="data">
	                        <td class="data" width="30px"><%=count%></td>
	                       <!--  <td class="data"><%=product.getProductID()%></td> -->
	                        <td class="data"><%=categoryGet14.getCategory(product.getCategoryID()).getCategoryName()%></td>
	                        <td class="data"><%=product.getProductName()%></td>
	                        <td class="data"><%=brandGet.getBrand(product.getBrandID()).getBrandName()%></td>
	                        <td class="data"><%=formatter.format(product.getProductPrice())%></td>
	                        <td class="data"><%=product.getGiam_Gia()%> %</td>
	                        
	                        
	                        <td class="data"><img width="85" height="100" class="hinhql" src="/dienthoai/imagesphone/<%=product.getProductImage()%>"/></td>
	                        <td class="data"><img width="85" height="100" style="padding: center"; class="hinhql" src="/dienthoai/imagesphone/<%=product.getProductImagenext()%>"/></td>
	                       
	                        <td class="data"><a href="/dienthoai/admin/product_description.jsp?product_id=<%=product.getProductID()%>">Xem chi tiết</a></td>
							
	                    </td>
	                    </tr>
	                    <% }%>
	                </table>
	                </div>
	            </div>
	            
	            


	            <div class="clear"></div>
			<div class="phantrang">   
	    <%                
	        int back = 0;
	        if (pages == 0 || pages == 1) {
	            back = 1;
	        } else {
	            back = pages - 1;
	        }
	    %>
	    <a class="back" href="/dienthoai/admin/manager_tc.jsp?pages=<%=back%>&&tc=12"><i class='far fa-arrow-alt-circle-left'></i></a>
	                <%
	                    
	                    int loop = 0, num = 0;
	                    if ((total / 10) % 2 == 0) {
	                        num = total / 10;
	                    } else {
	                        num = (total + 1) / 10;
	                    }
	                   
	                    if (total % 2 != 0) {
	                        loop = (total / 10) + 1;

	                    } else {
	                       
	                        if (total < (num * 10) + 10 && total != num * 10) {
	                            loop = (total / 10) + 1;
	                        } else {
	                           
	                            loop = (total / 10);
	                        }
	                    }
	                   
	                    for (int i = 1; i <= loop; i++) {%>
	                <% if (pages == i) {%> 

	    <a href="/dienthoai/admin/manager_tc.jsp?pages=<%=i%>&&tc=12"><%=i%></a>
	                <%} else {%>
	    <a href="/dienthoai/admin/manager_tc.jsp?pages=<%=i%>&&tc=12"><%=i%></a> 

	        <%}
	             }%>
	        <%
	            
	            int next = 0;
	           
	            if (total % 2 != 0) {
	                if (pages == (total / 10) + 1) {
	                    next = pages;
	                } else {
	                    next = pages + 1;
	                }
	            } else {
	                
	                if (total < (num * 10) + 10 && total != num * 10) {
	                    if (pages == (total / 10) + 1) {
	                        next = pages;
	                    } else {
	                        next = pages + 1;
	                    }
	                } else {
	                    
	                    if (pages == (total / 10)) {
	                        next = pages;
	                    } else {
	                        next = pages + 1;
	                    }
	                }
	            }
	        %>
	    <a class="next" href="/dienthoai/admin/manager_tc.jsp?pages=<%=next%>&&tc=12"><i class='far fa-arrow-alt-circle-right'></i></a>
	</div>
		  <%
	   }
   else  if(category_ID1==9){
	   
		  %>
		     <div class="table-container">
	                    <table id="table-one" class="table-one" style="width: 100%">
	                        <tr class="data">
	                            <th class="data" width="30px">STT</th>
	                            <!--  <th class="data">Mã sản phẩm</th> -->
	                            <th class="data">Tên mặt hàng</th>
	                            <th class="data">Tên sản phẩm</th>
	                            <th class="data">Thương hiệu</th>
	                            <th class="data">Giá</th>
	                            <th class="data">Giam Gia</th>           
								<th class="data" width="100px">Hình đại diện</th>
	                            <th class="data" width="100px">Hình sau</th>
	                            <th class="data">Mô tả</th>
	                        </tr>
	                    <%
	                    CategoryGet categoryGet14 = new CategoryGet();
	                    BrandGet brandGet = new BrandGet();
	                    ProductGet productGet1411 = new ProductGet();
	        DecimalFormat formatter = new DecimalFormat("###,###,###");
	                    
	                      
	      
	                    %>
	                    <%
	                    ProductGet productGet=new ProductGet();
	    int first = 0, last = 0, pages = 1;
	    
	    if (request.getParameter("pages") != null) {
	        pages = (int) Integer.parseInt(request.getParameter("pages"));
	    }
	    
	    
	    
	    
	  int total= productGet.countproduct_tc(9);
	    if (total <= 10) {
	        first = 0; 
	        last = total; 
	    } else {
	        first = (pages - 1) * 10;
	        last = 10;
	    }
	    
	   
	    int count=0;
	    for (Product product : productGet.getListProduct_a_b_tc(9, first, last)) {
	    	count++;
	%>
	                    <tr class="data">
	                        <td class="data" width="30px"><%=count%></td>
	                       <!--  <td class="data"><%=product.getProductID()%></td> -->
	                        <td class="data"><%=categoryGet14.getCategory(product.getCategoryID()).getCategoryName()%></td>
	                        <td class="data"><%=product.getProductName()%></td>
	                        <td class="data"><%=brandGet.getBrand(product.getBrandID()).getBrandName()%></td>
	                        <td class="data"><%=formatter.format(product.getProductPrice())%></td>
	                        <td class="data"><%=product.getGiam_Gia()%> %</td>
	                        
	                        
	                        <td class="data"><img width="85" height="100" class="hinhql" src="/dienthoai/imagesphone/<%=product.getProductImage()%>"/></td>
	                        <td class="data"><img width="85" height="100" style="padding: center"; class="hinhql" src="/dienthoai/imagesphone/<%=product.getProductImagenext()%>"/></td>
	                       
	                        <td class="data"><a href="/dienthoai/admin/product_description.jsp?product_id=<%=product.getProductID()%>">Xem chi tiết</a></td>
							
	                    </td>
	                    </tr>
	                    <% }%>
	                </table>
	                </div>
	            </div>
	            
	            


	            <div class="clear"></div>
			<div class="phantrang">   
	    <%                
	        int back = 0;
	        if (pages == 0 || pages == 1) {
	            back = 1;
	        } else {
	            back = pages - 1;
	        }
	    %>
	    <a class="back" href="/dienthoai/admin/manager_tc.jsp?pages=<%=back%>&&tc=9"><i class='far fa-arrow-alt-circle-left'></i></a>
	                <%
	                    
	                    int loop = 0, num = 0;
	                    if ((total / 10) % 2 == 0) {
	                        num = total / 10;
	                    } else {
	                        num = (total + 1) / 10;
	                    }
	                   
	                    if (total % 2 != 0) {
	                        loop = (total / 10) + 1;

	                    } else {
	                       
	                        if (total < (num * 10) + 10 && total != num * 10) {
	                            loop = (total / 10) + 1;
	                        } else {
	                           
	                            loop = (total / 10);
	                        }
	                    }
	                   
	                    for (int i = 1; i <= loop; i++) {%>
	                <% if (pages == i) {%> 

	    <a href="/dienthoai/admin/manager_tc.jsp?pages=<%=i%>&&tc=9"><%=i%></a>
	                <%} else {%>
	    <a href="/dienthoai/admin/manager_tc.jsp?pages=<%=i%>&&tc=9"><%=i%></a> 

	        <%}
	             }%>
	        <%
	            
	            int next = 0;
	           
	            if (total % 2 != 0) {
	                if (pages == (total / 10) + 1) {
	                    next = pages;
	                } else {
	                    next = pages + 1;
	                }
	            } else {
	                
	                if (total < (num * 10) + 10 && total != num * 10) {
	                    if (pages == (total / 10) + 1) {
	                        next = pages;
	                    } else {
	                        next = pages + 1;
	                    }
	                } else {
	                    
	                    if (pages == (total / 10)) {
	                        next = pages;
	                    } else {
	                        next = pages + 1;
	                    }
	                }
	            }
	        %>
	    <a class="next" href="/dienthoai/admin/manager_tc.jsp?pages=<%=next%>&&tc=9"><i class='far fa-arrow-alt-circle-right'></i></a>
	</div>
		  <%
	   }
	%>
	
                  
            <jsp:include page="footer1.jsp"></jsp:include>

       

    </body>
</html>
<!-- -->
 <!-- <td class="data"></td>
                         -->
