<%-- 
    Document   : addcategory
    Created on : May 16, 2025, 1:09:19 PM
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
        <title>ADD CATEGORY</title>
    </head>
    <body>
    <%@ include file="/Dashboard/msg.jsp" %>
        
    <div class="card">
        <h5 class="card-header text-center">Add Category</h5>
        <div class="card-body">
            <form id="form">
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Category Name</span>
                    <input id="categoryName" name="categoryName" type="text" class="form-control" placeholder="Category Name" aria-label="Username" aria-describedby="basic-addon1" required>
                </div>
              
                <div class="input-group mb-3">
                   <span class="input-group-text" id="basic-addon1">Category Status</span>
                    <select class="form-select" id="categoryStatus" name="categoryStatus"  required>
                        <option value="" disabled selected>--Select--</option>
                        <option value="active">Active</option>
                        <option value="inactive">Inactive</option>
                    </select>
                   <span class="input-group-text" id="basic-addon1">Warehouse Stock Location</span>
                    <select class="form-select" id="stkloc_id" name="stkloc_id"  required>
		    <option value="" disabled selected>--Select--</option>
                    
                        <% 
                            StklocationDAO stckLocDAO = new StklocationDAO(DBConnect.getConn());  
                            List<stcklocation> stckLocList = stckLocDAO.getlockations();

                          for(stcklocation loc:stckLocList){
                        %>

                                <option value='<%=loc.getLocId()%>'><%=loc.getLocName()%></option>

                        <%
                          }
                        %>
                    </select>
                </div>
                    <div class="text-end">
                        <button type="submit" class="btn btn-primary">Create</button>
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

                    getHTMLResponse("/add_category", "POST", null,data)
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
