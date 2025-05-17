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
<c:redirect url="${pageContext.request.contextPath}/"/>
</c:if>
<!-- End of User Roll Validation --> 

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Alexander Store - Warehouse</title>

  <!-- styles -->
         
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">


  <link rel="stylesheet" href="assest/css/dashboardstyle.css">
  
  
  <!-- fontawesome CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" >
  
  <script src="/scripts/jquery-3.7.1.js"></script> 
  <script src="/scripts/ajax.js"></script> 
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

        
  <!--Sidebar-->

  <div class="admin-container">


    <div class="sidebar">

      
      <div class="sidebar-brand">
        <h1> <span>ALEXANDER STORE</span>  </h1>
      </div>

      <div class="sidebar-menu">

        <ul>
            
             <c:if test="${roll == 'SU'}">
                    <li class="has-submenu">
                        <a href="#">
                          <span class="icon">
                            <i class="fa-solid fa-user-tie"></i>
                          </span>
                          <span class="title">Users 
                            <span class="fa-solid fa-caret-down"></span>
                          </span>
                        </a>
                        <ul class="submenu">
                            <li class="enty" data-page="${pageContext.request.contextPath}/Super_Admin/addUsers.jsp"><a>Add Users</a></li>
                            <li class="enty" data-page="${pageContext.request.contextPath}/Super_Admin/alladmins.jsp"><a>All Admins</a></li>
                        </ul>
                    </li>
                </c:if>
                  
                <c:if test="${roll == 'Manager'}">
                    <li class="has-submenu">
                        <a href="#">
                          <span class="icon">
                            <i class="fa-solid fa-user-tie"></i>
                          </span>
                          <span class="title">Products 
                            <span class="fa-solid fa-caret-down"></span>
                          </span>
                        </a>
                        <ul class="submenu">
                            <li class="enty" data-page="${pageContext.request.contextPath}/add_products"><a>Add Products</a></li>
                            <li class="enty" data-page="${pageContext.request.contextPath}/Product/viewproducts.jsp"><a>View Products</a></li>
                        </ul>
                    </li>

                    <li class="has-submenu">
                        <a href="#">
                          <span class="icon">
                            <i class="fa-solid fa-user-tie"></i>
                          </span>
                          <span class="title">Stock Locations 
                            <span class="fa-solid fa-caret-down"></span>
                          </span>
                        </a>
                        <ul class="submenu">
                            <li class="enty" data-page="${pageContext.request.contextPath}/stocklocation/addlocation.jsp"><a>Add Location</a></li>
                            <li class="enty" data-page="${pageContext.request.contextPath}/stocklocation/viewlocation.jsp"><a>View Locations</a></li>
                        </ul>
                    </li>

                    <li class="has-submenu">
                        <a href="#">
                          <span class="icon">
                            <i class="fa-solid fa-tag"></i>
                          </span>
                          <span class="title">Categories
                            <span class="fa-solid fa-caret-down"></span>
                          </span>
                        </a>
                        <ul class="submenu">
                            <li class="enty" data-page="${pageContext.request.contextPath}/add_category"><a>Add Category</a></li>
                            <li class="enty" data-page="${pageContext.request.contextPath}/Category/viewcategory.jsp"><a>View Category</a></li>  
                        </ul>
                    </li>
                    
                    <li class="has-submenu">
                        <a href="#">
                          <span class="icon">
                            <i class="fa-solid fa-user-tie"></i>
                          </span>
                          <span class="title">Supplier
                            <span class="fa-solid fa-caret-down"></span>
                          </span>
                        </a>
                        <ul class="submenu">
                            <li class="enty" data-page="${pageContext.request.contextPath}/Suppliers/addsupplier.jsp"><a>Add Supplier</a></li>
                            <li class="enty" data-page="${pageContext.request.contextPath}/Suppliers/viewsupplier.jsp"><a>View Supplier</a></li>  
                        </ul>
                    </li>
                    
                                        <li class="has-submenu">
                        <a href="#">
                          <span class="icon">
                            <i class="fa-solid fa-cart-shopping"></i>
                          </span>
                          <span class="title">Orders
                            <span class="fa-solid fa-caret-down"></span>
                          </span>
                        </a>
                        <ul class="submenu">
                          <li class="enty" data-page="${pageContext.request.contextPath}/ViewOrderServlet"><a>View Orders</a></li>  
                        </ul>
                    </li>
                    
                    <li class="has-submenu">
                        <a href="#">
                          <span class="icon">
                            <i class="fa-solid fa-user-tie"></i>
                          </span>
                          <span class="title">Dispatch
                            <span class="fa-solid fa-caret-down"></span>
                          </span>
                        </a>
                        <ul class="submenu">
                          <li class="enty" data-page="${pageContext.request.contextPath}/send_order"><a>Dispatch Products</a></li>  
                          <li class="enty" data-page="${pageContext.request.contextPath}/view_dispatches"><a>View Dispatching Orders</a></li>
                        </ul>
                    </li>
                </c:if>
                
                <c:if test="${roll == 'Supplier_Manager'}">
                    <li class="has-submenu">
                        <a href="#">
                          <span class="icon">
                            <i class="fa-solid fa-cart-shopping"></i>
                          </span>
                          <span class="title">Orders
                            <span class="fa-solid fa-caret-down"></span>
                          </span>
                        </a>
                        <ul class="submenu">
                            <li class="enty" data-page="${pageContext.request.contextPath}/add_orders"><a>Add Orders</a></li>
                            <li class="enty" data-page="${pageContext.request.contextPath}/ViewOrderServlet"><a>View Orders</a></li>  
                        </ul>
                    </li>
                </c:if>

                <c:if test="${roll == 'Warehouse_Manager'}">
                    <li class="has-submenu">
                        <a href="#">
                          <span class="icon">
                            <i class="fa-solid fa-cart-shopping"></i>
                          </span>
                          <span class="title">Orders
                            <span class="fa-solid fa-caret-down"></span>
                          </span>
                        </a>
                        <ul class="submenu">
                          <li class="enty" data-page="${pageContext.request.contextPath}/ViewOrderServlet"><a>View Orders</a></li>  
                        </ul>
                    </li>

                    <li class="has-submenu">
                        <a href="#">
                          <span class="icon">
                            <i class="fa-solid fa-user-tie"></i>
                          </span>
                          <span class="title">Dispatch
                            <span class="fa-solid fa-caret-down"></span>
                          </span>
                        </a>
                        <ul class="submenu">
                          <li class="enty" data-page="${pageContext.request.contextPath}/view_dispatches"><a>View Dispatching Orders</a></li>
                        </ul>
                    </li>
                </c:if>
                    
                <li>
                    <a href="#" class="nav-link" data-bs-toggle="modal" data-bs-target="#exampleModal">
                      <span class="icon">
                        <i class="fa-solid fa-right-from-bracket"></i>
                      </span>
                      <span class="title">Logout</span>
                    </a>
                </li>
        </ul>
      </div>



    </div>   <!--Sidebar end-->


    <div class="main">

      <div class="header">

        <div class="toggle">
          <i class="fa-solid fa-bars"></i>
        </div>
      
        <div class="current-user">
          <img class="d-block mx-auto img-fluid" src="../images/users/${userobj.photoName}" onerror=this.src='../images/users/user.png' width="60px" height="60px"">
          <div>
            <h4>${userobj.name}</h4>
            <small>${userobj.role}</small>
          </div>
        </div>
      
      </div>  <!--header end-->


      
            <!-- Main Content -->
 
      <div class="main-content">

          <div id="display"></div>
      
      
      </div> <!--main content div end-->
      
      
 
    </div> <!--Main end-->



  </div>   <!--admin-container-div end-->
  
  <script>
       getHTMLResponse("/dashboard", "GET", null,null)
                        .then(function(htmlResponse) {
                            $("#display").html(htmlResponse); // Update the element here
                        })
                        .catch(function(error) {
                            console.error("Error:", error);
                        $("#display").html("Error: " + error);
                    });
  </script>
  

  <script src="assest/js/dashboard.js"></script>
</body>
</html>


