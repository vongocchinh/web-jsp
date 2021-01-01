<%@page import="model.admin.userAdmin"%>
    <%@page import="model.admin.Product"%>
        <%@page import="get.admin.ProductGet"%>
            <%@page contentType="text/html" pageEncoding="UTF-8"%>
                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                     <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
                        <link href="css_main.css" rel="stylesheet">
                        <link href="css_main1.css" rel="stylesheet">
                         <link href="css_main3.css" rel="stylesheet">
                        <c:set var="root" value="${pageContext.request.contextPath}" />
                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        <title>Xem Chi Tiết Sản Phẩm</title>
                 <link href="${root}/admin/css_body.css" rel='stylesheet' type='text/css'>
                        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
                        <link rel="icon" type="image/png" href="${root}/admin/imagesAdmin/favicon.ico" />
                        <style type="text/css">
.table-bottom {
	background-color: white;
	width: auto;
	padding: 10px 10px;
	margin-top: 20px;
}
.table-one{
border-collapse: collapse;
width: 100%
}
.table-one tr th,.table-one tr td{
border: 1px solid black;
padding: 10px 10px;
}
  .table-one .mota1{
	width: 100%;
	height: auto;
 }
                        </style>
                    </head>

                    <body class="body1">
                        <%
            
           
       
            ProductGet productGet = new ProductGet();
            Product product = new Product();
            String productID = "";
            if (request.getParameter("product_id") != null) {
          productID = request.getParameter("product_id");
          product = productGet.getProduct(Integer.parseInt(productID));
     }
        %>

             <jsp:include page="header1.jsp"></jsp:include>

             <div class="container-right">
                 <a style="padding: 10px 10px;background-color: white;color: black;border-radius: 5px;font-size: 14px" href="${root}/admin/manager_product.jsp">Quay Lại Trang Quản Lý Sản Phẩm</a>
                 <div class="table-container">
                    
                     <form action="/dienthoai/ManagerProductServlet" method="post">
                         <div class="table-bottom">
                         <table class="table-one">
                             <tr>
                                 <th>Tên sản phẩm</th>
                                  <th class="mota1">Mô tả</th>
                             </tr>
                             <tr>
                             <td><%=product.getProductName()%></td>
                             <td><%=product.getProductDescription()%> </td>
                             </tr>
                             

                         </table>
                         </div>
                     </form>
                 </div>
                 <div class="table-bottom">
                     <table class="table-one">
                         <tr class="data">
                             <th class="data">Camera Sau</th>
                             <th class="data">Camera Truoc</th>
                             <th class="data">He Dieu Hanh</th>
                             <th class="data">Bo Nho</th>
                             <th class="data">Ram</th>
                             <th class="" width="105px">Tùy chọn</th>
                         </tr>
                         <tr class="data">
                             <td class="data">
                                 <%=product.getCamera_Sau() %>
                             </td>
                             <td class="data">
                                 <%=product.getCamera_Truoc() %>
                             </td>

                             <td class="data">
                                 <%=product.getHe_Dieu_Hanh() %>
                             </td>

                             <td class="data">
                                 <%=product.getBo_Nho() %>
                             </td>
                             <td class="data">
                                 <%=product.getRam() %>
                             </td>


                             <td class="" width="105px">
                                 <center>
                                     <a href="${root}/admin/update_product.jsp?command=update&product_id=<%=product.getProductID()%>">Sửa</a>&nbsp;| &nbsp;
                                     <a href="/dienthoai/ManagerProductServlet?command=delete&product_id=<%=product.getProductID()%>">Xóa</a>
                                 </center>
                         </tr>
                     </table>
                 </div>
             </div>
             <div class="clear"></div>

             <jsp:include page="footer1.jsp"></jsp:include>

             </div>
         </body>

         </html>
