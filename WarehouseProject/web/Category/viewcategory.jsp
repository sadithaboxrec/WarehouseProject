<%-- 
    Document   : viewcategory
    Created on : May 16, 2025, 2:33:53 PM
    Author     : methm
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
<!-- End of User Roll Validation -->


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page isELIgnored="false" %>

<%@ page import="com.DAO.CategoryDAOImpl" %>
<%@ page import="com.DAO.StklocationDAO" %>

<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.Entity.Category"%>
<%@page import="com.Entity.stcklocation"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Categories </title>
    </head>
    <body>
        <%@ include file="/Dashboard/msg.jsp" %>
        <div class="card">
            <h5 class="card-header text-center">All Categories</h5>
            <div class="card-body">
                <table class="table table-hover">
            <thead>
                <tr>
                  <th scope="col">Id</th>
                  <th scope="col">Category Name</th>
                  <th scope="col">Warehouse Store Location</th>
                  <th scope="col">Status</th>
                  <th scope="col">Action</th>
                      <th></th>
                      <th></th>
                </tr>
            </thead>
            <tbody>
                
		  <% 
		  CategoryDAOImpl dao=new CategoryDAOImpl(DBConnect.getConn());
		  List<Category> list= dao.getCategory();
                  
		  for(Category c:list){
			  %>
			 
			<tr>
			  <td><%=c.getCategoryId() %></td>
		      <td> <%= c.getCategoryName() %> </td>
                      <td> <%= new StklocationDAO(DBConnect.getConn()).getlockationById(c.getLocId()).getLocName() %></td>
                        <% if(c.getCategoryStatus().equals("active")){%>
                            <td><span class="badge text-bg-success"><%= c.getCategoryStatus() %></span></td>
                         <%
                             }else{ %>
                            <td><span class="badge text-bg-danger"><%= c.getCategoryStatus() %></span></td>
                         <%
                             }
                         %>
		      <td>
                         <button type="button" class="btn btn-warning" id="butedt<%=c.getCategoryId()%>">Edit</button>
                          <script>
                            $("#butedt<%=c.getCategoryId()%>").on("click", function(){
                                console.log("clicked");
                                getHTMLResponse("/Category/editcategory.jsp", "GET", {id: '<%=c.getCategoryId()%>'},null)
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
    
                  </body>
    </table>
</html>
