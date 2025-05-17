/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.DAO;

import com.Entity.OrderItem;
import java.util.List;

/**
 *
 * @author sadit
 */
public interface OrderItemDAO {
    	
	public boolean addOrderItem(int orderId, int productId, int quantity);
	
	public List<OrderItem> getItemsByOrderId(int orderId);
}
