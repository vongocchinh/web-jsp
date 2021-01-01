<%@page import="get.admin.QCGet"%>
<%@page import="model.admin.QC"%>
<%@page import="get.admin.sliderGet"%>
<%@page import="model.admin.slider"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="get.admin.BillDetailGet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.admin.BillDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="get.admin.BillGet"%>
<%@page import="model.admin.Bill"%>
<%@page import="model.admin.Cart"%>
<%@page import="get.admin.UserGet"%>
<%@page import="model.admin.user"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="get.admin.ProductGet"%>
<%@page import="model.admin.Product"%>
<html>
<head>
 	<c:set var="root" value="${pageContext.request.contextPath}" />
 	<link rel="icon" type="image/png" href="${root}/img/favicon.ico"/>
	<meta charset="UTF-8">
	<link rel='stylesheet' type='text/css' media='screen' href='css/header.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/slider.css'>
     <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script src="js/slider.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Insert title here</title>
</head>
<body>
<header >
<%
user user1=null;
user usercheck=new user();
UserGet userGetcheck=new UserGet();
if(session.getAttribute("user") != null){
    user1 = (user) session.getAttribute("user");
    usercheck=userGetcheck.getUser(user1.getUserID());
}
Cart cart = (Cart) session.getAttribute("cart");
if (cart == null) {
    cart = new Cart();
    session.setAttribute("cart", cart);
}
DecimalFormat formatter = new DecimalFormat("###,###,###");

int a;

