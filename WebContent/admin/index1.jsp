<!DOCTYPE  html>

<%@page import="get.admin.UserAdminGet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.admin.DateLoginAdmin"%>
<%@page import="get.admin.GetdateloginAdmin"%>
<%@page import="model.admin.userAdmin"%>
<%@page import="get.admin.CategoryGet"%>
<%@page import="get.admin.BrandGet"%>
<%@page import="get.admin.BillGet"%>
<%@page import="get.admin.ReviewGet"%>
<%@page import="get.admin.ProductGet"%>
<%@page import="get.admin.UserGet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<html>

<head>

<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="icon" type="image/png" href="${root}/admin/imagesAdmin/favicon_1.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset='utf-8'>
    <link href="css_main.css" rel="stylesheet">
    <link href="css_main1.css" rel="stylesheet">
     <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
    <title>Trang chủ admin...</title>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<%
userAdmin useradmin1 = null;

userAdmin userAdmin2=new userAdmin();
UserAdminGet userAdminGet=new UserAdminGet();

if (session.getAttribute("userad") != null) {
 useradmin1=(userAdmin) session.getAttribute("userad");
 userAdmin2=userAdminGet.getUser(useradmin1.getId());

}

if(userAdmin2.isRoleAdmin()==false){
 response.sendRedirect("/dienthoai/admin/erro.jsp");
}
	UserGet userGet=new UserGet();
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection
	("jdbc:mysql://localhost:3306/iphoneshop", "root", "123456");
	Statement st = con.createStatement();
	
