<%-- 
    Document   : dispatchsuccess
    Created on : May 17, 2025, 1:50:48 PM
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
<!-- End of User Roll Validation --> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h3>Products successfully dispatched to store!</h3>

<button id="smore" data-page="/send_order">Send more products</button>

                        <script>
                            $("#smore").on("click", function(){
                            console.log("clicked");
                            getHTMLResponse("/send_order", "GET", null,null)
                                .then(function(htmlResponse) {
                                    $("#display").html(htmlResponse); // Update the element here
                                })
                                .catch(function(error) {
                                    console.error("Error:", error);
                                    $("#display").html("Error: " + error.responseText);
                                });
                            });
                        </script>


</body>
</html>