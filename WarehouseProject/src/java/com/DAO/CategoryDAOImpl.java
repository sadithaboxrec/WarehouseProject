/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.DB.DBConnect;
import java.sql.PreparedStatement;
import com.Entity.Category;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import java.sql.ResultSet;

/**
 *
 * @author methm
 */

public class CategoryDAOImpl implements CategoryDAO {
    Logger logger = Logger.getLogger("CATDAO");
    	private Connection conn;
        
        public CategoryDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	      }

        
    public boolean addCategory(Category c ) {
        boolean f=false;
    
        try {
            
           String sql=" INSERT INTO category (categoryName, CategoryStatus, stocklocation_loc_id)  values (?,?,?)"; 
           
           PreparedStatement ps= conn.prepareStatement(sql);
           ps.setString(1, c.getCategoryName());
           ps.setString(2, c.getCategoryStatus());
           ps.setInt(3, c.getLocId());
           
           
                       
            int i= ps.executeUpdate();
            
            if(i==1) {
            	f=true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    
        return f;
    }

    
    
    
    
    	public List <Category> getCategory() {
		
		List <Category> list=new ArrayList<Category>();
		Category c=null;
		
                try {

                        String sql="SELECT * FROM category";
                        PreparedStatement ps=conn.prepareStatement(sql);

                         ResultSet rs=ps.executeQuery();

                        while(rs.next()) 
                        {

                               c = new Category();
                               c.setCategoryId(rs.getInt(1));
                               c.setCategoryName(rs.getString(2));
                               c.setCategoryStatus(rs.getString(3));
                               c.setLocId(rs.getInt(4));
                                list.add(c);
                        }


              } catch (Exception e) {
                      e.printStackTrace();
              }

		return list;
	}




        

	public Category getCategoryById(int id) {
		
		Category c=null;
		
		try {
			
			String sql="SELECT * FROM category WHERE categoryid=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);

			
			ResultSet rs=ps.executeQuery();	
			
			  while(rs.next()) 
			  {
				  
				 c = new Category();
                                 c.setCategoryId(rs.getInt(1));
                                 c.setCategoryName(rs.getString(2));
                                 c.setCategoryStatus(rs.getString(3));
                                 c.setLocId(rs.getInt(4));
				  
			  }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return c;
	}


        @Override
	public boolean updateEditCategory(Category c) {
                logger.severe("CAT NAME:"+c.getCategoryName()+"|"+"CAT Status:"+c.getCategoryStatus()+"|"+"CAT locid:"+c.getLocId()+"|"+"CAT id:"+c.getCategoryId());
            
		boolean f=false;
		
		try {
			String sql="UPDATE category SET categoryName=?, categoryStatus=?, stocklocation_loc_id=? WHERE categoryId=?";

			
			PreparedStatement ps = conn.prepareStatement(sql);
                        ps.setString(1, c.getCategoryName());
                        ps.setString(2, c.getCategoryStatus());
			ps.setInt(3, c.getLocId());
                        ps.setInt(4, c.getCategoryId());
                        
                        
                
			int i = ps.executeUpdate();
                        logger.severe("status:"+i);
			if (i == 1) {
			  f = true;
			}
			
		} catch (Exception e) {
                    logger.severe("Error:"+e);
			e.printStackTrace();
		}
		
		return f;
	}



}
