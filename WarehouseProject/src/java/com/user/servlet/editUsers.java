package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAO.userDAOImpl;
import com.DB.DBConnect;
import com.Entity.User;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.logging.Logger;


@WebServlet("/editUsers")
@MultipartConfig(
    fileSizeThreshold   = 1024 * 1024 * 50,  // 1MB
    maxFileSize         = 1024 * 1024 * 50,  // 5MB
    maxRequestSize      = 1024 * 1024 * 50 // 10M
)
public class editUsers extends HttpServlet {
    Logger logger = Logger.getLogger("editUsers");
	private static final long serialVersionUID = 1L;
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		try {
			
			
			int userId = Integer.parseInt(request.getParameter("user_id"));

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String telephone = request.getParameter("telephone");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String status = request.getParameter("status");
			String roleName = request.getParameter("role");
                        
                        Part tmppart=request.getPart("userPhoto");
			String fileName=tmppart.getSubmittedFileName();

			
			int roleId = 0;
			switch (roleName) {
				case "Manager":
					roleId = 1;
					break;
				case "Warehouse_Manager":
					roleId = 2;
					break;
				case "Supplier_Manager":
					roleId = 3;
					break;
			}

			// Create User object and set data
			User us = new User();
			us.setUserId(userId);
			us.setName(name);
			us.setEmail(email);
			us.setTelephone(telephone);
			us.setUsername(username);
			us.setPassword(password);
			us.setStatus(status);
                        us.setPhotoName(fileName);
                        us.setRole(roleName);

			
			userDAOImpl dao = new userDAOImpl(DBConnect.getConn());
			boolean success = dao.updateUsers(us);

			if (success) {
                            
                            	String path = getServletContext().getRealPath("") + "images"+File.separator+"users";
				System.out.println("Upload Path: " + path);
                                
                                         String uploadPath = getServletContext().getRealPath("") + "images"+File.separator+"users";
         
                                        File uploadDir = new File(uploadPath);
                                        if (!uploadDir.exists()) {
                                            uploadDir.mkdirs();
                                        }

                                        try {

                                            for (Part part : request.getParts()) {
                                                if ("userPhoto".equals(part.getName())) {
                                                     logger.severe("upload: ");
//                                                                String mimeType = part.getContentType();

                                                String filePath = uploadPath +File.separator+ fileName;
                                                try (InputStream fileContent = part.getInputStream()) {
                                                    Files.copy(fileContent, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
                                                    request.setAttribute("done", "File uploaded successfully!");
                                                    logger.severe("File uploaded successfully!");
                                                } catch (Exception ex) {
                                                    request.setAttribute("error", "File upload failed: " + ex.getMessage());
                                                    logger.severe("File upload failed:"+ ex);
                                                }
                                                }
                                            }


                                        } catch (Exception e) {
                                            request.setAttribute("error", "File upload failed: " + e.getMessage());
                                            logger.severe("File upload failed: " + e.getMessage());
                                        }
                            
				request.setAttribute("SuccessMsg", "User updated successfully!");
                                request.getRequestDispatcher("Super_Admin/alladmins.jsp").forward(request, response);
			} else {
				request.setAttribute("failedMsg", "Something went wrong while updating user.");
                                request.getRequestDispatcher("Super_Admin/editusers.jsp?id=" + userId).forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
