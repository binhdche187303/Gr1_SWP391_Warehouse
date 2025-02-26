/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class InventoryCheck {
    private int checkId;
    private String checkDate;
    private int warehouseId;
    private String status;
    private int createdBy;
    private Integer reviewedBy;

    public InventoryCheck() {
    }

    public InventoryCheck(int checkId, String checkDate, int warehouseId, String status, int createdBy, Integer reviewedBy) {
        this.checkId = checkId;
        this.checkDate = checkDate;
        this.warehouseId = warehouseId;
        this.status = status;
        this.createdBy = createdBy;
        this.reviewedBy = reviewedBy;
    }

    public int getCheckId() {
        return checkId;
    }

    public void setCheckId(int checkId) {
        this.checkId = checkId;
    }

    public String getCheckDate() {
        return checkDate;
    }

    public void setCheckDate(String checkDate) {
        this.checkDate = checkDate;
    }

    public int getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(int warehouseId) {
        this.warehouseId = warehouseId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public Integer getReviewedBy() {
        return reviewedBy;
    }

    public void setReviewedBy(Integer reviewedBy) {
        this.reviewedBy = reviewedBy;
    }
}
