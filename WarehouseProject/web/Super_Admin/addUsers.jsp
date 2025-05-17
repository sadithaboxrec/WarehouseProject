<%-- 
    Document   : addUsers
    Created on : May 15, 2025, 10:19:49?AM
    Author     : sadit
--%>

<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/Dashboard/msg.jsp" %>
    
<div class="card">
      <h5 class="card-header text-center">User Registration Form</h5>
      <div class="card-body">
          <form id="form" enctype="multipart/form-data">
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Full Name</span>
                    <input id="name" name="name" type="text" class="form-control" placeholder="Full Name" aria-label="Username" aria-describedby="basic-addon1">
                </div>
              
                <div class="input-group mb-3">
                   <span class="input-group-text" id="basic-addon1">User Role</span>
                    <select class="form-select" id="role" name="role"  required>
			<option value="">--Select Role--</option>
                        <option value="Manager">Manager</option>
                        <option value="Warehouse_Manager">Warehouse Manager</option>
                        <option value="Supplier_Manager">Supplier Manager</option>
                    </select>
                   <span class="input-group-text" id="basic-addon1">User Status</span>
                    <select class="form-select" id="userStatus" name="status"  required>
                        <option selected>--Select--</option>
                        <option value="active">Active</option>
                        <option value="inactive">Inactive</option>
                    </select>
                </div>
              
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Telephone</span>
                    <input id="telephone" name="telephone" type="text" class="form-control" placeholder="Telephone" aria-label="Username" aria-describedby="basic-addon1">
                    
                    <span class="input-group-text" id="basic-addon1">Email</span>
                    <input id="email" name="email" type="email" class="form-control" placeholder="Email" aria-label="Username" aria-describedby="basic-addon1">
                </div>
                
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">User Name</span>
                    <input id="username" name="username" type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                    
                    <span class="input-group-text" id="basic-addon1">Password</span>
                    <input id="password" name="password" type="password" class="form-control" placeholder="password" aria-label="Username" aria-describedby="basic-addon1">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Upload Photo</span>
                    <input type="file" class="form-control" id="userPhoto" name="userPhoto" accept="image/*" required> 
                </div>
                
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Adding the User Confirmed</span>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Confirmed</label>
                </div>

                </div>
                
            <div class="text-end">
                <button type="submit" class="btn btn-primary">Create</button>
            </div>
             
        </form>
    </div>
</div>

      
                          
</body>
</html>