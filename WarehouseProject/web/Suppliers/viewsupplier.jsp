<%-- 
    Document   : viewsupplier
    Created on : May 15, 2025, 9:36:33 PM
    Author     : DELL
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<%@page isELIgnored="false" %>

<%@page import="com.DAO.SupplierDAOImpl" %>

<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.Entity.Supplier"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Categories </title>
    </head>
    <body>
        <%@ include file="/Dashboard/msg.jsp" %>
        
        <div class="card">
            <h5 class="card-header text-center">Suppliers</h5>
            <div class="card-body">
                <table class="table table-hover">
                        <thead>
                            <tr>
                              <th scope="col">Id</th>
                              <th scope="col">Name</th>
                              <th scope="col">Email</th>
                              <th scope="col">Contact Number</th>
                              <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
		  
		  <% 
		  SupplierDAOImpl dao=new SupplierDAOImpl(DBConnect.getConn());
		  List<Supplier> list= dao.getSupplier();
		  
		  for(Supplier s:list){
			  %>
			 
                    <tr>
                        <td><%= s.getSupp_id() %></td>
                        <td><%= s.getSupp_name() %></td>
                        <td><%= s.getSupp_email() %></td>
                        <td><%= s.getSupp_cno() %></td>
                        <td>
                            <button type="button" class="btn btn-warning" id="butedt<%=s.getSupp_id()%>">Edit</button>


                        </td>
                    </tr>

			  
			  <%
		  }
		  %>
                </table>
    </body>
</html>
