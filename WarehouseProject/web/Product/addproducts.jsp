<%-- 
    Document   : addproducts
    Created on : May 16, 2025, 3:07:01 PM
    Author     : USER
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

<%@ page import="com.DAO.CategoryDAOImpl" %>
<%@ page import="com.DAO.StklocationDAO" %>

<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.Entity.Category"%>
<%@page import="com.Entity.stcklocation"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Products</title>
</head>
<body>
<%@ include file="/Dashboard/msg.jsp" %>
    
    <div class="card">
        <h5 class="card-header text-center">Add Product</h5>
        <div class="card-body">
            <form id="form" enctype="multipart/form-data">
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Product Name</span>
                    <input id="pro_name" name="pro_name" type="text" class="form-control" placeholder="Product Name" aria-label="Product Name" aria-describedby="basic-addon1" required>
                
                    <span class="input-group-text" id="basic-addon1">Stock</span>
                    <input id="pro_stock" name="pro_stock" type="number" class="form-control" placeholder="Product Name" aria-label="Product Name" aria-describedby="basic-addon1" required>
                </div>
              
                <div class="input-group mb-3">
                   <span class="input-group-text" id="basic-addon1">Product Category</span>
                    <select class="form-select" id="pro_category" name="pro_category"  required>
                        <option value="" disabled selected>--Select--</option>
                        <c:forEach var="cat" items="${categoryList}">
                            <option value="${cat.categoryId}">${cat.categoryName}</option>
                        </c:forEach>
                    </select>
                    <span class="input-group-text" id="basic-addon1">Product Supplier</span>
                    <select class="form-select" id="pro_supplier" name="pro_supplier"  required>
                        <option value="" disabled selected>--Select--</option>
                        <c:forEach var="sup" items="${supplierList}">
                            <option value="${sup.supp_id}">${sup.supp_name}</option>
                        </c:forEach>
                    </select>
                </div>
                
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Upload Photo</span>
                    <input type="file" class="form-control" id="pro_photo" name="pro_photo" accept="image/*" required> 
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
                    var formData = new FormData(this);
                    console.log(formData);
                        getHTMLResponsevidafileupload("/add_products", formData)
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