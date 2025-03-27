/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import java.util.function.Supplier;

/**
 *
 * @author Dell
 */
public class SupplierBrand {
    private int id; // id tự động tăng (Identity)
    private Suppliers supplier; // liên kết với bảng Suppliers
    private Brands brand; // liên kết với bảng Brands

    public SupplierBrand() {
    }

    public SupplierBrand(int id, Suppliers supplier, Brands brand) {
        this.id = id;
        this.supplier = supplier;
        this.brand = brand;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Suppliers getSupplier() {
        return supplier;
    }

    public void setSupplier(Suppliers supplier) {
        this.supplier = supplier;
    }

    public Brands getBrand() {
        return brand;
    }

    public void setBrand(Brands brand) {
        this.brand = brand;
    }




    
    
    
}
