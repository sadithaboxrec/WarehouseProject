<%-- 
    Document   : viewlocation
    Created on : May 16, 2025, 7:52:45 PM
    Author     : DELL
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.Entity.User"%>


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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Categories </title>
    </head>
    <body>
        
        <%@ include file="/Dashboard/msg.jsp" %>
        
    <div class="card">
        <h5 class="card-header text-center">Warehouse store Locations</h5>
        <div class="card-body">
            <table class="table table-hover">
                        <thead>
                            <tr>
                              <th scope="col">Id</th>
                              <th scope="col">Location Name</th>
                              <th scope="col">Status</th>
                              <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
		  
		  <% 
		  StklocationDAO dao=new StklocationDAO(DBConnect.getConn());
		  List<stcklocation> list= dao.getlockations();
                  
		  for(stcklocation loc:list){
			  %>
			 
			<tr>
			  <td><%=loc.getLocId() %></td>
		      <td> <%=loc.getLocName()  %> </td>
                      
                     <% if(loc.getLocStatus().equals("active")){%>
                        <td><span class="badge text-bg-success"><%= loc.getLocStatus() %></span></td>
                     <%
                         }else{ %>
                        <td><span class="badge text-bg-danger"><%= loc.getLocStatus() %></span></td>
                     <%
                         }
                     %>
                      
		      <td>
                          <button type="button" class="btn btn-warning" id="butedt<%=loc.getLocId()%>">Edit</button>


		      </td>
		    </tr>
			  
			  <%
		  }
		  %>
    </body>
</html>


