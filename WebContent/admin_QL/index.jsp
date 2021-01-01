<!DOCTYPE  html>
<%@page import="get.admin.nhanvienGet"%>
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
	  <script src="${pageContext.request.contextPath}/admin_QL/js/show-detail.js "></script>
    <meta charset='utf-8'>
    <link href="${root}/admin_QL/css/style1.css" rel="stylesheet">
     <link href="${root}/admin_QL/css/chart.css" rel="stylesheet">
	<c:set var="root" value="${pageContext.request.contextPath}" />
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

ReviewGet reviewGet=new ReviewGet();



	UserGet userGet=new UserGet();
	
	
%>
<body>
    <jsp:include page="header.jsp"></jsp:include>

	  <%ProductGet productGettong=new ProductGet(); %>
	    <%BillGet billGettong=new BillGet(); %>
	      <%
                  
	    
                    %>
                    
    <div class="container-right-index2-left ">
        <div class="main-right">
            <h3>Dashdoard</h3>
            <div class="row">
                <div class="col">
                    <div class="col-main col-main0">
                        <h4>Khách Hàng</h4>
                        <hr>
                        <a href="ad.html">
                            <p><%=userGet.countTotaluser()%> khách hàng</p>
                        </a>
                    </div>
                </div>
                <div class="col">
                    <div class="col-main col-main1">
                        <h4>Đơn Hàng</h4>
                        <hr>
                        <a href="ad.html">
                            <p><%=billGettong.countTotalBill() %> đơn hàng</p>
                        </a>
                    </div>
                </div>
                <div class="col">
                    <div class="col-main col-main2">
                        <h4>Sản Phẩm</h4>
                        <hr>
                        <a href="ad.html">
                            <p><%=productGettong.countproduct() %> sản phẩm</p>
                        </a>
                    </div>
                </div>
                <div class="col">
                    <div class="col-main col-main3">
                        <h4>Đánh Giá</h4>
                        <hr>
                        <a href="ad.html">
                            <p><%=reviewGet.countTotalReview() %> đánh giá</p>
                        </a>
                    </div>
                </div>
            </div>
            <hr>
            	
           	
           	<div class="row" style="display: flex;justify-content:space-around;">
           		 <div id='chart_div' style='width: 100%; height: 500px;'></div>
			       
			      
           	</div>
           	 <hr>
           	 <div class="row" style="display: flex;justify-content:space-around;">
           		  <div id="chart_div1" style="width: 100%; height: 500px;"></div>
			       
			      
           	</div>
			   <hr>
           
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Tên Khách Hàng</th>
                        <th scope="col">Địa Chỉ</th>
                        <th scope="col">Phone</th>
                        <th scope="col" class="col1">Edit</th>
                    </tr>
                </thead>
                <tbody>
                <%
        		UserGet uGet=new UserGet();
        		ArrayList<user> user=uGet.getListUser();
        		int stt=0;
        		for(user user2:user){
        		stt++;
        		%>
                    <tr>
                        <th><%=stt %></th>
                        <td><%=user2.getUserName() %></td>
                        <td><%=user2.getDiachi() %></td>
                        <td><%=user2.getUserPhone() %></td>
                        <td class="tt">
                            <a><img src="${root}/admin_QL/images/de.png"></a>
                            <a><img src="${root}/admin_QL/images/e.png"></a>
                        </td>
                    </tr>
                   <%} %>
                </tbody>
            </table>
            <table class="table">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Name Admin</th>
                        <th scope="col">Quyền</th>
                       
                        <th scope="col" class="col1">Edit</th>
                    </tr>
                </thead>
                <tbody>
                <%
        		UserAdminGet uGet2=new UserAdminGet();
        		ArrayList<userAdmin> user2=uGet2.getListUser();
        		int st1=0;
        		for(userAdmin user22:user2){
        		st1++;
        		%>
                    <tr>
                        <th><%=st1%></th>
                        <td><%=user22.getUserNameAdmin() %></td>
                        <td><%=user22.isRoleAdmin() %></td>
                        
                        <td class="tt">
                               <a><img src="${root}/admin_QL/images/de.png"></a>
                            <a><img src="${root}/admin_QL/images/e.png"></a>
                        </td>
                    </tr>
				<%} %>
                    
                </tbody>
            </table>
            <div class="row" style="display: flex;justify-content:space-around;">
           		
			        <div id="piechart_div" style="border: 1px solid #ccc"></div>
			        <div id="barchart_div" style="border: 1px solid #ccc"></div>
			        
			      
           	</div>
        </div>
       <jsp:include page="footer.jsp"></jsp:include>
    </div>
    <div class="clear "></div>
     <%
   ProductGet productGet2=new ProductGet();
  	UserGet userGet2=new UserGet();
  	BillGet brandGet=new BillGet();
  UserAdminGet userAdminGet2=new UserAdminGet();
  nhanvienGet nhanvienGet=new nhanvienGet();
  	%>
   
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <script src="${root}/admin_QL/js/search.js "></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script type="text/javascript"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load Charts and the corechart and barchart packages.
      google.charts.load('current', {'packages':['corechart']});

      // Draw the pie chart and bar chart when Charts is loaded.
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Sản phẩm', <%=productGet2.countproduct()%>],
          ['Khách hàng', <%=userGet2.countTotaluser()%>],
          ['Đơn Hàng', <%=billGettong.countTotalBill()%>],
          ['Admin', <%=userAdminGet2.countTotaluser()%>],
          ['Nhân viên', <%=nhanvienGet.countTotaluser()%>],
          ['Đánh giá sản phẩm', <%=reviewGet.countTotalReview()%>],
         
        ]);

        var piechart_options = {title:'Pie Chart: How Much Pizza I Ate Last Night',
                       width:400,
                       height:300};
        var piechart = new google.visualization.PieChart(document.getElementById('piechart_div'));
        piechart.draw(data, piechart_options);

        var barchart_options = {title:'Barchart: How Much Pizza I Ate Last Night',
                       width:400,
                       height:300,
                       legend: 'none'};
        var barchart = new google.visualization.BarChart(document.getElementById('barchart_div'));
        barchart.draw(data, barchart_options);
      }
