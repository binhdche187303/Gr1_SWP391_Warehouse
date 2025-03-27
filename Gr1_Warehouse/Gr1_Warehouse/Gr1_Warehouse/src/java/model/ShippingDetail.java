/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author admin
 */
public class ShippingDetail {

    private int shippingId;
    private int orderId;
    private int staffId;
    private String status;
    private Timestamp shippedAt;

    public ShippingDetail() {
    }

    public ShippingDetail(int shippingId, int orderId, int staffId, String status, Timestamp shippedAt) {
        this.shippingId = shippingId;
        this.orderId = orderId;
        this.staffId = staffId;
        this.status = status;
        this.shippedAt = shippedAt;
    }

    public int getShippingId() {
        return shippingId;
    }

    public void setShippingId(int shippingId) {
        this.shippingId = shippingId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getShippedAt() {
        return shippedAt;
    }

    public void setShippedAt(Timestamp shippedAt) {
        this.shippedAt = shippedAt;
    }
    
    
    
}
