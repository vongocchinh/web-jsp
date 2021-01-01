<%@page import="java.text.SimpleDateFormat"%>
<%@page import="get.admin.ProductGet"%>
<%@page import="model.admin.Product"%>
<%@page import="get.admin.BillDetailGet"%>
<%@page import="model.admin.BillDetail"%>
<%@page import="model.admin.user"%>
<%@page import="model.admin.userAdmin"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="get.admin.UserGet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.admin.Bill"%>
<%@page import="get.admin.BillGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <link href="css_main.css" rel="stylesheet">
    <link href="css_main1.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý hóa đơn</title>
 <c:set var="root" value="${pageContext.request.contextPath}"/>
       <!--  <c:set var="root" value="${pageContext.request.contextPath}"/> -->
         <link href="${root}/images/css_main.css" rel='stylesheet' type='text/css' />
          <link href="${root}/admin/css_body.css" rel='stylesheet' type='text/css'>
        <link rel="icon" type="image/png" href="${root}/admin/imagesAdmin/favicon.ico"/>
<style type="text/css">
	td{
	font-size: 14px;
	}
</style>
<script>
function showForm(){
		document.getElementById("fgForm").style.display = "block";
	}
	
	function closeForm(){
		document.getElementById("fgForm").style.display = "none";
	}
</script>
    </head>
    <body class="body1">
        
        <%        
           BillGet billGet = new BillGet();
           ArrayList<Bill> listBill = billGet.getListBill();
           UserGet userGet = new UserGet();
           user user=new user();
           DecimalFormat formatter = new DecimalFormat("###,###,###");
        %>

        <jsp:include page="header1.jsp"></jsp:include>

            <div class="container-right">

                    
					 
                     <div class="table-container">

                   
                    
                   
                    <table id="table-one" class="table-one">

                  
                        <tr >
                            <!-- <td>Ma bill</td> -->
                            <th width="50px">STT</th>
                           <!--  <th >Name</th> -->
                           <th >Tên Khách Hàng</th>
                            <th >Tổng hóa đơn</th>
                          <!--   <th>Gmail</th> -->
                            <th >Địa chỉ giao hàng</th>
                            <th >Ngày mua</th>
                            
                            <th >Phone</th>
                           <!--  <th >user_id</th> -->
                           
                            <th width="130px">Tùy chọn</th>
                        </tr>
                        
                        <%int count=0;
                        SimpleDateFormat formatterdate = new SimpleDateFormat("MM/dd/yyyy");
                        formatterdate = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
                        for(Bill bill1 :billGet.getListBill()){
                        	count++;
                   		user=userGet.getUser(bill1.getUserID());
                        %>
                        <tr >
                         			  <!--  <td  width="30px"><%=bill1.getBillID()%></td> -->
                           <td><%=count%></td>
                            <td ><%=bill1.getName()%></td>
                            <td ><%=formatter.format(bill1.getTotal())%> đ</td>
                          			  <!-- <td ><%=bill1.getPayment()%></td> -->
                            <td ><%=bill1.getSonha()%>,<%=bill1.getXa()%>,<%=bill1.getHuyen()%>,<%=bill1.getAddress()%></td>
                            <td ><%=formatterdate.format(bill1.getDate())%></td>
                    		 		   <!--  <td ><%=user.getUserName()%></td> -->
                            <td ><%=bill1.getPhone() %></td>
                          			  <!-- <td ><%=bill1.getUserID() %></td> -->
                             
                                <center>
                                <td  width="75px">
                                   <a href="/dienthoai/admin/bill_detail.jsp?getBillID=<%=bill1.getBillID()%>">XEM</a> &nbsp;&nbsp; | &nbsp;&nbsp;
                                    <a href="/dienthoai/ManagerBill?command=delete&bill_id=<%=bill1.getBillID()%>">HUY</a>
                                     </td>
                                </center>
                           
                        </tr>
                        <%}%>

                    </table>
                    </div>
                    
                

			
			</div>
                
                <div class="clear"></div>
			
			
            <jsp:include page="footer1.jsp"></jsp:include>

       


    </body>
</html>