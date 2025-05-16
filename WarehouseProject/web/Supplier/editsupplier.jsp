<%-- 
    Document   : editsupplier
    Created on : May 15, 2025, 1:06:12 PM
    Author     : DELL
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%@ page import="com.DAO.SupplierDAOImpl" %>

<%@page import="com.DB.DBConnect"%>
<%@page import="com.Entity.Supplier"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Category</title>
    </head>
    <body>
<%@ include file="/Dashboard/msg.jsp" %>
        			
			<%
			   int id=Integer.parseInt(request.getParameter("id"));
			SupplierDAOImpl dao=new SupplierDAOImpl(DBConnect.getConn());
			Supplier s=dao.getSupplierById(id);
			%>
                        
    <div class="card">
        <h5 class="card-header text-center">Edit Supplier</h5>
        <div class="card-body">
            <form id="form">
                    <div class="input-group mb-3">
                      <label for="staticEmail" class="col-sm-2 col-form-label">Supplier ID: </label>
                      <div class="col-sm-10">
                          <input id="id" name="id" type="text" readonly class="form-control-plaintext" value="<%=s.getSupp_id() %>" required>
                      </div>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Supplier Name</span>
                        <input id="supp_name" name="supp_name" type="text" class="form-control" placeholder="Supplier Name" aria-label="Supplier Name" aria-describedby="basic-addon1" value="<%=s.getSupp_name() %>" required>
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Email</span>
                        <input id="supp_email" name="supp_email" type="email" class="form-control" placeholder="Email" aria-label="Email" aria-describedby="basic-addon1" value="<%=s.getSupp_email() %>" required>

                        <span class="input-group-text" id="basic-addon1">Contact number</span>
                        <input id="supp_cno" name="supp_cno" type="tel" class="form-control" placeholder="Contact number" aria-label="Contact number" aria-describedby="basic-addon1" value="<%=s.getSupp_cno() %>" required>
                    </div>

                <div class="text-end">
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
            </form>
        </div>
    </div>        


    </body>
</html>
