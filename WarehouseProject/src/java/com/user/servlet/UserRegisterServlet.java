package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;


import com.DAO.userDAOImpl;
import com.DB.DBConnect;
import com.Entity.User;


@WebServlet("/userRegister")
@MultipartConfig

public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
	        String name = request.getParameter("name");
	        String email = request.getParameter("email");
	        String telephone = request.getParameter("telephone");
	        String role = request.getParameter("role");
	        String status = request.getParameter("status");
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        String check = request.getParameter("check");
	        
			Part part=request.getPart("userPhoto");
			String fileName=part.getSubmittedFileName();
			
//			int userroleId = 0;
//			Connection conn = DBConnect.getConn();
//			PreparedStatement psRole = conn.prepareStatement("SELECT userrole_id FROM user_role WHERE role_name = ?");
//			psRole.setString(1, role);
//			ResultSet rs = psRole.executeQuery();
//			if (rs.next()) {
//			    userroleId = rs.getInt("userrole_id");
//			}
			
			User us = new User(name, email, telephone, status, username, password, fileName,role);
			userDAOImpl dao=new userDAOImpl(DBConnect.getConn());
			boolean f=dao.userRegister(us);
			
			
			if(f) {
				  String path=getServletContext().getRealPath("")+"images/users";
				  System.out.println(path);
				  
				  File file=new File(path);
				  part.write(path + File.separator+ fileName);
				
				request.setAttribute("SuccessMsg", "User Added Successfully");
                                request.getRequestDispatcher("Super_Admin/addUsers.jsp").forward(request, response);

			}else {
				request.setAttribute("failedMsg", "Something wrong on Server");
                                request.getRequestDispatcher("Super_Admin/addUsers.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
