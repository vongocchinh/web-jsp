<!DOCTYPE  html>
<%@page import="get.admin.CategoryGet"%>
<%@page import="get.admin.BrandGet"%>
<%@page import="model.admin.Brand"%>
<%@page import="model.admin.Category"%>
<%@page import="model.admin.chucvu"%>
<%@page import="get.admin.chucvuGet"%>
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
 <script src="../ckeditor/ckeditor.js"></script>
<c:set var="root" value="${pageContext.request.contextPath}" />
	  <script src="${pageContext.request.contextPath}/admin_QL/js/show-detail.js "></script>
    
    <link href="${root}/admin_QL/css/style1.css" rel="stylesheet">
     <link href="${root}/admin_QL/css/product1.css" rel="stylesheet">
	
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





	UserGet userGet=new UserGet();
	
	
%>
<body>
    <jsp:include page="header.jsp"></jsp:include>

	  <%ProductGet productGettong=new ProductGet(); %>
	    <%BillGet billGettong=new BillGet(); %>
	      <%
                    ReviewGet reviewGet=new ReviewGet();
	    
                    %>
                    <%
            
       
		
	 if (session.getAttribute("userad") != null) {
		 useradmin1=(userAdmin) session.getAttribute("userad");
		 userAdmin2=userAdminGet.getUser(useradmin1.getId());
        
     }
	
	 if(userAdmin2.isRoleAdmin()==false){
		 response.sendRedirect("/dienthoai_QL/admin/erro.jsp");
	 }
       
            String error = "";
            if(request.getParameter("error")!=null){
                error = (String) request.getParameter("error");
            }
            BrandGet brandget=new BrandGet();
            CategoryGet categoryget=new  CategoryGet();
        %>
    <div class="container-right-index2-left ">
        <div class="main-right">
            <h3>Dashdoard</h3>
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="container-right-insert">
                            <div class="container-insert">
                                <form method="post" action="${root}/InsertProductServletx" enctype="multipart/form-data">

                                    <table class="table-insert">
                                        <tr>

                                        </tr>
                                        <tr>
                                            <td width="125px"><b></b></td>
                                            <td><input type="hidden" class="form-control" name="maSanPham">
                                                <%=error%>
                                            </td>
                                        </tr>


                                        <div>
                                            <tr>
                                                <td><b class="name-insert">Thương hiệu</b></td>
                                                <td>
                                                    <div>
                                                        <span></span>
                                                        <select name="mathuonghieux" class="form-control">
                                                       <%
                               for (Brand b : brandget.getListBrand()) {
                                %>
                                                        <option value="<%=b.getBrandID()%>"><%=b.getBrandName()%></option>
                                                        <% } %>
                                                            
                                                    </select>
                                                        <tr>
                                                            <td><b class="name-insert">Tên danh mục</b></td>
                                                            <td>
                                                                <span></span>
                                                                <select name="maloaix" class="form-control">
                                                       <%
                               for (Category c : categoryget.getListCategory()) {
                                %>
                                                        <option value="<%=c.getCategoryID()%>"><%=c.getCategoryName()%></option>
                                                        <% } %>
                                                            
                                                    </select>
                                                    </div>
                                                    <input type="hidden" class="form-control" name="">
                                                    <%=error%>
                                                        </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="125px"><b class="name-insert">Tên sản phẩm</b></td>
                                                            <td><input type="text" class="form-control" name="tenSanPhamx">
                                                                <%=error%>
                                                            </td>
                                                        </tr>


                                        </div>
                                        <input type="hidden" class="form-control" name="">
                                        <%=error%>
                                            </td>
                                            </tr>

                                            <tr>
                                                <td><b class="name-insert">Hình đại diện</b></td>
                                                <td><input type="file" placeholder="tênhình.jpg||tenhinh.png" class="form-control" name="hinhdaidienx">
                                                    <%=error%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b class="name-insert"> Hình Sau</b></td>
                                                <td><input type="file" placeholder="tênhình.jpg||tenhinh.png" class="form-control" name="hinhmatsaux">
                                                    <%=error%>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b class="name-insert">Giá sản phẩm</b></td>
                                                <td><input type="text" class="form-control" name="giax">
                                                    <%=error%><b> VNĐ</b></td>
                                            </tr>

                                            <!--  <tr><td><b class="name-insert">Mô tả chi tiết</b></td><td><textarea type="text" class="form-control"  placeholder="" name="motax"><%=error%></textarea></td></tr>  -->

                                            <tr>
                                                <td><b class="name-insert">Mô tả chi tiết</b></td>
                                                <td><textarea name="motax" id="editor1" rows="10" cols="80">
                                            </textarea>
                                                    <script>
                                                        CKEDITOR.replace('editor1');
                                                    </script>
                                                </td>
                                            </tr>


                                            <tr>
                                                <td><b class="name-insert">Giam Gia</b></td>
                                                <td><input type="text" class="form-control" placeholder="" name="giam_Giax">
                                                    <%=error%>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b class="name-insert">Camera_sau</b></td>
                                                <td><input type="text" class="form-control" name="camera_Sau"></td>
                                            </tr>
                                            <tr>
                                                <td><b class="name-insert">Camera_Truoc</b></td>
                                                <td><input type="text" class="form-control" name="camera_Truoc"></td>
                                            </tr>
                                            <tr>
                                                <td><b class="name-insert">He dieu Hanh</b></td>
                                                <td><input type="text" class="form-control" name="he_Dieu_Hanh"></td>
                                            </tr>
                                            <tr>
                                                <td><b class="name-insert">Bo Nho </b></td>
                                                <td><input type="text" class="form-control" name="bo_Nho"></td>
                                            </tr>
                                            <tr>
                                                <td><b class="name-insert">Ram</b></td>
                                                <td><input type="text" class="form-control" name="ram"></td>
                                            </tr>


                                            <tr>
                                                <td></td>
                                                <td>

                                                    <input type="hidden" name="command" value="insert">
                                                    <input type="submit" class="btn btn-outline-primary" value="Lưu dữ liệu">
                                                    <input type="reset" class="btn btn-outline-secondary" value="Phục hồi">

                                                </td>
                                            </tr>
                                    </table>
                                </form>



                                <hr>

                                <form method="post" action="${root}/upload" enctype="multipart/form-data">
                                    <table width="95%">
                                        <tr>
                                            <td><b>Upload hình ảnh sản phẩm</b></td>
                                            <td><input type="file" class="btn btn-outline-info" name="uploadFile"></td>
                                        </tr>
                                        </br>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <input type="file" class="btn btn-outline-info" name="uploadFile"></td>
                                        </tr>
                                        </br>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <input type="submit" class="btn btn-outline-danger" value="Tải lên" />
                                            </td>
                                        </tr>
                                    </table>
                                </form>

                            </div>
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
    <script type="text/javascript">
    $(document).ready(function() {
    	$('.mdb-select').materialSelect();
    	});
    </script>
</body>

</html>