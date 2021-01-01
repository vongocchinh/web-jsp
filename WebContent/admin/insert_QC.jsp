

<%@page import="get.admin.mucQCGet"%>
<%@page import="model.admin.mucQC"%>
<%@page import="get.admin.ProductGet"%>
<%@page import="model.admin.Product"%>
<%@page import="get.admin.sliderGet"%>
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
       sliderGet sliderGet=new sliderGet();
       ProductGet productGet=new ProductGet();
            String error = "";
            if(request.getParameter("error")!=null){
                error = (String) request.getParameter("error");
            }
      
        
        %>
        <jsp:include page="header1.jsp"></jsp:include>

             <div class="container-right-insert">
        <div class="container-insert">
                    <form method="post" action="${root}/insertQC" enctype="multipart/form-data">
                
                   <table class="table-insert"> 
                    <tr>
                           
                        </tr>
                        <tr><td width="125px"><b></b></td><td><input type="hidden" class="sedang" name="qc_id"><%=error%></td></tr> 
                    
                        
                                <div><tr><td><b class="name-insert">Tên San Pham</b></td><td>
                                <div>
                                <span></span>
                                <select name="product_id" class="sedang">
                                   <%
           for (Product b : productGet.getListProduct()) {
            %>
                                    <option value="<%=b.getProductID()%>"><%=b.getProductName()%></option>
                                    <% } %>
                                        
                                </select>
                                
                                
				</div>
                                <input type="hidden" class="sedang" name=""><%=error%></td></tr>
                                
                                
                       <div><tr><td><b class="name-insert">Tên Muc</b></td><td>
                                <div>
                                <span></span>
                                <select name="muc_id" class="sedang">
                                   <%
                                   mucQCGet mucQCGet=new mucQCGet();
           for (mucQC b : mucQCGet.getmucQC()) {
            %>
                                    <option value="<%=b.getMuc_id()%>"><%=b.getMuc_Name()%></option>
                                    <% } %>
                                        
                                </select>
                                
                                
				</div>
                                <input type="hidden" class="sedang" name=""><%=error%></td></tr>
                        
                                
				
                                
                        <tr><td><b class="name-insert">Hình QC</b></td><td><input class="sedang" type="file" placeholder="tênhình.jpg||tenhinh.png" class="sedang" name="images_qc"><%=error%></td></tr>
                        
                         <tr><td></td><td>
                                       
                                <input type="hidden" name="command" value="insert">        
                                <input type="submit" class="button-insert"  value="Lưu dữ liệu">
                                <input type="reset" class="button-insert" value="Phục hồi">
                                
                            </td></tr>
                    </table>
                </form>
                 </div>
                </div>
                <div class="clear"></div>

            <jsp:include page="footer1.jsp"></jsp:include>

       


    </body>
</html>
<!-- <tr><td><b>Man Hinh</b></td><td><input type="text"  placeholder="" name="man_Hinh"><%=error%></td></tr>
                         <tr><td><b>Camera_Sau</b></td><td><input type="text"  placeholder="" name="camera_Sau"><%=error%></td></tr>
                         <tr><td><b>Camear_Truoc</b></td><td><input type="text"  placeholder="" name="camera_Truoc"><%=error%></td></tr>
                         <tr><td><b>He Dieu Hanh</b></td><td><input type="text"  placeholder="" name="he_Dieu_Hanh"><%=error%></td></tr>
                         <tr><td><b>Cpu</b></td><td><input type="text"  placeholder="" name="cpu"><%=error%></td></tr>
                         <tr><td><b>Bo Nho</b></td><td><input type="text"  placeholder="" name="bo_Nho"><%=error%></td></tr>
                         <tr><td><b>Ram</b></td><td><input type="text"  placeholder="" name="ram"><%=error%></td></tr>
                         <tr><td><b>Ket Noi</b></td><td><input type="text"  placeholder="" name="ket_Noi"><%=error%></td></tr>
                         <tr><td><b>Pin Sac</b></td><td><input type="text"  placeholder="" name="pin_Sac"><%=error%></td></tr>
                         <tr><td><b>Bao Hanh</b></td><td><input type="text"  placeholder="" name="bao_Hanh"><%=error%></td></tr>
                         -->