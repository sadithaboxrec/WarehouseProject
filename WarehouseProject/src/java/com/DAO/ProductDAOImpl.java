/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Entity.Products;

/**
 *
 * @author HP
 */
public class ProductDAOImpl implements ProductDAO {
	
	private Connection conn;
	
	

	public ProductDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	

	public boolean addProducts(Products p) {
		
		boolean f=false;
		
		try {
			
			String sql=" INSERT INTO products (pro_name, pro_category, pro_supplier, pro_stock, pro_photo, user)  values (?,?,?,?,?,?)"; 
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, p.getPro_name());
			ps.setInt(2, p.getPro_category());
			ps.setInt(3, p.getPro_supplier());
			ps.setInt(4, p.getPro_stock());
			ps.setString(5, p.getPro_photo());
			ps.setString(6, p.getUser());
			

            int i= ps.executeUpdate();
            
            if(i==1) {
            	f=true;
            }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
        
        public boolean editProducts(Products p) {
		
		boolean f=false;
		
		try {
			
			String sql=" UPDATE `products` SET `pro_name` = ?, `pro_category` = ?, `pro_supplier` = ?, `pro_stock` = ?, `pro_photo` = ?, `user` = ? WHERE (`pro_id` = ?);"; 
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, p.getPro_name());
			ps.setInt(2, p.getPro_category());
			ps.setInt(3, p.getPro_supplier());
			ps.setInt(4, p.getPro_stock());
			ps.setString(5, p.getPro_photo());
			ps.setString(6, p.getUser());
                        ps.setInt(7, p.getPro_id());
			

            int i= ps.executeUpdate();
            
            if(i==1) {
            	f=true;
            }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
        

	
	
	public List <Products> getAllProducts() {
		
		List <Products> list=new ArrayList<Products>();
		
		
		Products p=null;
		
			  try {
				  String sql = "SELECT * " +
				             "FROM products p " +
				             "JOIN category c ON p.pro_category = c.categoryId " +
				             "JOIN supplier s ON p.pro_supplier = s.supp_id " +  
				             "ORDER BY p.pro_id ASC"; 

				  
				  PreparedStatement ps=conn.prepareStatement(sql);
				  
				  ResultSet rs=ps.executeQuery(); 
				  
				  while(rs.next()) 
				  {
					  
					 p = new Products();
					 p.setPro_id(rs.getInt(1));
					 p.setPro_name(rs.getString(2));
					 p.setPro_category(rs.getInt(3));
					 p.setPro_supplier(rs.getInt(4));
					 p.setPro_stock(rs.getInt(5));
					 p.setPro_photo(rs.getString(6));
					 p.setUser(rs.getString(7));
					 
			            p.setCategoryName(rs.getString("categoryName"));
			            p.setSuppName(rs.getString("supp_name"));
					  list.add(p);
				  }
				  
				  
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return list;
	}
	
	
	public List<Products> getProductsBySupplier(int pro_supplier){
		
		List<Products> list = new ArrayList<>();
		
		Products p=null;
		
		try {
			
			String sql = "SELECT * FROM products WHERE pro_supplier = ?";
			
			  PreparedStatement ps=conn.prepareStatement(sql);
			  ps.setInt(1, pro_supplier);
			  ResultSet rs=ps.executeQuery(); 
			  
			  while (rs.next()) {
				     
				    p = new Products();
				  
		            p.setPro_id(rs.getInt(1)); 
		            p.setPro_name(rs.getString(2));
		            p.setPro_stock(rs.getInt(5));
		            p.setPro_photo(rs.getString(6));
		            p.setPro_supplier(rs.getInt(4));

		            list.add(p);
		        }
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
        	public Products getProductById(int pro_id){
		
		Products p=null;
		
		try {
			
			String sql = "SELECT * FROM products WHERE pro_id = ?";
			
			  PreparedStatement ps=conn.prepareStatement(sql);
			  ps.setInt(1, pro_id);
			  ResultSet rs=ps.executeQuery(); 
			  
			  while (rs.next()) {
				     
                            p = new Products();
				  
		            p.setPro_id(rs.getInt(1)); 
		            p.setPro_name(rs.getString(2));
		            p.setPro_stock(rs.getInt(5));
		            p.setPro_photo(rs.getString(6));
		            p.setPro_supplier(rs.getInt(4));
		        }
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return p;
		
	}
	
	
	public void increaseStock(int productId, int qty) {
		
	    try  {
	    	
		    String sql = "UPDATE products SET pro_stock = pro_stock + ? WHERE pro_id = ?";
	    	
	    	PreparedStatement ps=conn.prepareStatement(sql);
	    	
	        ps.setInt(1, qty);
	        ps.setInt(2, productId);
	        ps.executeUpdate();
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	
	
	
	public List<Products> getProductsByCategory(int catId) {
		
	    List<Products> list = new ArrayList<>();
	    
	    try {
	        String sql = "SELECT * FROM products WHERE pro_category = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        
	        ps.setInt(1, catId);
	        
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Products p = new Products();
	            p.setPro_id(rs.getInt("pro_id"));
	            p.setPro_name(rs.getString("pro_name"));
	            p.setPro_stock(rs.getInt("pro_stock"));
	            p.setPro_photo(rs.getString("pro_photo"));
	            p.setPro_supplier(rs.getInt("pro_supplier"));
	            list.add(p);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	
	       // for Dashboard
        
            public int getTotalProducts() {
                int count = 0;
                try {
                    String sql = "SELECT COUNT(*) FROM products";
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

        public int getProductsBelowQuantity(int threshold) {
            int count = 0;
            try {
                String sql = "SELECT COUNT(*) FROM products WHERE pro_stock < ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, threshold);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return count;
        }

        
        
        public List<Products> getProductsBelowStock(int threshold) {
    List<Products> productList = new ArrayList<>();
    Products p=null;
    try {
        String sql = "SELECT p.*, s.supp_name FROM products p JOIN supplier s ON"
                + " p.pro_supplier = s.supp_id WHERE p.pro_stock < ?";


        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, threshold);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            p = new Products();
            
            p.setPro_name(rs.getString("pro_name")); 
            p.setPro_stock(rs.getInt("pro_stock"));
            p.setSuppName(rs.getString("supp_name"));

            productList.add(p);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return productList;
}


	
	

}

