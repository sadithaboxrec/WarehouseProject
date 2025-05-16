/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author sadit
 */
public class OrderItemDAOImpl {
    
    	
	private Connection conn;

	public OrderItemDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	
	public boolean addOrderItem(int orderId, int productId, int quantity) {
		
		try {
			
			String sql = "INSERT INTO order_items (order_id, product_id, quantity) VALUES (?, ?, ?)";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setInt(1, orderId);
	        ps.setInt(2, productId);
	        ps.setInt(3, quantity);
                if(ps.executeUpdate()==1){
                    return true;
                }else{
                    return false;
                }
		} catch (Exception e) {
			e.printStackTrace();
		}
                return false;
	}
	
    
}
