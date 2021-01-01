<%@page import="get.admin.mucQCGet"%>
<%@page import="model.admin.QC"%>
<%@page import="get.admin.QCGet"%>
<%@page import="get.admin.ProductGet"%>
<%@page import="model.admin.slider"%>
<%@page import="get.admin.sliderGet"%>
<%@page import="model.admin.userAdmin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.admin.Category"%>
<%@page import="get.admin.CategoryGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
 <link href="css_main.css" rel="stylesheet">
    <link href="css_main1.css" rel="stylesheet">
   <c:set var="root" value="${pageContext.request.contextPath}"/>
   
          <link href="${root}/css/chinh.css" rel='stylesheet' type='text/css' />
          <link href="${root}/admin/css_body.css" rel='stylesheet' type='text/css'>
         <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
        
    
   
      
    <style type="text/css">
    td.data {
	color:  black;
}
		table.data {
	color: black;
}
		th.data {
	color: green;
}
    </style>
    <c:set var="root" value="${pageContext.request.contextPath}"/>
    <link rel="icon" type="image/png" href="${root}/admin/imagesAdmin/favicon.ico"/>
    <title>QUẢN LÝ DANH MỤC-CATEGORY</title>
</head>
<body class="body1">
        
        <jsp:include page="header1.jsp"></jsp:include>

            <div class="container-right">

                    
					 
                     <div class="table-container">

                   
                    
                   
                    <table id="table-one" class="table-one">

                   
                    
                        <tr >
                            <th  width="30px">STT</th>
                            <th width="40px" >Mã muc QC</th>
                            <th width="40px">Tên san pham</th>
                            <th width="40px">Tên mục</th>
                            <th width="60px" >Anh mục</th>
                            <th  width="90px">Tùy chọn</th>
                        </tr>
                       <%
                       
                   
       QCGet qcGet=new QCGet();
        ArrayList<QC> listCategory = qcGet.getQC();
        ProductGet productGet=new ProductGet();
        mucQCGet mucQCGet=new mucQCGet();
        %>
         <% 
                          int count =0;
                          for(QC sl : listCategory){
                              count++;
                          
                            %>
                        <tr >
                            <td  width="30px"><%=count%></td>
                            <td ><%=sl.getQC_id()%></td>
                            <td ><%=productGet.getProduct(sl.getProduct_id()).getProductName()%></td>
                            <td ><%=mucQCGet.getmucQc(sl.getMucQC()).getMuc_Name()%></td>
                            <td ><img width="70%" height="100" class="hinhql" src="/dienthoai/imagesphone/<%=sl.getImages_QC()%>"/></td>

                            
                            <td  width="90px">
                      <center>
                           
                            <a href="/dienthoai/QCServlet?command=delete&qc_id=<%=sl.getQC_id()%>">Xóa</a>
                      </center> 
                        </td>
                        </tr>
                        <% } %>
                    </table>
                    </div>
                    
                </div>
                <div class="clear"></div>

            <jsp:include page="footer1.jsp"></jsp:include>

    </body>
</html>
