package com.dispatch.servlet;

import com.DAO.CategoryDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import com.DAO.DispatchDAOImpl;
import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.Entity.Products;


@WebServlet("/dispatchproducts")
public class SendProductServlet extends HttpServlet {
    Logger logger = Logger.getLogger("dispatchproducts");
	private static final long serialVersionUID = 1L;
       
 
    public SendProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		String destination = request.getParameter("destination");
//        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
//
//        ProductDAOImpl productDAO = new ProductDAOImpl(DBConnect.getConn());
//        DispatchDAOImpl dispatchDAO = new DispatchDAOImpl(DBConnect.getConn());
//
//        List<Products> productList = productDAO.getProductsByCategory(categoryId);
//
//        boolean atLeastOneSent = false;
//
//        for (Products p : productList) {
//            String paramName = "qty_" + p.getPro_id();
//            String qtyStr = request.getParameter(paramName);
//
//            if (qtyStr != null && !qtyStr.isEmpty()) {
//                int qty = Integer.parseInt(qtyStr);
//
//                if (qty > 0 && p.getPro_stock() >= qty) {
//                    boolean sent = dispatchDAO.sendProduct(p.getPro_id(), qty, destination);
//                    if (sent) {
//                        atLeastOneSent = true;
//                    }
//                }
//            }
//        }
//
//        if (atLeastOneSent) {
//            response.sendRedirect("Dispatch/dispatchsuccess.jsp");
//        } else {
//            response.sendRedirect("Dispatch/dispatcherror.jsp");
//        }
//        
//	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    String destination = request.getParameter("destination");
	    int categoryId = Integer.parseInt(request.getParameter("categoryId"));

	    ProductDAOImpl productDAO = new ProductDAOImpl(DBConnect.getConn());
	    DispatchDAOImpl dispatchDAO = new DispatchDAOImpl(DBConnect.getConn());

	    List<Products> productList = productDAO.getProductsByCategory(categoryId);

	    int dispitems = 0;

	    for (Products p : productList) {
	        String paramName = "qty_" + p.getPro_id();
	        String qtyStr = request.getParameter(paramName);

	        if (qtyStr != null && !qtyStr.isEmpty()) {
	            int qty = Integer.parseInt(qtyStr);

	            if (qty > 0) {
	                
	                boolean created = dispatchDAO.createDispatch(p.getPro_id(), qty, destination);
	                if (created) {
                            dispitems++;
                            logger.severe(""+dispitems);
	                }
	            }
	        }
	    }

	    if (dispitems>0) {
                logger.severe("SuccessMsg");
                request.setAttribute("SuccessMsg", "Products successfully dispatched to store!");
                
	    } else {
                logger.severe("failedMsg");
                request.setAttribute("failedMsg", "No products were sent. Please check quantities or stock availability.");
	    }
            CategoryDAOImpl categoryDAO = new CategoryDAOImpl(DBConnect.getConn());
            request.setAttribute("categoryList", categoryDAO.getCategory());
            request.getRequestDispatcher("Dispatch/selectcategory.jsp").forward(request, response);
	}
}


