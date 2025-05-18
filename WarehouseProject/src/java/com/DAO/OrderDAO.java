/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.DAO;

/**
 *
 * @author sadit
 */


import java.util.List;

import com.Entity.Products;
import com.Entity.Order;

public interface OrderDAO {
	
	public int createOrder(int supplierId);
	
	public boolean markAsReceived(int orderId);
	
	public List<Order> getAllOrders();

}
