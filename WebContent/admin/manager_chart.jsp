
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="get.admin.ProductGet"%>
<%@page import="model.admin.userAdmin"%>
<%@page import="model.admin.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="get.admin.CategoryGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <link href="css_main.css" rel="stylesheet">
    <link href="css_main1.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biểu đồ, thống kê</title>
 <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
  <link href="${root}/admin/css_body.css" rel='stylesheet' type='text/css'>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
       
<link rel="icon" type="image/png" href="${root}/admin/imagesAdmin/favicon.ico"/>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
        	<%
        	ProductGet productGet=new ProductGet();
        	Date date=new Date();
        	
        	%>
          ['Date', 'Sản Phẩm', 'Iphone','Samsung','Oppo','Redmi'],
          [<%=date.getMonth()%>,  <%=productGet.countproduct()%>, <%=productGet.coutBrand(1)%>,<%=productGet.coutBrand(2)%>
          ,<%=productGet.coutBrand(3)%>,<%=productGet.coutBrand(12)%>],
         
        ]);

        var options = {
          title : 'Thống kê Sản Phẩm Cửa Hàng',
          vAxis: {title: '1/Đơn vị'},
          hAxis: {title: 'Sản Phẩm'},
          seriesType: 'bars',
          series: {5: {type: 'line'}}        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>

    </head>
    <body class="body1">
        

        <jsp:include page="header1.jsp"></jsp:include>
		
		<div class="" style="margin-bottom: 60px;margin-left: 300px;margin-top: 40px;clear: right;">
		<div id="chart_div" style="width: 70%; height: 500px;"></div>
		
		</div>
           

                    
                

       <jsp:include page="footer1.jsp"></jsp:include>

       

    </body>
</html>

