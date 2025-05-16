package com.order.servlet;

import com.DAO.CategoryDAOImpl;
import com.DAO.OrderDAOImpl;
import com.DAO.OrderItemDAOImpl;
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
OrderDAOImpl orderDAO = new OrderDAOImpl(DBConnect.getConn());  
	    OrderItemDAOImpl itemDAO = new OrderItemDAOImpl(DBConnect.getConn());  

	    
	    List<Products> productList = productDAO.getProductsBySupplier(supplierId);

	    
	    int orderId = orderDAO.createOrder(supplierId);  
            	    int dispitems = 0;
	   
	    for (Products p : productList) {
	        String paramName = "qty_" + p.getPro_id();
	        String qtyStr = request.getParameter(paramName);

	        if (qtyStr != null && !qtyStr.isEmpty()) {
	            int qty = Integer.parseInt(qtyStr);
	            if (qty > 0) {
	                
                        if(itemDAO.addOrderItem(orderId, p.getPro_id(), qty)){
                            dispitems++;
                        }
	                
	            }
	        }
	    }
            if (dispitems>0) {
                request.setAttribute("SuccessMsg", "Orders successfully Sent");

                List<Order> orderList = orderDAO.getAllOrders();  
                request.setAttribute("orderList", orderList);
                request.getRequestDispatcher("Order/vieworders.jsp").forward(request, response);
                
	    } else {
                SupplierDAOImpl supplierDAO = new SupplierDAOImpl(DBConnect.getConn());
                List<Supplier> supplierList = supplierDAO.getSupplier();
                request.setAttribute("supplierList", supplierList);
                request.setAttribute("failedMsg", "No Orders were sent");
                request.getRequestDispatcher("Order/addorder.jsp").forward(request, response);
	    }
            

            


	}

}
