<%-- 
    Document   : editlocation
    Created on : May 16, 2025, 7:51:53 PM
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
        <title>Edit Location</title>
    </head>
    <body>
        <%@ include file="/Dashboard/msg.jsp" %>
        
        			
			<%
			   int id=Integer.parseInt(request.getParameter("id"));
			StklocationDAO dao=new StklocationDAO(DBConnect.getConn());
			stcklocation loc=dao.getlockationById(id);
			%>
    <div class="card">
        <h5 class="card-header text-center">Edit warehouse store Location</h5>
        <div class="card-body">
            <form id="form">
                <div class="input-group mb-3">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Location Id: </label>
                    <div class="col-sm-10">
                        <input id="id" name="id" type="text" readonly class="form-control-plaintext" value="<%=loc.getLocId() %>" required>
                    </div>
                 </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Location Name</span>
                    <input id="stcklocationName" name="stcklocationName" type="text" class="form-control" placeholder="Location Name" aria-label="Location Name" aria-describedby="basic-addon1" value="<%=loc.getLocName() %>" required>
                </div>
                
                <div class="input-group mb-3">
                   <span class="input-group-text" id="basic-addon1">Location Status</span>
                    <select class="form-select" id="stcklocationstatus" name="stcklocationstatus" required>
                        <option value="" disabled selected>--Select--</option>
                                        <%
                                        if ("active".equals(loc.getLocStatus())) {
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
                </div>
                
                <div class="text-end">
                    <button type="submit" class="btn btn-primary">Update</button>
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

                    getHTMLResponse("/editstcklocation", "post", null,data)
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