</script>
<script type='text/javascript'>
      google.charts.load('current', {'packages':['annotationchart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('date', 'Date');
        data.addColumn('number', 'Kepler-22b mission');
        data.addColumn('string', 'Kepler title');
        data.addColumn('string', 'Kepler text');
        data.addColumn('number', 'Gliese 163 mission');
        data.addColumn('string', 'Gliese title');
        data.addColumn('string', 'Gliese text');
        data.addRows([
          [new Date(2314, 2, 15), 12400, undefined, undefined,
                                  10645, undefined, undefined],
          [new Date(2314, 2, 16), 24045, 'Lalibertines', 'First encounter',
                                  12374, undefined, undefined],
          [new Date(2314, 2, 17), 35022, 'Lalibertines', 'They are very tall',
                                  15766, 'Gallantors', 'First Encounter'],
          [new Date(2314, 2, 18), 12284, 'Lalibertines', 'Attack on our crew!',
                                  34334, 'Gallantors', 'Statement of shared principles'],
          [new Date(2314, 2, 19), 8476, 'Lalibertines', 'Heavy casualties',
                                  66467, 'Gallantors', 'Mysteries revealed'],
          [new Date(2314, 2, 20), 0, 'Lalibertines', 'All crew lost',
                                  79463, 'Gallantors', 'Omniscience achieved']
        ]);

        var chart = new google.visualization.AnnotationChart(document.getElementById('chart_div'));

        var options = {
          displayAnnotations: true
        };

        chart.draw(data, options);
      }
    </script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
          ['2004/05',  165,      938,         522,             998,           450,      614.6],
          ['2005/06',  135,      1120,        599,             1268,          288,      682],
          ['2006/07',  157,      1167,        587,             807,           397,      623],
          ['2007/08',  139,      1110,        615,             968,           215,      609.4],
          ['2008/09',  136,      691,         629,             1026,          366,      569.6]
        ]);

        var options = {
          title : 'Monthly Coffee Production by Country',
          vAxis: {title: 'Cups'},
          hAxis: {title: 'Month'},
          seriesType: 'bars',
          series: {5: {type: 'line'}}        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div1'));
        chart.draw(data, options);
      }
    </script>
    
</body>

</html>