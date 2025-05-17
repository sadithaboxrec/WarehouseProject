<%-- 
    Document   : unauthorized
    Created on : May 16, 2025, 9:21:08 AM
    Author     : sadit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Unauthorized Section </title>
    </head>
<body>
    <div class="card text-center">
        <div class="card-header">
          Unauthorized Access
        </div>
        <div class="card-body">
          <h5 class="card-title">You Can't Access this Page</h5>
          <p class="card-text">Please tell an authorized person about this.</p>
          <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-primary" role="button">Log Out</a>
        </div>
    </div>
</body>
</html>
