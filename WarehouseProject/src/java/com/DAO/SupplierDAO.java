/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.DAO;

import com.Entity.Supplier;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface SupplierDAO {
    
    public boolean addSupplier(Supplier s);
    
    public  List <Supplier> getSupplier();
    
    public Supplier getSupplierById(int id);

    public boolean updateEditSupplier(Supplier s);
}
