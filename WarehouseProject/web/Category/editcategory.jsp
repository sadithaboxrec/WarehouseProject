<%-- 
    Document   : editcategory
    Created on : May 16, 2025, 1:10:24 PM
    Author     : Gimshan
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
<!-- End of User Roll Validation -->



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
        <title>Edit Category</title>
    </head>
    <body>
        <%@ include file="/Dashboard/msg.jsp" %>
        
        			
			<%
			   int id=Integer.parseInt(request.getParameter("id"));
			CategoryDAOImpl dao=new CategoryDAOImpl(DBConnect.getConn());
			Category c=dao.getCategoryById(id);
                        String StockLOC = new StklocationDAO(DBConnect.getConn()).getlockationById(c.getLocId()).getLocName();
                        
			%>
                        
    <div class="card">
        <h5 class="card-header text-center">Edit Category</h5>
        <div class="card-body">
            <form id="form">
                <div class="input-group mb-3">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Category ID: </label>
                    <div class="col-sm-10">
                        <input id="id" name="id" type="text" readonly class="form-control-plaintext" value="<%=c.getCategoryId() %>" required>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Category Name</span>
                    <input id="categoryName" name="categoryName" type="text" class="form-control" placeholder="Category Name" aria-label="Username" aria-describedby="basic-addon1" value="<%=c.getCategoryName() %>" required>
                </div>
              
                <div class="input-group mb-3">
                   <span class="input-group-text" id="basic-addon1">Category Status</span>
                    <select class="form-select" id="categoryStatus" name="categoryStatus"  required>
                        <option value="" disabled selected>--Select--</option>
                                        <%
                                        if ("Active".equals(c.getCategoryStatus())) {
                                        %>
                                          <option value="active">Active</option>
                                          <option value="inactive">Inactive</option>
                                        <%
                                        } else {
                                        %>
                                          <option value="inactive">Inactive</option>
                                          <option value="active">Active</option>
                                        <%
                                        }
                                        %>
                    </select>
                   <span class="input-group-text" id="basic-addon1">Warehouse Stock Location</span>
                    <select class="form-select" id="stkloc_id" name="stkloc_id"  required>
		    <option value="" disabled selected><%=StockLOC %></option>
                        <% 
                            StklocationDAO stckLocDAO = new StklocationDAO(DBConnect.getConn());  
                            List<stcklocation> stckLocList = stckLocDAO.getlockations();

                          for(stcklocation loc:stckLocList){
                        %>

                                <option value="<%=loc.getLocId()%>"><%=loc.getLocName()%></option>

                        <%
                          }
                        %>
                    </select>
                </div>
                    <div class="text-end">
                        <button type="submit" class="btn btn-primary">Edit</button>
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

                    getHTMLResponse("/editCategory", "POST", null,data)
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