try {
    Integer count = new Integer(0);
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection
	("jdbc:mysql://localhost:3306/iphoneshop", "root", "123456");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from coun_ter");
        while (rs.next()) 
            count = rs.getInt("count");
    if (session.isNew()) {                 
    } else { 
        Integer oldcount = (Integer) session.getAttribute("count");
        if (oldcount != null) {

            count = new Integer(oldcount.intValue() + 1);
        } 
        session.setAttribute("count", count);                  
			st.executeUpdate("update coun_ter set count =" + count + "");
        while (rs.next()) {
            a = rs.getInt("count");
            out.println(a);
        }
    }
} catch (Exception e) {
}
%>
        <div class="header-top" >
            <div class="header-top-1">
               <a href="index.jsp"> <img class="logo" src="images/logo-top.png"></a>
            </div>
            <div class="header-top-2">
                <p> <strong>01263 717 084 </strong><br>
                    <span>Hộ trợ mua hàng </span>
                </p>

            </div>
            <div class="header-top-3">
                <p> <strong> HỆ THỐNG SIÊU THỊ</strong><br>
                    <span> Mở cửa 08:00 - 21:30</span>
                </p>
            </div>
            <div class="header-top-4">
            
                <p><a href="cart.jsp" style="color: white;"><strong>Giỏ Hàng</strong> / <%=formatter.format(cart.totalCart())%> đ<span class="cart-hv"><strong><%=cart.totalCart2() %></strong></span></a></p>
            </div>
            <div class="header-top-5">
                <div class="header-menu-header">
                    <a href="index.jsp" class="top">Trang chủ</a>
                     <%if(usercheck.getUserName()==null||usercheck.equals("")){ %>
                    <a href="login.jsp" class="top">Đăng nhập</a>
                    <%}else{ %>
                      <a href="/dienthoai/LogoutServlet?command=logout" class="top">Đăng xuất</a>
                    <%} %>
                    <a href="myaccount.jsp" class="top">Account</a>
                    <a href="cart.jsp" class="top">Giỏ hàng</a>
                    <a href="contact.jsp" class="top">Liên hệ</a>
                </div>
                <div class="header-menu-header2">
                    <form name="myForm_search" onsubmit="return validateFormsearch()" action="/dienthoai/SearchServlet" method="post">
                        <input class="search" name="product_name" type="search" placeholder="Bạn tìm gì...">
                        <input type="hidden" name="command" value="Search">
                    </form>
                </div>
            </div>
        </div>
    </header>
    <div class="sticky-mess">
        <img src="images/mess.png">
    </div>

    <div class="content-top" style="z-index: 9999">

        <div class="content-menu">
            <h3>Danh Mục Sản Phẩm</h3>
        </div>
    </div>
    <div class="container">
        <a href="javascript:void(0);" class="icon" style="z-index: 9999" onclick="myFunction1()">
            <i class='fas fa-angle-down'></i>
        </a>
        <div class="main-top">
            <div class="main-top1">
                <a href="product.jsp?categoryID=1&&brandID=0" id="dienthoai" class="menu"><img src="images/dt.png">Điện Thoại <i class='fas fa-angle-right'></i></a>
                <a href="product.jsp?categoryID=9&&brandID=0" class="menu"><img src="images/lp.png">Laptop <i class='fas fa-angle-right'></i></a>
                <a href="product.jsp?categoryID=12&&brandID=0" class="menu"><img src="images/tb.png">Ipad <i class='fas fa-angle-right'></i></a>
                <a href="product.jsp?categoryID=4&&brandID=0" class="menu"><img src="images/pk.png">Phụ Kiện <i class='fas fa-angle-right'></i></a>
                <a href="product.jsp?categoryID=-77877681&&brandID=0" class="menu"><img src="images/dgd.png">Máy ảnh</a>
                <a href="product.jsp?categoryID=11&&brandID=0" class="menu"><img src="images/tv.png">Tivi âm thanh</a>
                <a class="menu"><img src="images/tl.png">Dịch vụ</a>
                <a class="menu"><img src="images/dh.png">Điều hòa</a>
                <a class="menu"><img src="images/tbvp.png">Thiết bị Văn phòng</a>
                <a href="product.jsp?categoryID=-1&&brandID=-1" class="menu"><img src="images/mt.png">Sale</a>
            </div>
            <div class="main-top2">
             <%
             	sliderGet sliderGet=new sliderGet();
                 for(slider slider:sliderGet.getListUser()){
                     %>
                <div class="myslider">
                   <a href="single-product.jsp?productID=<%=slider.getProduct_id()%>"> <img src="/dienthoai/imagesphone/<%=slider.getImages_slider()%>"></a>
                </div>
                <%} %>
                <a class="prev" onclick="plusDivs(-1)">&#10094;</a>
                <a class="next" onclick="plusDivs(1)">&#10095;</a>
            </div>
            <div class="main-top3">
                <h3>Hệ Thống Cửa Hàng</h3>
                <p><img src="images/dc.png"><strong>Số 1174 Đường Láng, P. Láng thượng, Q. Đống Đa, Tp. Hà Nội</strong></p>
                <div class="p1"> <img src="images/dc.png"><strong>Số 159 Thái Hà, P. Láng Hạ, Q. Đống Đa, Tp. Hà Nội</strong></div>
                <%
                QCGet qcGet=new QCGet();
                for(QC qc:qcGet.getQC_muc_qc(1)){%>
                	<div class="main-top-qc">
                    <img src="/dienthoai/imagesphone/<%=qc.getImages_QC()%>">
                </div>
                	<%
                }
                %>
                 <%
               
                for(QC qc:qcGet.getQC_muc_qc(2)){%>
                	<div class="main-top-qc">
                    <img style="height: 102px" src="/dienthoai/imagesphone/<%=qc.getImages_QC()%>">
                </div>
                	<%
                }
                %>
            </div>

        </div>
    </div>
    <div style="margin-bottom: 40px"></div>
</body>
<script>
    var myIndex = 0;
    carousel();

    function carousel() {
        var i;
        var x = document.getElementsByClassName("myslider");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        myIndex++;
        if (myIndex > x.length) {
            myIndex = 1
        }
        x[myIndex - 1].style.display = "block";
        setTimeout(carousel, 5000);
    }
</script>
<script>
    var slideIndex = 1;
    showDivs(slideIndex);

    function plusDivs(n) {
        showDivs(slideIndex += n);
    }

    function currentDiv(n) {
        showDivs(slideIndex = n);
    }

    function showDivs(n) {
        var i;
        var x = document.getElementsByClassName("myslider");
       
        if (n > x.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = x.length
        }
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        
        x[slideIndex - 1].style.display = "block";
        
    }

    function validateFormsearch() {
        var search = document.forms["myForm_search"]["product_name"].value;

        if (search == "") {
            alert("Nhập tên sản phẩm tìm");
            return false;
        }


    }

    
</script>
</html>