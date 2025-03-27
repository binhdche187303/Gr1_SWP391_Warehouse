/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 *
 * @author Dell
 */
public class OrderDiscount {

    private int id;
    private int orderId;
    private int discountId;
    private double appliedDiscountPercentage;
    private BigDecimal appliedAmount;
    private LocalDateTime appliedDate;

    public OrderDiscount() {
    }

    public OrderDiscount(int id, int orderId, int discountId, double appliedDiscountPercentage, BigDecimal appliedAmount, LocalDateTime appliedDate) {
        this.id = id;
        this.orderId = orderId;
        this.discountId = discountId;
        this.appliedDiscountPercentage = appliedDiscountPercentage;
        this.appliedAmount = appliedAmount;
        this.appliedDate = appliedDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getDiscountId() {
        return discountId;
    }

    public void setDiscountId(int discountId) {
        this.discountId = discountId;
    }

    public double getAppliedDiscountPercentage() {
        return appliedDiscountPercentage;
    }

    public void setAppliedDiscountPercentage(double appliedDiscountPercentage) {
        this.appliedDiscountPercentage = appliedDiscountPercentage;
    }

    public BigDecimal getAppliedAmount() {
        return appliedAmount;
    }

    public void setAppliedAmount(BigDecimal appliedAmount) {
        this.appliedAmount = appliedAmount;
    }

    public LocalDateTime getAppliedDate() {
        return appliedDate;
    }

    public void setAppliedDate(LocalDateTime appliedDate) {
        this.appliedDate = appliedDate;
    }

 
    
    
   

    
    

}
