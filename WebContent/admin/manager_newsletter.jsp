

<%@page import="model.admin.Newsletter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="get.admin.NewsletterGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <link href="css_main.css" rel="stylesheet">
    <link href="css_main1.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Liên Hệ</title>

        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
        <link rel="icon" type="image/png" href="${root}/admin/imagesAdmin/favicon.ico"/>
         <link href="${root}/admin/css_body.css" rel='stylesheet' type='text/css'>
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
    </head>
    <body class="body1">
        <%

            NewsletterGet newsletterGet = new NewsletterGet();
            ArrayList<Newsletter> listNewsletter = newsletterGet.getListNewsletter();
            %>
        <jsp:include page="header1.jsp"></jsp:include>

            <div class="container-right">

                    
					 
                     <div class="table-container">

                   
                    
                   
                    <table id="table-one" class="table-one" style="width: 100%">
                        <tr >
                            <th  width="30px">STT</th>
                            <!-- <th >Mã số</th> -->
                            <th >Email Đăng Kí</th>
                            <th >Thời gian</th>
                            
                            
                        </tr>
                        <% 
                          int count =0;
                          for(Newsletter newsletter : newsletterGet.getListNewsletter()){
                              count++;
                          
                            %>
                        <tr >
                            <td  width="30px"><%=count%></td>
                         <!--    <td ><%=newsletter.getNewsletterID()%></td> -->
                            <td ><%=newsletter.getNewsletterName()%></td>
                            <td ><%=newsletter.getDate()%></td>
                            
                            
                        </tr>
                        <% } %>
                    </table>
                </div>
                </div>
                
                <div class="clear"></div>

            <jsp:include page="footer1.jsp"></jsp:include>

        

    </body>
</html>
