/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author Dell
 */
public class PackingDetail {
    private int packingId;
    private int orderId;
    private int staffId;
    private String status;
    private Timestamp packedAt;

    public PackingDetail() {
    }

    public PackingDetail(int packingId, int orderId, int staffId, String status, Timestamp packedAt) {
        this.packingId = packingId;
        this.orderId = orderId;
        this.staffId = staffId;
        this.status = status;
        this.packedAt = packedAt;
    }

    public int getPackingId() {
        return packingId;
    }

    public void setPackingId(int packingId) {
        this.packingId = packingId;
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

    public Timestamp getPackedAt() {
        return packedAt;
    }

    public void setPackedAt(Timestamp packedAt) {
        this.packedAt = packedAt;
    }
    
    
    

}
