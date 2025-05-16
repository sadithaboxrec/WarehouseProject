/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.DAO;

import com.Entity.Category;
import java.util.List;

/**
 *
 * @author methm
 */
public interface CategoryDAO {
    public boolean addCategory(Category c);
    
    public  List <Category> getCategory();
    
    public Category getCategoryById(int id);

    public boolean updateEditCategory(Category c);    
}
