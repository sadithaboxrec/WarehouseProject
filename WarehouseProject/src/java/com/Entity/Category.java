/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Entity;

/**
 *
 * @author Gimshan
 */
public class Category {
 private int categoryId;
	private String categoryName;
	private String categoryStatus;
        private int Loc_id;
        
        public Category(){
            super();
        }
        
        public Category(String categoryName,String categoryStatus,int Loc_id){
            super();

            this.categoryName=categoryName;
            this.categoryStatus=categoryStatus;
            this.Loc_id=Loc_id;
        }

        
        
        
    public void setLocId(int Loc_id) {
        this.Loc_id = Loc_id;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
    
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public void setCategoryStatus(String categoryStatus) {
        this.categoryStatus = categoryStatus;
    }
    
    

    
    
    public int getCategoryId() {
        return categoryId;
    }
    
    public int getLocId() {
        return Loc_id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public String getCategoryStatus() {
        return categoryStatus;
    }
   
}
