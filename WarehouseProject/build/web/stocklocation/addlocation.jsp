<%-- 
    Document   : addlocation
    Created on : May 16, 2025, 7:51:07 PM
    Author     : DELL
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.Entity.User"%>


<%@page isELIgnored="false" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD Warehouse Store Location</title>
    </head>
    <body>
        
<%@ include file="/Dashboard/msg.jsp" %>
        
    <div class="card">
        <h5 class="card-header text-center">Add warehouse store Location</h5>
        <div class="card-body">
            <form id="form">
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Location Name</span>
                    <input id="stcklocationName" name="stcklocationName" type="text" class="form-control" placeholder="Location Name" aria-label="Location Name" aria-describedby="basic-addon1" required>
                </div>
                
                <div class="input-group mb-3">
                   <span class="input-group-text" id="basic-addon1">Location Status</span>
                    <select class="form-select" id="stcklocationstatus" name="stcklocationstatus" required>
                        <option value="" disabled selected>--Select--</option>
                        <option value="active">Active</option>
                        <option value="inactive">Inactive</option>
                    </select>
                </div>
                
                <div class="text-end">
                    <button type="submit" class="btn btn-primary">Create</button>
                </div>
            </form>
        </div>
    </div>


        
        
    </body>
</html>

