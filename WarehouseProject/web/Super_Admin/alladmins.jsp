<%-- 
    Document   : allAdmins
    Created on : May 15, 2025, 10:22:40 AM
    Author     : sadit
--%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!-- User Roll Validation -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.Entity.User"%>



    <%@page import="com.DAO.userDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%@ include file="/Dashboard/msg.jsp" %>
            <div class="card">
            <h5 class="card-header text-center">User List</h5>
            <div class="card-body">
        <table class="table table-hover">
            <thead>
                <tr>
                  <th scope="col">Id</th>
                  <th scope="col">Photo</th>
                  <th scope="col">Username</th>
                  <th scope="col">Name</th>
                  <th scope="col">Email</th>
                  <th scope="col">Telephone</th>
                  <th scope="col">Role</th>
                  <th scope="col">Status</th>
                  <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                
		  
		  <% 
		  userDAOImpl dao=new userDAOImpl(DBConnect.getConn());
		  List<User> list= dao.getAllAdmins();
		  
		  for(User us:list){
			  %>
			 
			<tr>
                    <td><%=us.getUserId() %></td>
                    <td> <img class="d-block mx-auto img-fluid" src="../images/users/<%=us.getPhotoName() %>" onerror=this.src='../images/users/user.png' style="width:50px; height:50px;""> </td>      
		    <td> <%=us.getUsername() %> </td>
		    <td> <%=us.getName() %></td>
		    <td> <%=us.getEmail() %></td>
		    <td> <%=us.getTelephone() %></td>
                    <td><%=us.getRole() %> </td>
                     <% if(us.getStatus().equals("active")){%>
                        <td><span class="badge text-bg-success"><%= us.getStatus() %></span></td>
                     <%
                         }else{ %>
                        <td><span class="badge text-bg-danger"><%= us.getStatus() %></span></td>
                     <%
                         }
                     %>
                      


		      <td>
                          <button type="button" class="btn btn-warning" id="butedtuser<%=us.getUserId()%>">Edit Info</button>
                          

		      </td>
		    </tr>
			  
			  <%
		  }
		  %>


		  </tbody>
		</table>
        </div>
    </div>
</body>
</html>