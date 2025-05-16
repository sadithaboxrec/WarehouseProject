package com.order.servlet;

import com.DAO.CategoryDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


import com.DAO.ProductDAOImpl;
import com.DAO.SupplierDAO;
import com.DAO.SupplierDAOImpl;
import com.DB.DBConnect;
import com.Entity.Order;
import com.Entity.Products;
import com.Entity.Supplier;


@WebServlet("/submit_order")
public class submit_order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public submit_order() {
        super();   
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int supplierId = Integer.parseInt(request.getParameter("supplierId"));

	    ProductDAOImpl productDAO = new ProductDAOImpl(DBConnect.getConn());

            


	}

}