%>
<body class="body1">
<%
            userAdmin useradmin = (userAdmin) session.getAttribute("userad");
		 if (useradmin == null) {
             response.sendRedirect("/dienthoai/admin/loginAdmin.jsp");
         }
		 
        %>
   <jsp:include page="header1.jsp"></jsp:include>
    <div class="container-left-top-index">
        <div class="container-top-index">
            <div class="container-top-index-search">
                <div class="search-index-top-left">
                    <input type="search" class="search-top-index" placeholder="Search...">
                </div>
                <div class="thongbao-index-top-right">
                    <a href=""><img src="${root}/images/images/tb1.png" class="tb-index-top"></a>
                    <a class="admin_a">
                        <span class="admin">Admin</span>
                    </a>
                </div>
            </div>
            <hr>
            <div class="container-top-index-main">
                <div class="post-index-row-1">
                    <div class="row1-post-text">
                        <h4 class="text-post-row1">Default</h4>
                    </div>
                    <div class="row1-post-text-2">
                        <span class="row1-post-text-2-2"><a href=""><img class="img-text-2" src="${root}/images/images/hone.png"></a></span>/<span class="row1-post-text-2-2"><a href="">Dashboards</a> </span>/<span class="row1-post-text-2-2"><a href=""> Default </a></span>
                    </div>
                    <div class="row1-post-text-3">
                        <a href="#" class="sumbit-text-3">New</a>
                        <a href="#" class="sumbit-text-3">Filter</a>
                    </div>
                </div>
           
                <div class="post-index-row-2">
                    <div class="post-index">
                        <div class="post2-index">
                         <%
                        int count_GD=0;
                        ResultSet rs_GD = st.executeQuery("select * from counter");
                            while (rs_GD.next()) 
                            {
                            	count_GD= rs_GD.getInt("count_");
                            }
                        %>
                            <p class="post2-index-text-h4">Tổng GD</p>
                            <p class="post2-index-text-p"><strong><%=count_GD-17 %>(GD)</strong></p>
                        </div>
                        <div class="post2-index-2">
                            <img class="img-post2-index-2" src="${root}/images/images/m_1.png">
                        </div>
                    </div>
                    <div class="post-index">
                        <div class="post2-index">
                            <p class="post2-index-text-h4">Tổng USERS
                            </p>
                            <p class="post2-index-text-p"><strong><%=userGet.countTotaluser()%>(user)</strong></p>
                        </div>
                        <div class="post2-index-2">
                            <img class="img-post2-index-2" src="${root}/images/images/user_1.png">
                        </div>
                    </div>
                    <%ProductGet productGet=new ProductGet(); %>
                    <div class="post-index">
                        <div class="post2-index">
                            <p class="post2-index-text-h4">SP SALES</p>
                            <p class="post2-index-text-p"><strong><%=productGet.countproduct_sale()%>(SP)</strong></p>
                        </div>
                        <div class="post2-index-2">
                            <img class="img-post2-index-2" src="${root}/images/images/salee.png">
                        </div>
                    </div>
                    <div class="post-index">
                        <div class="post2-index">
                            <p class="post2-index-text-h4">PERFORMANCE</p>
                            <p class="post2-index-text-p"><strong> 49,65 %</strong></p>
                        </div>
                        <div class="post2-index-2">
                            <img class="img-post2-index-2" src="${root}/images/images/muc_4.png">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-main-index">
            <div class="post-main-index">
                <div id="piechart"></div>
            </div>

            <div class="post-main-index2">
                <div class="row_main_index2">
                    <p class="table-admin"><ins>Lượt Truy Cập Admin</ins></p>
                    <div class="table croll">
                        <table id="customers">
                            <tr>
                                <th>Name</th>
                                <th>Date Access</th>

                            </tr>
                            <%
                            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
                            GetdateloginAdmin getdateloginAdmin=new GetdateloginAdmin();
                            for(DateLoginAdmin date:getdateloginAdmin.getListDate()){%>
                            <tr>
                            <%
                            	userAdmin userAdmin=new userAdmin();
                            	UserAdminGet userAdminGet1=new UserAdminGet();
                            %>
                                <td><%=userAdminGet1.getUser(date.getUser_ad_id() ).getUserNameAdmin()%></td>
                                <td><%=simpleDateFormat.format(date.getDate())%></td>

                            </tr>
                           <%} %>
                            
                           
                            

                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-footer-index">
            <div class="row-fooetr-index">
                <div class="post-index">
                    <div class="post2-index">
                        <p class="post2-index-text-h4">Tổng Truy Cập Page</p>
                        <%
                        int count=0;
                        ResultSet rs = st.executeQuery("select * from coun_ter");
                            while (rs.next()) 
                            {
                            	count = rs.getInt("count");
                            }
                        %>
                        <p class="post2-index-text-p"><strong> <%=count-10 %>(L)</strong></p>
                    </div>
                    <div class="post2-index-2">
                        <img class="img-post2-index-2" src="${root}/images/images/View.png">
                    </div>
                </div>
                <div class="post-index">
                    <div class="post2-index">
                    <%
                    ReviewGet reviewGet=new ReviewGet();
                    %>
                        <p class="post2-index-text-h4">Tổng REVIEW</p>
                        <p class="post2-index-text-p"><strong><%=reviewGet.countTotalReview() %></strong></p>
                    </div>
                    <div class="post2-index-2">
                        <img class="img-post2-index-2" src="${root}/images/images/ReView.png">
                    </div>
                </div>
                <div class="post-index">
                    <div class="post2-index">
                    <%ProductGet productGettong=new ProductGet(); %>
                        <p class="post2-index-text-h4">Tổng SP</p>
                        <p class="post2-index-text-p"><strong><%=productGettong.countproduct() %></strong></p>
                    </div>
                    <div class="post2-index-2">
                        <img class="img-post2-index-2" src="${root}/images/images/PRODUCT.png">
                    </div>
                </div>
                <div class="post-index">
                    <div class="post2-index">
                    <%BillGet billGettong=new BillGet(); %>
                        <p class="post2-index-text-h4">TOTAL BILL</p>
                        <p class="post2-index-text-p"><strong><%=billGettong.countTotalBill() %></strong></p>
                    </div>
                    <div class="post2-index-2">
                        <img class="img-post2-index-2" src="${root}/images/images/order.png">
                    </div>
                </div>
            </div>
            <div class="row-fooetr-index_2">
                <div class="row-fooetr-index_2_in">
                    <div class="row-fooetr-index_2_in-div">
                        <a class="footer-index-2">Đơn Hàng</a>
                    </div>
                    <div class="row-fooetr-index_2_in-div">
                        <a class="footer-index-2">Newsletter</a>
                    </div>
                    <div class="row-fooetr-index_2_in-div">
                        <a class="footer-index-2">ConTact</a>
                    </div>
                </div>
                <div class="row-fooetr-index_2_out">
                    <h4 class="text-footer">Dynamically integrate client-centric technologies without cooperative resources.</h4>
                </div>
            </div>

        </div>
    </div>
    <jsp:include page="footer1.jsp"></jsp:include>
   <%
   ProductGet productGet2=new ProductGet();
  UserGet userGet2=new UserGet();
  BillGet brandGet=new BillGet();
   %>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <script type="text/javascript">
        // Load google charts
        google.charts.load('current', {
            'packages': ['corechart']
        });
        google.charts.setOnLoadCallback(drawChart);

        // Draw the chart and set the chart values
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Task', 'Thông Tin Sản Phẩm Shop'],
                ['Sản Phẩm', <%=productGet2.countproduct()%>],
                ['User', <%=userGet2.countTotaluser()%>],
                ['Đơn Hàng', <%=brandGet.countTotalBill()%>],

            ]);

            // Optional; add a title and set the width and height of the chart
            var options = {
                'title': 'Thông Tin Sản Phẩm Shop',
                'width': 560,
                'height': 350
            };

            // Display the chart inside the <div> element with id="piechart"
            var chart = new google.visualization.PieChart(document.getElementById('piechart'));
            chart.draw(data, options);
        }
    </script>
</body>

</html>