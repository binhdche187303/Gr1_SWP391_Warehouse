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
    private int totalDifferenceUp;        
    private int totalDifferenceDown;      
    private double totalPriceDifferenceUp; 
    private double totalPriceDifferenceDown; 
    private String reviewedBy;
    private String createdBy;

    public InventoryCheckDTO() {
    }
    
     public InventoryCheckDTO(InventoryCheckDTO other) {
        this.checkId = other.checkId;
        this.warehouseName = other.warehouseName;
        this.status = other.status;
        this.checkDate = other.checkDate;
        this.totalDifferenceUp = other.totalDifferenceUp;
        this.totalDifferenceDown = other.totalDifferenceDown;
        this.totalPriceDifferenceUp = other.totalPriceDifferenceUp;
        this.totalPriceDifferenceDown = other.totalPriceDifferenceDown;
        this.reviewedBy = other.reviewedBy;
        this.createdBy = other.createdBy;
    }

    public InventoryCheckDTO(int checkId, String warehouseName, String status, Timestamp checkDate, Timestamp completeDate, int totalDifferenceUp, int totalDifferenceDown, double totalPriceDifferenceUp, double totalPriceDifferenceDown, String reviewedBy, String createdBy) {
        this.checkId = checkId;
        this.warehouseName = warehouseName;
        this.status = status;
        this.checkDate = checkDate;
        this.completeDate = completeDate;
        this.totalDifferenceUp = totalDifferenceUp;
        this.totalDifferenceDown = totalDifferenceDown;
        this.totalPriceDifferenceUp = totalPriceDifferenceUp;
        this.totalPriceDifferenceDown = totalPriceDifferenceDown;
        this.reviewedBy = reviewedBy;
        this.createdBy = createdBy;
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

    public Timestamp getCompleteDate() {
        return completeDate;
    }

    public void setCompleteDate(Timestamp completeDate) {
        this.completeDate = completeDate;
    }

    public int getTotalDifferenceUp() {
        return totalDifferenceUp;
    }

    public void setTotalDifferenceUp(int totalDifferenceUp) {
        this.totalDifferenceUp = totalDifferenceUp;
    }

    public int getTotalDifferenceDown() {
        return totalDifferenceDown;
    }

    public void setTotalDifferenceDown(int totalDifferenceDown) {
        this.totalDifferenceDown = totalDifferenceDown;
    }

    public double getTotalPriceDifferenceUp() {
        return totalPriceDifferenceUp;
    }

    public void setTotalPriceDifferenceUp(double totalPriceDifferenceUp) {
        this.totalPriceDifferenceUp = totalPriceDifferenceUp;
    }

    public double getTotalPriceDifferenceDown() {
        return totalPriceDifferenceDown;
    }

    public void setTotalPriceDifferenceDown(double totalPriceDifferenceDown) {
        this.totalPriceDifferenceDown = totalPriceDifferenceDown;
    }

    public String getReviewedBy() {
        return reviewedBy;
    }

    public void setReviewedBy(String reviewedBy) {
        this.reviewedBy = reviewedBy;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    
}

