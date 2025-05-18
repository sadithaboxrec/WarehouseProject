<%-- 
    Document   : viewsupplier
    Created on : May 15, 2025, 9:36:33 PM
    Author     : DELL
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

<%@page import="com.DAO.SupplierDAOImpl" %>

<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.Entity.Supplier"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Categories </title>
    </head>
    <body>
        <%@ include file="/Dashboard/msg.jsp" %>
        
        <div class="card">
            <h5 class="card-header text-center">Suppliers</h5>
            <div class="card-body">
                <table class="table table-hover">
                        <thead>
                            <tr>
                              <th scope="col">Id</th>
                              <th scope="col">Name</th>
                              <th scope="col">Email</th>
                              <th scope="col">Contact Number</th>
                              <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
		  
		  <% 
		  SupplierDAOImpl dao=new SupplierDAOImpl(DBConnect.getConn());
		  List<Supplier> list= dao.getSupplier();
		  
		  for(Supplier s:list){
			  %>
			 
                    <tr>
                        <td><%= s.getSupp_id() %></td>
                        <td><%= s.getSupp_name() %></td>
                        <td><%= s.getSupp_email() %></td>
                        <td><%= s.getSupp_cno() %></td>
                        <td>
                            <button type="button" class="btn btn-warning" id="butedt<%=s.getSupp_id()%>">Edit</button>

                            
                            <script>
                                $("#butedt<%=s.getSupp_id()%>").on("click", function(){
                                console.log("clicked");
                                getHTMLResponse("/Suppliers/editsupplier.jsp", "GET", {id: '<%=s.getSupp_id()%>'},null)
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
                </table>
    </body>
</html>
