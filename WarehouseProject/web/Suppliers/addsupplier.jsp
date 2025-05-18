<%-- 
    Document   : addsupplier
    Created on : May 15, 2025, 10:49:15 AM
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Supplier</title>
    </head>
    <body>
<%@ include file="/Dashboard/msg.jsp" %>
        
    <div class="card">
        <h5 class="card-header text-center">Add Supplier</h5>
        <div class="card-body">
            <form id="form">
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Supplier Name</span>
                    <input id="supp_name" name="supp_name" type="text" class="form-control" placeholder="Supplier Name" aria-label="Supplier Name" aria-describedby="basic-addon1" required>
                </div>
                
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Email</span>
                    <input id="supp_email" name="supp_email" type="email" class="form-control" placeholder="Email" aria-label="Email" aria-describedby="basic-addon1" required>
                    
                    <span class="input-group-text" id="basic-addon1">Contact number</span>
                    <input id="supp_cno" name="supp_cno" type="tel" class="form-control" placeholder="Contact number" aria-label="Contact number" aria-describedby="basic-addon1" required>
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

                    getHTMLResponse("/add_supplier", "post", null,data)
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

