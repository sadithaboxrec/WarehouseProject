<%-- 
    Document   : addorder
    Created on : May 16, 2025, 10:20:41 PM
    Author     : sadit
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
<title>Insert title here</title>
</head>
<body>
<%@ include file="/Dashboard/msg.jsp" %>
    
    <div class="card">
        <h5 class="card-header text-center">Add Oder</h5>
        <h4 class="text-start">Send Products from Category: ${categoryName}</h4>
        <div class="card-body">
            <form id="form">
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Product Supplier</span>
                    <select class="form-select" id="pro_supplier" name="pro_supplier" required>
                        <option value="" disabled selected>--Select--</option>
                        <c:forEach var="sup" items="${supplierList}">
                            <option value="${sup.supp_id}">${sup.supp_name}</option>
                        </c:forEach>
                    </select>
                </div>
                
                <div class="text-end">
                        <button type="submit" class="btn btn-primary">Next</button>
                </div>
            </form>
        </div>
    </div>
        <script>
            $("#form").submit(function(event) {
                // Prevent the default form submission behavior
                event.preventDefault();
                    var data  = $(this).serialize();
                    console.log(data);

                    getHTMLResponse("/add_orders", "GET", null,data)
                        .then(function(htmlResponse) {
                            $("#display").html(htmlResponse); // Update the element here
                        })
                        .catch(function(error) {
                            console.error("Error:", error);
                        $("#display").html("Error: " + error);
                    });
            });
        </script>

</body>
</html>