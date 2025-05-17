<%-- 
    Document   : viewproducts
    Created on : May 16, 2025, 4:17:55 PM
    Author     : HP
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
                rights = seession_user.uvalidate("Manager"); //Modify Here
            }
%>
<c:set var="rights" value="<%= rights%>" />
<c:if test="${empty rights }">
    <script>
getHTMLResponse("/unauthorized.jsp", "GET", null,null).then(function(htmlResponse) {$("#display").html(htmlResponse);}).catch(function(error) {console.error("Error:", error);$("#display").html("Error: " + error);});
    </script>
</c:if>
<!-- End of User Roll Validation --> 

<%@page isELIgnored="false" %>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.Entity.Products"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Products</title>
</head>
<body>
<%@ include file="/Dashboard/msg.jsp" %>
    
    <div class="card">
        <h5 class="card-header text-center">All Products</h5>
        <div class="card-body">
            <table class="table table-hover">
            <thead>
                <tr>
                  <th scope="col">Id</th>
                  <th scope="col">Image</th>
                  <th scope="col">Product Name</th>
                  <th scope="col">Category</th>
                  <th scope="col">Supplier</th>
                  <th scope="col">Stock</th>
                  <th scope="col">User</th>
                  <th scope="col">Actions</th>
                  
                 
                </tr>
            </thead>
            <tbody>
	  
		  <% 
		  ProductDAOImpl dao=new ProductDAOImpl(DBConnect.getConn());
		  List<Products> list= dao.getAllProducts();
		  
		  for(Products p:list){
			  %>
			 
			<tr>
			  <td>  <%= p.getPro_id() %> </td>
		      <td> <img class="d-block mx-auto img-fluid" src="${pageContext.request.contextPath}/images/products/<%=p.getPro_photo() %>" onerror=this.src='../images/products/default.png' style="width:50px; height:50px;""> </td>      
		      <td> <%= p.getPro_name() %> </td>
		      <td> <%=p.getCategoryName() %></td>
		      <td> <%=p.getSuppName() %></td>
		      <td><%=p.getPro_stock() %></td>
		      <td><%= p.getUser() %></td>
		      <td>
                          <button type="button" class="btn btn-warning" id="butedt<%= p.getPro_id() %>">Edit</button>

                       <script>
                            $("#butedt<%= p.getPro_id() %>").on("click", function(){
                            console.log("clicked");
                            getHTMLResponse("/edit_products", "GET", {id: '<%= p.getPro_id() %>'},null)
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
		    </tr>
			  
			  <%
		  }
		  %>


		  </tbody>
		</table>

</body>
</html>
