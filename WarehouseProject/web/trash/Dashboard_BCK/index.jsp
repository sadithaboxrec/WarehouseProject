<%-- 
    Document   : home
    Created on : May 2, 2025, 11:28:24 PM
    Author     : DELL
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- User Roll Validation -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.Entity.User"%>
<%
            String roll = null;
            User seession_user = (User) session.getAttribute("userobj");
            if(seession_user!=null){
                roll = seession_user.getRole();
            }
%>
<c:set var="roll" value="<%= roll%>" />
<c:if test="${empty userobj }">
<c:redirect url="${pageContext.request.contextPath}/login.jsp"/>
</c:if>
<!-- End of User Roll Validation --> 

<!DOCTYPE html>
<html lang="en">
<head>
        
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <!-- MATERIAL CDN-->
    <LINK HREF="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" 
    rel="stylesheet">
    <!--STYLESHEET-->
    <link rel="stylesheet" href="./style.css">

</head>
<body>
     <!-- Logout Model -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Logout Confirmation</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <h4>Do You want to LogOut?</h4>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-primary" role="button">Log Out</a>
        
      </div>
      <div class="modal-footer">

      </div>
    </div>
  </div>
</div>
      <!-- End of Logout Model -->  
      
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>

    
    
    
    <div class="container">
        <aside>
            <div class="top">
                <div class="logo">
                    <img src="./img/123.avif" alt="" >
                    <h2> lo<span class="danger">go </span> </h2>
                </div>
                <div class="close" id="close-btn">
                    <span class="material-icons-sharp">
                        close
                        </span>
                </div>
            </div>
            <div class="sidebar">
                
                <c:if test="${roll == 'SU'}">
                    <a href="#" class="nav-link">
                        <span class="material-icons-sharp">
                            person_outline
                            </span>
                            <h3>Users</h3>       
                    </a>
                </c:if>
                
                <c:if test="${roll == 'Manager'}">
                    <a href="#" class="nav-link">
                        <span class="material-icons-sharp">
                            inventory
                            </span>
                            <h3>Products</h3>
                    </a>
                    
                    <a href="#" class="nav-link">
                        <span class="material-icons-sharp">
                            insights
                            </span>
                            <h3>Stock Locations</h3>
                    </a>
                    
                    <a href="#" class="nav-link">
                        <span class="material-icons-sharp">
                            grid_view
                            </span>
                            <h3> Categories </h3>
                    </a>
                    
                    <a href="#" class="nav-link">
                        <span class="material-icons-sharp">
                            person_outline
                            </span>
                            <h3>Supplier</h3>       
                    </a>
                    
                    <a href="#" class="nav-link">
                        <span class="material-icons-sharp">
                            receipt_long
                            </span>
                            <h3>Dispatch</h3>
                    </a>
                </c:if>
                
                <c:if test="${roll == 'Supplier_Manager'}">
                    <a href="#" class="nav-link">
                    <span class="material-icons-sharp">
                        receipt_long
                        </span>
                        <h3>Orders</h3>
                    </a>
                </c:if>

                <c:if test="${roll == 'Warehouse_Manager'}">
                    <a href="#" class="nav-link">
                    <span class="material-icons-sharp">
                        receipt_long
                        </span>
                        <h3>Orders</h3>
                    </a>
                    
                    <a href="#" class="nav-link">
                        <span class="material-icons-sharp">
                            receipt_long
                            </span>
                            <h3>Dispatch</h3>
                    </a>
                </c:if>

                <a href="#" class="nav-link" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <span class="material-icons-sharp">
                        logout
                        </span>
                        <h3>Logout</h3>
                </a>
               
            </div>
        </aside>
        <!----------------END OF ASIDE----------------->
        <main>
            <h1>Dashboard</h1>
            <div id="display"></div>
        </main>
        <!----------------------------END OF MAIN------------------------------->

        <div class="right">
            <div class="top">
                <button id="menu-btn">
                    <span class="material-icons-sharp">menu</span>
                </button>
                <div class="theme-toggler">
                    <span class="material-icons-sharp active">light_mode</span>
                    <span class="material-icons-sharp">dark_mode</span>
                </div>
                <div class="profile">
                    <div class="info">
                        <p>Hey, <b>${userobj.name}</b></p>
                        <small class="text-muted">${userobj.role}</small>
                    </div>
                    <div class="profile-photo">
                        
                        <img class="d-block mx-auto img-fluid" src="../images/users/${userobj.photoName}" onerror=this.src='../images/users/user.png' ">
                    </div>
                </div>
            </div>
            <!-----------------------------END OF TOP---------------------------->
            
            <!---------------------- END OF RECENT UPDATES----------------------->
            <div class="sales-analytics">
                <h2>Actions</h2>
                <div class="item add-product">
                    <div>
                        <h3>Add Product</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="./orders.js"></script>
    <script src="./index.js"></script>

</body>
</html>