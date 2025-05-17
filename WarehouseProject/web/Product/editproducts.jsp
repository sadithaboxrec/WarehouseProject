<%-- 
    Document   : editproducts
    Created on : May 16, 2025, 3:08:12 PM
    Author     : USER
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.Entity.User"%>


<%@page isELIgnored="false" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product : ${product.pro_name}</title>
</head>
<body>
<%@ include file="/Dashboard/msg.jsp" %>    
   
    <div class="card">
        <h5 class="card-header text-center">Edit Product : ${product.pro_name}</h5>
        <div class="card-body">
             <form id="form" enctype="multipart/form-data">
                <div class="input-group mb-3">
                  <label for="staticEmail" class="col-sm-2 col-form-label">Product ID: </label>
                  <div class="col-sm-10">
                      <input id="pro_id" name="pro_id" type="text" readonly class="form-control-plaintext" value="${product.pro_id}" required>
                  </div>
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Product Name</span>
                    <input id="pro_name" name="pro_name" type="text" class="form-control" placeholder="Product Name" aria-label="Product Name" aria-describedby="basic-addon1" value="${product.pro_name}" required>
                
                    <span class="input-group-text" id="basic-addon1">Stock</span>
                    <input id="pro_stock" name="pro_stock" type="number" class="form-control" placeholder="Product Name" aria-label="Product Name" aria-describedby="basic-addon1" value="${product.pro_stock}" required>
                </div>
              
                <div class="input-group mb-3">
                   <span class="input-group-text" id="basic-addon1">Product Category</span>
                    <select class="form-select" id="pro_category" name="pro_category"  required>
                        <option value="" disabled selected>${product.pro_category}</option>
                        <c:forEach var="cat" items="${categoryList}">
                            <option value="${cat.categoryId}">${cat.categoryName}</option>
                        </c:forEach>
                    </select>
                    <span class="input-group-text" id="basic-addon1">Product Supplier</span>
                    <select class="form-select" id="pro_supplier" name="pro_supplier"  required>
                        <option value="" disabled selected>${product.pro_supplier}</option>
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
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
            </form>
        </div>
    </div>

        
</body>
</html>