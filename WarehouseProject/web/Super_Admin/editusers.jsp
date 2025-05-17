<%-- 
    Document   : editusers
    Created on : May 15, 2025, 10:24:38 AM
    Author     : sadit
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
                rights = seession_user.uvalidate("SU"); //Modify Here
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

    <%@page import="com.DAO.userDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.Entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/Dashboard/msg.jsp" %>
          			<%
			int user_id = Integer.parseInt(request.getParameter("id"));

			userDAOImpl dao=new userDAOImpl(DBConnect.getConn());
			User us=dao.getUserById(user_id);
			%>
<div class="card">
      <h5 class="card-header text-center">Edit User : <%=us.getUsername() %></h5>
      <div class="card-body">

          <form id="form" enctype="multipart/form-data">
              <div class="input-group mb-3">
                <label for="staticEmail" class="col-sm-2 col-form-label">User ID: </label>
                <div class="col-sm-10">
                    <input id="user_id" name="user_id" type="text" readonly class="form-control-plaintext" value="<%=us.getUserId() %>" required>
                </div>
              </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Full Name</span>
                    <input id="name" name="name" type="text" class="form-control" placeholder="Full Name" aria-label="Username" aria-describedby="basic-addon1" value="<%=us.getName() %>" required>
                </div>
              
                <div class="input-group mb-3">
                   <span class="input-group-text" id="basic-addon1">User Role</span>
                    <select class="form-select" id="role" name="role"  required>
				  <%
				    String role = us.getRole();
				  %>
                        <option value="" disabled><%= role%></option>
                        <option value="Manager">Manager</option>
                        <option value="Warehouse_Manager">Warehouse Manager</option>
                        <option value="Supplier_Manager">Supplier Manager</option>
                    </select>
                   <span class="input-group-text" id="basic-addon1">User Status</span>
                    <select class="form-select" id="userStatus" name="status"  required>
						<%
						if ("active".equals(us.getStatus())) {
						%>
						  <option value="active">Active</option>
						  <option value="inactive">Inactive</option>
						<%
						} else {
						%>
						  <option value="inactive">Inactive</option>
						  <option value="active">Active</option>
						<%
						}
						%>
                    </select>
                </div>
              
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Telephone</span>
                    <input id="telephone" name="telephone" type="text" class="form-control" placeholder="Telephone" aria-label="Username" aria-describedby="basic-addon1" value="<%=us.getTelephone() %>" required>
                    
                    <span class="input-group-text" id="basic-addon1">Email</span>
                    <input id="email" name="email" type="email" class="form-control" placeholder="Email" aria-label="Username" aria-describedby="basic-addon1" value="<%=us.getEmail() %>" required>
                </div>
                
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">User Name</span>
                    <input id="username" name="username" type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" value="<%=us.getUsername() %>" required>
                    
                    <span class="input-group-text" id="basic-addon1">Password</span>
                    <input id="password" name="password" type="password" class="form-control" placeholder="password" aria-label="Username" aria-describedby="basic-addon1" value="<%=us.getPassword() %>" required>
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Upload Photo</span>
                    <input type="file" class="form-control" id="userPhoto" name="userPhoto" accept="image/*" required> 
                </div>
                
            <div class="text-end">
                <button id="submitButton" type="submit" class="btn btn-primary">Submit</button>
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
                        getHTMLResponsevidafileupload("/editUsers", formData)
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
