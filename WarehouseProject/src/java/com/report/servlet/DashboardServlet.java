/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.report.servlet;

import com.DAO.CategoryDAOImpl;
import com.DAO.DispatchDAOImpl;
import com.DAO.OrderDAOImpl;
import com.DAO.ProductDAOImpl;
import com.DAO.SupplierDAO;
import com.DAO.SupplierDAOImpl;
import com.DB.DBConnect;
import com.Entity.Products;

import java.sql.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author sadit
 */
@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection conn = DBConnect.getConn();

        ProductDAOImpl productDAO = new ProductDAOImpl(conn);
        CategoryDAOImpl categoryDAO = new CategoryDAOImpl(conn);
        OrderDAOImpl orderDAO = new OrderDAOImpl(conn);
        DispatchDAOImpl dispatchDAO = new DispatchDAOImpl(conn);
        SupplierDAOImpl supplierDAO = new SupplierDAOImpl(conn);

        int totalProducts = productDAO.getTotalProducts();
        int lowStock = productDAO.getProductsBelowQuantity(10);
        int activeCategories = categoryDAO.getActiveCategories();
        int incompleteOrders = orderDAO.getIncompleteOrders();
        int unshippedDispatches = dispatchDAO.getUnshippedDispatches();
        int suppliers = supplierDAO.getSuppliers();

        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("lowStock", lowStock);
        request.setAttribute("activeCategories", activeCategories);
        request.setAttribute("incompleteOrders", incompleteOrders);
        request.setAttribute("unshippedDispatches", unshippedDispatches);
        request.setAttribute("suppliers", suppliers);
        
        List<Products> lowStockProducts = productDAO.getProductsBelowStock(100);

        request.setAttribute("lowStockProducts", lowStockProducts);

    
        //response.sendRedirect(request.getContextPath()+"/Dashboard/");
        
        request.getRequestDispatcher(request.getContextPath()+"/welcome/welcome.jsp").forward(request, response);
       
      // request.getRequestDispatcher("/Dashboard/index.jsp").forward(request, response); 

    }

}
