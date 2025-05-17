<%-- 
    Document   : dispatches_act
    Created on : May 17, 2025, 1:49:45 PM
    Author     : Gimshan
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>


<!-- User Roll Validation -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.Entity.User"%>
<%
            String rights = null;
            User seession_user = (User) session.getAttribute("userobj");
            if(seession_user!=null){
                rights = seession_user.uvalidate("Warehouse_Manager"); //Modify Here
            }
%>
<c:set var="rights" value="<%= rights%>" />
<c:if test="${empty rights }">
    <script>
getHTMLResponse("/unauthorized.jsp", "GET", null,null).then(function(htmlResponse) {$("#display").html(htmlResponse);}).catch(function(error) {console.error("Error:", error);$("#display").html("Error: " + error);});
    </script>
</c:if>
<!-- End of User Roll Validation --> 

<html>
<head><title>Dispatch History</title></head>
<body>
    <%@ include file="/Dashboard/msg.jsp" %>
    <div class="card">
        <h5 class="card-header text-center">User Registration Form</h5>
        <div class="card-body">
            <table class="table table-hover">
                <thead>
                    <tr>
                      <th scope="col">Id</th>
                      <th scope="col">Product</th>
                      <th scope="col">Quantity</th>
                      <th scope="col">Date</th>
                      <th scope="col">Destination</th>
                      <th scope="col">Status</th>
                      <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
<c:forEach var="d" items="${dispatchList}">
                    <tr>
                        <td>${d.dispatchId}</td>
                        <td>${d.productName}</td>
                        <td>${d.quantity}</td>
                        <td>${d.dispatchDate}</td>
                        <td>${d.destination}</td>

			    <c:if test="${d.status == 'completed'}">
			        <td><span class="badge text-bg-success">${d.status}</span></td>
                                <td></td>
			    </c:if>
			    <c:if test="${d.status != 'completed'}">
			        <td><span class="badge text-bg-info">${d.status}</span></td>
                                <td>
                                    <button type="button" class="btn btn-warning" id="butedt${d.dispatchId}">Mark As Shipped</button>
   
                                                                        
                                    <script>
                                        $("#butedt${d.dispatchId}").on("click", function(){
                                            console.log("clicked");
                                            getHTMLResponse("/ShippedDispatch", "GET", {id: '${d.dispatchId}'},null)
                                            .then(function(htmlResponse) {
                                                $("#display").html(htmlResponse); // Update the element here
                                            })
                                            .catch(function(error) {
                                                console.error("Error:", error);
                                                $("#display").html("Error: " + error.responseText);
                                            });
                                        });
                                    </script>
                                </td>
			    </c:if>

                    </tr>
</c:forEach>
                </body>
            </table>
        </div>
    </div>
    
  

</table>

</body>
</html>
