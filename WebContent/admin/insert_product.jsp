

<%@page import="model.admin.userAdmin"%>
<%@page import="get.admin.BrandGet"%>
<%@page import="model.admin.Brand"%>
<%@page import="java.util.ArrayList"%>
<%@page import="get.admin.CategoryGet"%>
<%@page import="model.admin.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <link href="css_main.css" rel="stylesheet">
    <link href="css_main1.css" rel="stylesheet">
    <script src="../ckeditor/ckeditor.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm sản phẩm</title>
 <c:set var="root" value="${pageContext.request.contextPath}"/>
       <!--  <c:set var="root" value="${pageContext.request.contextPath}"/> -->
        <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
         <link href="${root}/admin/css_body.css" rel='stylesheet' type='text/css'>
<link rel="icon" type="image/png" href="${root}/admin/imagesAdmin/favicon.ico"/>
    </head>
    <body class="body1">
<% 
            
           
       
        CategoryGet categoryget = new CategoryGet();
        BrandGet brandget = new BrandGet();
       
            String error = "";
            if(request.getParameter("error")!=null){
                error = (String) request.getParameter("error");
            }
      
        
        %>
        <jsp:include page="header1.jsp"></jsp:include>

             <div class="container-right-insert">
        <div class="container-insert">
                    <form method="post" action="${root}/InsertProductServletx" enctype="multipart/form-data">
                
                   <table class="table-insert">
                   <tr>
                           
                        </tr>
                        <tr><td width="125px"><b></b></td><td><input type="hidden" class="sedang" name="maSanPham"><%=error%></td></tr> 
                    
                        
                                <div><tr><td><b class="name-insert">Thương hiệu</b></td><td>
                                <div>
                                <span></span>
                                <select name="mathuonghieux" class="sedang">
                                   <%
           for (Brand b : brandget.getListBrand()) {
            %>
                                    <option value="<%=b.getBrandID()%>"><%=b.getBrandName()%></option>
                                    <% } %>
                                        
                                </select>
                                <tr><td><b class="name-insert">Tên danh mục</b></td><td>
                                <span></span>
                                <select name="maloaix" class="sedang">
                                   <%
           for (Category c : categoryget.getListCategory()) {
            %>
                                    <option value="<%=c.getCategoryID()%>"><%=c.getCategoryName()%></option>
                                    <% } %>
                                        
                                </select>
				</div>
                                <input type="hidden" class="sedang" name=""><%=error%></td></tr>
                        <tr><td width="125px"><b class="name-insert">Tên sản phẩm</b></td><td><input type="text" class="sedang" name="tenSanPhamx"><%=error%></td></tr>
                        
                                
				</div>
                                <input type="hidden" class="sedang" name=""><%=error%></td></tr>
                                
                        <tr><td><b class="name-insert">Hình đại diện</b></td><td><input type="file" placeholder="tênhình.jpg||tenhinh.png" class="sedang" name="hinhdaidienx"><%=error%></td></tr>
                        <tr><td><b class="name-insert"> Hình Sau</b></td><td><input type="file" placeholder="tênhình.jpg||tenhinh.png" class="sedang" name="hinhmatsaux"><%=error%></td></tr>
                      
                        <tr><td><b class="name-insert">Giá sản phẩm</b></td><td><input type="text" class="sedang" name="giax"><%=error%><b> VNĐ</b></td></tr>
                       
                       <!--  <tr><td><b class="name-insert">Mô tả chi tiết</b></td><td><textarea type="text" class="sedang"  placeholder="" name="motax"><%=error%></textarea></td></tr>  -->
                       
                       <tr><td><b class="name-insert">Mô tả chi tiết</b></td><td><textarea name="motax" id="editor1" rows="10" cols="80">
                        </textarea>
									        <script>
									            CKEDITOR.replace('editor1');
									        </script></td></tr>
                        
                        
                         <tr><td><b class="name-insert">Giam Gia</b></td><td><input type="text" class="sedang"  placeholder="" name="giam_Giax"><%=error%></td></tr>
                         
						<tr><td><b class="name-insert">Camera_sau</b></td><td><input type="text" class="sedang" name="camera_Sau" ></td></tr>
						 <tr><td><b class="name-insert">Camera_Truoc</b></td><td><input type="text" class="sedang" name="camera_Truoc" ></td></tr>
						  <tr><td><b class="name-insert">He dieu Hanh</b></td><td><input type="text" class="sedang" name="he_Dieu_Hanh" ></td></tr>
						  <tr><td><b class="name-insert">Bo Nho </b></td><td><input type="text" class="sedang" name="bo_Nho" ></td></tr>
						   <tr><td><b class="name-insert">Ram</b></td><td><input type="text" class="sedang" name="ram" ></td></tr>
   
                         
                         <tr><td></td><td>
                                       
                                <input type="hidden" name="command" value="insert">        
                                <input type="submit" class="button-insert" value="Lưu dữ liệu">
                                <input type="reset" class="button-insert" value="Phục hồi">
                                
                            </td></tr>
                    </table>
                </form>
                               
                               
                               
                           <hr>    
                               
                        <form method="post" action="${root}/upload" enctype="multipart/form-data">
                                    <table width="95%">
                                        <tr><td><b>Upload hình ảnh sản phẩm</b></td><td><input type="file" class="panjang" name="uploadFile"></td></tr></br>
                        <tr><td></td><td>
                        <input type="file" class="panjang" name="uploadFile"></td></tr></br>
                        <tr><td></td><td>
                        <input type="submit" class="button-insert" value="Tải lên" />
                        </td></tr>
                                    </table>
                                </form>      
                               
                               </div>
                </div>
                <div class="clear"></div>

            <jsp:include page="footer1.jsp"></jsp:include>

       


    </body>
</html>
