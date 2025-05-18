/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.Entity.Order;

/**
 *
 * @author sadit
 */
public class OrderDAOImpl implements OrderDAO {
    
    	private Connection conn;

	public OrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

        
        	@Override
	public int createOrder(int supplierId) {
		
		int orderId = 0;
		
		try {
			String sql = "INSERT INTO orders (supplier_id, order_date, status) VALUES (?, NOW(), 'pending')";
			
			PreparedStatement ps=conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, supplierId);
			ps.executeUpdate();
			
			 ResultSet rs = ps.getGeneratedKeys();
		        if (rs.next()) {
		            orderId = rs.getInt(1);
		        }
		} catch (Exception e) {
			e.printStackTrace();
		}

		return orderId;
	}
	
	
	
	public boolean markAsReceived(int orderId) {
		
	    try {
		    String sql = "UPDATE orders SET status = 'received' WHERE order_id = ?";
		    PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, orderId);
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
	
	public List<Order> getAllOrders() {
		
	    List<Order> list = new ArrayList<>();
	    


	    try {
		  //  String sql = "SELECT * FROM orders ORDER BY order_date DESC";
                  
                String sql = "SELECT o.*, s.supp_name FROM orders o JOIN supplier s ON"
                        + " o.supplier_id = s.supp_id ORDER BY o.order_date DESC";
		    PreparedStatement ps = conn.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();
	        
	        while (rs.next()) {
	        	
	            Order o = new Order();
	            o.setOrderId(rs.getInt("order_id"));
	            o.setSupplierId(rs.getInt("supplier_id"));
                    o.setSupplierName(rs.getString("supp_name"));
	            o.setOrderDate(rs.getString("order_date"));
	            o.setStatus(rs.getString("status"));
	            list.add(o);
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}


            public int getIncompleteOrders() {
                int count = 0;
                try {
                    String sql = "SELECT COUNT(*) FROM orders WHERE status != 'received'";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        count = rs.getInt(1);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return count;
        }
            
            
            
            

}
