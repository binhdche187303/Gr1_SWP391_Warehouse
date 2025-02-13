/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Huy Nam
 */
public class Brands {
    private int brand_id;
    private String brand_name;
    private int totalProducts;
    
    public Brands() {
    }

    public Brands(int brand_id, String brand_name, int totalProducts) {
        this.brand_id = brand_id;
        this.brand_name = brand_name;
        this.totalProducts = totalProducts;
    }

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public String getBrand_name() {
        return brand_name;
    }

    public void setBrand_name(String brand_name) {
        this.brand_name = brand_name;
    }

    public int getTotalProducts() {
        return totalProducts;
    }

    public void setTotalProducts(int totalProducts) {
        this.totalProducts = totalProducts;
    }
         
}
