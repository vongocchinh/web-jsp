
<%@page import="model.admin.Product"%>
<%@page import="get.admin.sliderGet"%>
<%@page import="model.admin.slider"%>
<%@page import="model.admin.Category"%>
<%@page import="get.admin.CategoryGet"%>
<%@page import="get.admin.ProductGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <link href="css_main.css" rel="stylesheet">
    <link href="css_main1.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật danh mục</title>
 <c:set var="root" value="${pageContext.request.contextPath}"/>
      <!--   <c:set var="root" value="${pageContext.request.contextPath}"/> -->
         <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
          <link href="${root}/admin/css_body.css" rel='stylesheet' type='text/css'>
<link rel="icon" type="image/png" href="${root}/admin/imagesAdmin/favicon.ico"/>
    </head>
    <body class="body1">
        
        <%
            String error = "";
            if(request.getParameter("error")!=null){
                error = (String) request.getParameter("error");
            }
            slider slider = new sliderGet().getSlider(Integer.parseInt(request.getParameter("slider_id")));
           
            sliderGet sliderGet = new sliderGet();
            
        %>

        <jsp:include page="header1.jsp"></jsp:include>

           <div class="container-right-insert">
        <div class="container-insert">
                    <form action="${root}/sliderServlet" method="post"  >
                    <table class="table-insert"> 
                        <tr>
                            <td ><b class="name-insert">Mã slider:</b></td>
                            <td><input type="hidden" class="sedang" name="slider_ma" value="<%=slider.getSlider_id()%>"><%=error%></td>
                        </tr>
                        <tr>
                            <td ><b  class="name-insert">Tên slider:</b></td>
                            <td><input type="text" class="sedang" name="slider_name" value="<%=slider.getSlider_name()%>"><%=error%></td>
                        </tr>
                        <tr><td><b class="name-insert">Ten San Pham</b></td><td>
                               <select name="product_id" class="sedang" >
                               
                                   <%
                                   ProductGet c=new ProductGet();
           for (Product bcc : c.getListProduct()) {
            %>		
                                    <option value="<%=bcc.getProductID()%>"><%=bcc.getProductName()%></option>
                                    <% } %>
                                        
                                </select>
                        </td></tr>
                        <tr>
                            <td ><b class="name-insert">Anh Slider:</b></td>
                            <td><input type="text" class="sedang" name="slider_images" value="<%=slider.getImages_slider()%>"><%=error%></td>
                        </tr>
                        <tr><td></td><td>
                                <input type="hidden" name="command" value="update">
                                <input type="hidden" name="slider_id" value="<%=request.getParameter("slider_id")%>">
                                <input type="submit" class="button-insert" value="Lưu dữ liệu">
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
