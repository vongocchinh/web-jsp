<%@page import="model.admin.Contact"%>
<%@page import="get.admin.ContactGet"%>
<%@page import="model.admin.userAdmin"%>
<%@page import="model.admin.user"%>
<%@page import="get.admin.UserGet"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Contact</title>
 <c:set var="root" value="${pageContext.request.contextPath}"/>
       <c:set var="root" value="${pageContext.request.contextPath}"/> 
        <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
         <link href="${root}/admin/css_body.css" rel='stylesheet' type='text/css'>
         <link rel="icon" type="image/png" href="${root}/admin/imagesAdmin/favicon.ico"/>
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

            ContactGet contactGet = new ContactGet();
            ArrayList<Contact> listContact = contactGet.getListContact();
            %>
        <jsp:include page="header1.jsp"></jsp:include>

            
<div class="container-right">

                    
					 
                     <div class="table-container">

                   
                    
                   
                    <table id="table-one" class="table-one">
                   
                    
                    
                   
                        <tr >
                            <th  >STT</th>
                           <!--  <th >Mã liên hệ</th> -->
                            <th >Họ tên</th>
                            <th >Website</th>
                            <th >Email</th>
                            <th width="150px" >Tiêu đề</th>
                            <th style="width: 450px;height: 50px">Lời nhắn</th>
                            <th >Thời gian</th>
                            
                            
                        </tr>
                        <% 
                          int count =0;
                          for(Contact contact : listContact){
                              count++;
                          
                            %>
                        <tr >
                            <td ><%=count%></td>
                           <!--  <td ><%=contact.getContactID()%></td> -->
                            <td ><%=contact.getContactName()%></td>
                            <td ><%=contact.getContactWeb()%></td>
                            <td ><%=contact.getContactEmail()%></td>
                            <td ><%=contact.getContactTitle()%></td>
                            <td ><%=contact.getContactMessage()%></td>
                            <td ><%=contact.getDate()%></td>
                            
                            
                        </tr>
                        <% } %>
                    </table>
                    </div>
                   
                </div>
                <div class="clear"></div>
                <div class="clear"></div>
                <div class="clear"></div>

            <jsp:include page="footer1.jsp"></jsp:include>

       

    </body>
</html>
