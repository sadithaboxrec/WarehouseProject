<%-- 
    Document   : createorder
    Created on : May 16, 2025, 10:34:10 PM
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
<head><title>Create Order</title></head>
<body>
<%@ include file="/Dashboard/msg.jsp" %>

    <div class="card">
        <h5 class="card-header text-center">Add Oder</h5>
        <h4 class="text-start">Create Order for Supplier: ${supplierId}</h4>
        <div class="card-body">
          <form id="form">
            <div class="input-group mb-3">
                <label for="staticEmail" class="col-sm-2 col-form-label">Category ID: </label>
                <div class="col-sm-10">
                    <input id="supplierId" name="supplierId" type="text" readonly class="form-control-plaintext" value="${supplierId}" required>
                </div>
            </div>
            
            <table class="table table-hover">
                <thead>
                    <tr>
                      <th scope="col">Img</th>  
                      <th scope="col">Product Name</th>
                      <th scope="col">Current Stock</th>
                      <th scope="col">Order Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${productList}">
                    <tr>
                        <td> <img class="d-block mx-auto img-fluid" src="${pageContext.request.contextPath}/images/products/${p.pro_photo}" onerror=this.src='../images/products/default.png' style="width:50px; height:50px;""> </td>      
                        <td>${p.pro_name}</td>
                        <td>${p.pro_stock}</td>

                        <td>
                            <input class="form-control" type="number" name="qty_${p.pro_id}" value="0" min="0" />
                        </td>

                    </tr>
                    </c:forEach>
                </body>
            </table>
                <div class="text-end">
                        <button type="submit" class="btn btn-primary">Place Order</button>
                </div>
          </form>
        </div>
    </div>
    
<h2></h2>
          <script>
            $("#form").submit(function(event) {
                // Prevent the default form submission behavior
                event.preventDefault();
                    var data  = $(this).serialize();
                    console.log(data);

                    getHTMLResponse("/submit_order", "POST", null,data)
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
