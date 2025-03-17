/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author admin
 */
public class DiscountProduct {

    private int product_discount_id;
    private Products product;
    private int min_quantity;
    private double discount_percentage;
    private LocalDateTime created_at;
    private String status;

    public DiscountProduct() {
    }

    public DiscountProduct(int product_discount_id, Products product, int min_quantity, double discount_percentage, LocalDateTime created_at, String status) {
        this.product_discount_id = product_discount_id;
        this.product = product;
        this.min_quantity = min_quantity;
        this.discount_percentage = discount_percentage;
        this.created_at = created_at;
        this.status = status;
    }

    public int getProduct_discount_id() {
        return product_discount_id;
    }

    public void setProduct_discount_id(int product_discount_id) {
        this.product_discount_id = product_discount_id;
    }

    public Products getProduct() {
        return product;
    }

    public void setProduct(Products product) {
        this.product = product;
    }

    public int getMin_quantity() {
        return min_quantity;
    }

    public void setMin_quantity(int min_quantity) {
        this.min_quantity = min_quantity;
    }

    public double getDiscount_percentage() {
        return discount_percentage;
    }

    public void setDiscount_percentage(double discount_percentage) {
        this.discount_percentage = discount_percentage;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "DiscountProduct{" + "product_discount_id=" + product_discount_id + ", product=" + product + ", min_quantity=" + min_quantity + ", discount_percentage=" + discount_percentage + ", created_at=" + created_at + ", status=" + status + '}';
    }

    

}
