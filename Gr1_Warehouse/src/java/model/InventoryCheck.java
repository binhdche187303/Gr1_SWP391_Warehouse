/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

public class InventoryCheck {
    private int checkId;
    private String status;
    private Timestamp checkDate;
    private Timestamp completedAt;
    private Warehouse warehouse;
    private User createdBy;
    private User reviewedBy;

    public InventoryCheck(int checkId, String status, Timestamp checkDate, Timestamp completedAt,
                          Warehouse warehouse, User createdBy, User reviewedBy) {
        this.checkId = checkId;
        this.status = status;
        this.checkDate = checkDate;
        this.completedAt = completedAt;
        this.warehouse = warehouse;
        this.createdBy = createdBy;
        this.reviewedBy = reviewedBy;
    }

    public InventoryCheck() {
    }

    public int getCheckId() {
        return checkId;
    }

    public void setCheckId(int checkId) {
        this.checkId = checkId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getCheckDate() {
        return checkDate;
    }

    public void setCheckDate(Timestamp checkDate) {
        this.checkDate = checkDate;
    }

    public Timestamp getCompletedAt() {
        return completedAt;
    }

    public void setCompletedAt(Timestamp completedAt) {
        this.completedAt = completedAt;
    }

    public Warehouse getWarehouse() {
        return warehouse;
    }

    public void setWarehouse(Warehouse warehouse) {
        this.warehouse = warehouse;
    }

    public User getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(User createdBy) {
        this.createdBy = createdBy;
    }

    public User getReviewedBy() {
        return reviewedBy;
    }

    public void setReviewedBy(User reviewedBy) {
        this.reviewedBy = reviewedBy;
    }
}
