/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.Entity.OrderItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
        
        	public List<OrderItem> getItemsByOrderId(int orderId) {
		
	    List<OrderItem> list = new ArrayList<>();
	    
	    
	    
	    try  {
	    	
	    	String sql = "SELECT * FROM order_items WHERE order_id = ?";
	    	
	    	PreparedStatement ps=conn.prepareStatement(sql);
	    	
	        ps.setInt(1, orderId);
	        
	        ResultSet rs = ps.executeQuery();
	        
	        while (rs.next()) {
	        	
	            OrderItem item = new OrderItem();
	            item.setProductId(rs.getInt("product_id"));
	            item.setQuantity(rs.getInt("quantity"));
	            list.add(item);
	            
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return list;
	}
    
}
