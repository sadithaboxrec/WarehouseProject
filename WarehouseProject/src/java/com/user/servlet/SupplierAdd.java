package com.supplier.servlet;

import com.DAO.SupplierDAOImpl;
import com.DB.DBConnect;
import com.Entity.Supplier;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/add_supplier")
public class SupplierAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String supp_name = request.getParameter("supp_name");
            String supp_email = request.getParameter("supp_email");
            String supp_cno = request.getParameter("supp_cno");
            
            Supplier s= new Supplier(supp_name,supp_email,supp_cno);
            System.out.println(s);
            
            SupplierDAOImpl dao = new SupplierDAOImpl(DBConnect.getConn());
            boolean f = dao.addSupplier(s);
                        
            if (f) {
                request.setAttribute("SuccessMsg", "Supplier Added Successfully");
                request.getRequestDispatcher("Suppliers/viewsupplier.jsp").forward(request, response);
            } else {
                request.setAttribute("failedMsg", "Something went wrong on server");
                request.getRequestDispatcher("Suppliers/viewsupplier.jsp").forward(request, response);
            }
    
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}

