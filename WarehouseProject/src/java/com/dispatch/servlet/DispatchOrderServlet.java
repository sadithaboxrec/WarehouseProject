package com.dispatch.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import com.DAO.CategoryDAOImpl;
import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.Entity.Products;


@WebServlet("/send_order")
public class DispatchOrderServlet extends HttpServlet {
    Logger logger = Logger.getLogger("send_order");
	private static final long serialVersionUID = 1L;
       

    public DispatchOrderServlet() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String catIdParam = request.getParameter("cat_id");

        CategoryDAOImpl categoryDAO = new CategoryDAOImpl(DBConnect.getConn());
        ProductDAOImpl productDAO = new ProductDAOImpl(DBConnect.getConn());

        if (catIdParam != null) {
            logger.severe("cat_id available");
            int catId = Integer.parseInt(catIdParam);
            String catname = categoryDAO.getCategoryById(catId).getCategoryName();
            List<Products> productList = productDAO.getProductsByCategory(catId);
            request.setAttribute("productList", productList);
            request.setAttribute("categoryName", catname);
            request.setAttribute("categoryId", catId);
            request.getRequestDispatcher("Dispatch/sendproducts.jsp").forward(request, response);
        } else {
            logger.severe("cat_id not available");
            request.setAttribute("categoryList", categoryDAO.getCategory());
            request.getRequestDispatcher("Dispatch/selectcategory.jsp").forward(request, response);
        }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
