<%-- 
    Document   : vieworders_mng
    Created on : May 17, 2025, 1:12:20 PM
    Author     : USER
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.Entity.User"%>
 

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
            <table class="table table-hover">
                <thead>
                    <tr>
                      <th scope="col">Order ID</th>
                      <th scope="col">Supplier ID</th>
                      <th scope="col">Date</th>
                      <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>
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


</body>
</html>
