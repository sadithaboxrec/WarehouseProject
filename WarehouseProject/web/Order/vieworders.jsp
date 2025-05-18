<%-- 
    Document   : vieworders
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    Created on : May 17, 2025, 1:06:36 PM
    Author     : USER
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- User Roll Validation -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.Entity.User"%>
<%
            String rights = null;
            User seession_user = (User) session.getAttribute("userobj");
            if(seession_user!=null){
                rights = seession_user.uvalidate("Supplier_Manager"); //Modify Here
            }
%>
<c:set var="rights" value="<%= rights%>" />
<c:if test="${empty rights }">
    <script>
getHTMLResponse("/unauthorized.jsp", "GET", null,null).then(function(htmlResponse) {$("#display").html(htmlResponse);}).catch(function(error) {console.error("Error:", error);$("#display").html("Error: " + error);});
    </script>
</c:if>
<!-- End of User Roll Validation --> 


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Orders</title>
</head>
<body>
<%@ include file="/Dashboard/msg.jsp" %>

    <div class="card">
        <h5 class="card-header text-center">Order List</h5>
        <div class="card-body">
            
             <div class="mb-3">
                 <input type="text" id="orderSearch" class="form-control" placeholder="Search by Supplier Name...">
             </div>
            
            <table class="table table-hover">
                <thead>
                    <tr>
                      <th scope="col">Order ID</th>
                      <th scope="col">Supplier ID</th>
                      <th scope="col">Date</th>
                      <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody id="orderTableBody">
                    <c:forEach var="order" items="${orderList}">
                        <tr>
                            <td>${order.orderId}</td>
                            <td>${order.supplierId}</td>
                            <td>${order.orderDate}</td>

			    <c:if test="${order.status == 'received'}">
			        <td><span class="badge text-bg-success">${order.status}</span></td>
			    </c:if>
			    <c:if test="${order.status != 'received'}">
			        <td><span class="badge text-bg-info">${order.status}</span></td>
			    </c:if>

                        </tr>
                    </c:forEach>
                </body>
            </table>
        </div>
    </div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script>
    $("#orderSearch").on("keyup", function () {
        var value = $(this).val().toLowerCase();

        $("#orderTableBody tr").filter(function () {
            var supplierName = $(this).find("td:eq(1)").text().toLowerCase();
            $(this).toggle(supplierName.indexOf(value) > -1);
        });
    });
</script>
</body>
</html>
