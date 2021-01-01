<%@page import="get.admin.BrandGet"%>
<%@page import="model.admin.Brand"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.admin.Product"%>
<%@page import="get.admin.ProductGet"%>
<%@page import="model.admin.Category"%>
<%@page import="get.admin.CategoryGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <link href="css_main.css" rel="stylesheet">
    <link href="css_main1.css" rel="stylesheet">
     <script src="../ckeditor/ckeditor.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật sản phẩm</title>
 <c:set var="root" value="${pageContext.request.contextPath}"/>
     
        <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
         <link href="${root}/admin/css_body.css" rel='stylesheet' type='text/css'>
<link rel="icon" type="image/png" href="${root}/admin/imagesAdmin/favicon.ico"/>
    </head>
    <body class="body1">
    <%
           
            
            String productID = "";
            String error = "";
            if(request.getParameter("error")!=null){
                error = (String) request.getParameter("error");
            }
            Product product = new ProductGet().getProduct(Integer.parseInt(request.getParameter("product_id")));
           
        %>

        <jsp:include page="header1.jsp"></jsp:include>
<div class="container-right-insert">
        <div class="container-insert">
            
                    <form action="${root}/ManagerProductServlet" method="post">
                     <table class="table-insert">
                         <tr><td width="125px"><b class="name-insert">Mã sản phẩm</b></td>
                             <td><input type="hidden" class="sedang" name="maSanPham" value="<%=product.getProductID()%>"><%=error%></td>
                    </tr>
                         <tr><td width="125px"><b class="name-insert">Tên sản phẩm</b></td>
                             <td><input type="text" class="sedang" name="tenSanPham" value="<%=product.getProductName()%>"><%=error%></td>
                    </tr>
<!--                         <tr><td><b>Mã loại</b></td><td><input type="text" class="sedang" name="maloai" value="<%=product.getCategoryID()%>">
 -->                                
                            </td><%=error%></tr>
                        
                         <tr><td><b class="name-insert">Mã Loai</b></td><td>
                               <select name="maloai" class="sedang">
                               
                                   <%
                                   CategoryGet c=new CategoryGet();
           for (Category bcc : c.getListCategory()) {
            %>		
                                    <option value="<%=bcc.getCategoryID()%>"><%=bcc.getCategoryName()%></option>
                                    <% } %>
                                        
                                </select>
                        </td></tr>
                        
                       <!--  <tr><td><b>Mã thương hiệu</b></td><td><input type="text" class="sedang" name="" value="<%=product.getBrandID()%>"></td></tr> -->
                        <tr><td><b class="name-insert">Mã thương hiệu</b></td><td>
                               <select name="mathuonghieu" class="sedang">
                               
                                   <%
                                   BrandGet brandget=new BrandGet();
           for (Brand b : brandget.getListBrand()) {
            %>		
                                    <option value="<%=b.getBrandID()%>"><%=b.getBrandName()%></option>
                                    <% } %>
                                        
                                </select>
                        </td></tr>
                          
                          <tr><td><b class="name-insert">Hình đại diện</b></td><td><input type="text" class="sedang" name="hinhdaidien" value="<%=product.getProductImage()%>"><%=error%></td></tr>
                       				 <tr><td><b class="name-insert">Hình Sau</b></td><td><input type="text" class="sedang" name="hinhmatsau" value="<%=product.getProductImagenext()%>"><%=error%></td></tr>
              						  <tr><td><b class="name-insert">Giá sản phẩm</b></td><td><input type="text" class="sedang" name="gia" value="<%=product.getProductPrice()%>"><%=error%><b> VNĐ</b></td></tr>
                        			  <tr><td><b class="name-insert">Giam Gia</b></td><td><input type="text" class="sedang" name="giam_Gia" value="<%=product.getGiam_Gia()%>"></td></tr>
                        			   <tr><td><b class="name-insert">Mô tả chi tiết</b></td><td><textarea name="mota" id="editor1" rows="10" cols="80"><%=product.getProductDescription()%></textarea>
										        <script>
										            CKEDITOR.replace('editor1');
										        </script></td></tr>
						<tr><td><b class="name-insert">Camera_sau</b></td><td><input type="text" class="sedang" name="camera_Sau" value="<%=product.getCamera_Sau()%>"></td></tr>
						 <tr><td><b class="name-insert">Camera_Truoc</b></td><td><input type="text" class="sedang" name="camera_Truoc" value="<%=product.getCamera_Truoc()%>"></td></tr>
						  <tr><td><b class="name-insert">He dieu Hanh</b></td><td><input type="text" class="sedang" name="he_Dieu_Hanh" value="<%=product.getHe_Dieu_Hanh()%>"></td></tr>
						    <tr><td><b class="name-insert">Bo Nho </b></td><td><input type="text" class="sedang" name="bo_Nho" value="<%=product.getBo_Nho()%>"></td></tr>
						     <tr><td><b class="name-insert">Ram</b></td><td><input type="text" class="sedang" name="ram" value="<%=product.getRam()%>"></td></tr>
						     
                        <tr><td></td><td>
                                <input type="hidden" name="command" value="update">
                                <input type="hidden" name="product_id" value="<%=request.getParameter("product_id")%>">
                                <input type="submit"  class="button-insert" value="Lưu dữ liệu">
                            </td>
                        </tr>
                       
                    </table>
                    </form>
                </div>
                </div>
                
                <div class="clear"></div>

            <jsp:include page="footer1.jsp"></jsp:include>

       


    </body>
</html>
