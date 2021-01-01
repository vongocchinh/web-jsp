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
    <body>
        
        <%        
           
           
           DecimalFormat formatter = new DecimalFormat("###,###,###");
           
          BillDetail billDetail1=new BillDetail();
          BillDetailGet billDetailGet=new BillDetailGet();
       		 String billID="";
       	 if (request.getParameter("getBillID") != null) {
        	billID = request.getParameter("getBillID");
        	billDetail1=billDetailGet.getBillDetail(Integer.parseInt(billID));
       		}
        
        
        
   		
        
        %>

        <jsp:include page="header1.jsp"></jsp:include>
<div class="container-right">

                    
					 
                     <div class="table-container">			
				<form action="" method="post" >
					<table id="table-one" class="table-one">
                        <tr >
                           <!--  <th  width="120px">Mã hóa đơn</th>
                            <th width="120px">Mã Bill</th>
                            <th width="140px" >Mã Sản Phẩm</th> -->
                            <th width="100px">STT</th>
                            <th width="140px" >Tên Sản Phẩm</th>
                            <th width="100px" >Tổng Tiền</th>
                            <th width="100px">Số Lượng</th>
                          	<th width="100px">Tuy Chon</th>
                        </tr>
                        <%
                        int count=0;
                        for(BillDetail billDetail:billDetailGet.getProductNameByBillID(Integer.parseInt(billID))){
                      		count++;
                        	Product product1=new Product();
                      		ProductGet productGet=new ProductGet();
                      		product1=productGet.getProduct(billDetail.getProductID());
                        %>
                        <tr >
                            <!-- <td  width="30px"><%=billDetail.getBillDetailID()%></td>
                            <td ><%=billDetail.getBillID() %></td> 
                            <td ><%=product1.getProductID()%></td> -->
                            <td><%=count %></td>
                            <td ><%=product1.getProductName()%></td>
                            <td ><%=formatter.format(billDetail.getPrice())%></td>
                            <td ><%=billDetail.getQuantity()%></td>
                           <td style="width:100px " >
                          <a href="/dienthoai/ManagerBill?command=delete&bill_id=<%=Integer.parseInt(billID)%>">Xác Nhận</a>
                           
                           </td>
                           
                             
                        </tr>
                        
<%} %>
                    </table>
				</form>
				
			</div>
			</div>
                
                <div class="clear"></div>
			
			
            <jsp:include page="footer1.jsp"></jsp:include>

      


    </body>
</html>