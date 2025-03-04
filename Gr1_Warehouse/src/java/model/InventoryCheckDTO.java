/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Timestamp;

public class InventoryCheckDTO {
    private int checkId;
    private String warehouseName;
    private String status;
    private Timestamp checkDate;
    private Timestamp completeDate;
    private int totalDiscrepancy;
    private double totalDiscrepancyValue;
    private String reviewedBy;
    private String createdBy;

    public InventoryCheckDTO() {
    }

    public InventoryCheckDTO(int checkId, String warehouseName, String status, Timestamp checkDate, Timestamp completeDate, int totalDiscrepancy, double totalDiscrepancyValue, String reviewedBy, String createdBy) {
        this.checkId = checkId;
        this.warehouseName = warehouseName;
        this.status = status;
        this.checkDate = checkDate;
        this.completeDate = completeDate;
        this.totalDiscrepancy = totalDiscrepancy;
        this.totalDiscrepancyValue = totalDiscrepancyValue;
        this.reviewedBy = reviewedBy;
        this.createdBy = createdBy;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    

    public String getReviewedBy() {
        return reviewedBy;
    }

    public void setReviewedBy(String reviewedBy) {
        this.reviewedBy = reviewedBy;
    }

    

    

    public int getCheckId() {
        return checkId;
    }

    public void setCheckId(int checkId) {
        this.checkId = checkId;
    }

    public String getWarehouseName() {
        return warehouseName;
    }

    public void setWarehouseName(String warehouseName) {
        this.warehouseName = warehouseName;
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

    public int getTotalDiscrepancy() {
        return totalDiscrepancy;
    }

    public void setTotalDiscrepancy(int totalDiscrepancy) {
        this.totalDiscrepancy = totalDiscrepancy;
    }

    public double getTotalDiscrepancyValue() {
        return totalDiscrepancyValue;
    }

    public void setTotalDiscrepancyValue(double totalDiscrepancyValue) {
        this.totalDiscrepancyValue = totalDiscrepancyValue;
    }

    public Timestamp getCompleteDate() {
        return completeDate;
    }

    public void setCompleteDate(Timestamp completeDate) {
        this.completeDate = completeDate;
    }

    
    @Override
    public String toString() {
        return "InventoryCheckDTO{" +
                "checkId=" + checkId +
                ", warehouseName='" + warehouseName + '\'' +
                ", status='" + status + '\'' +
                ", checkDate=" + checkDate +
                ", totalDiscrepancy=" + totalDiscrepancy +
                ", totalDiscrepancyValue=" + totalDiscrepancyValue +
                '}';
    }
}

