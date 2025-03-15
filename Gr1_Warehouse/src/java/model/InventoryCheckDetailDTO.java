/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author Huy Nam
 */
public class InventoryCheckDetailDTO {
    private int checkId;
    private String status;
    private Timestamp completedAt;
    private String fullname;
    private String userPhone;
    private String userEmail;
    private String warehouseName;
    private String warehouseAddress;
    private String warehousePhone;
    private String productName;
    private String sku; // Mã SKU sản phẩm
    private String sizeName; // Kích thước sản phẩm
    private int batchId;
    private int recordedQuantity;
    private int actualQuantity;
    private int discrepancy;
    private double differencePrice;
    private String expirationDate;
    private String reason;
    private String warehouseStaff;
    private String notes;
    private int differenceUp;
    private int differenceDown;
    private double priceDifferenceUp;
    private double priceDifferenceDown;

    // Constructor mặc định
    public InventoryCheckDetailDTO() {
    }

    // Getter và Setter
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

    public Timestamp getCompletedAt() {
        return completedAt;
    }

    public void setCompletedAt(Timestamp completedAt) {
        this.completedAt = completedAt;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getWarehouseName() {
        return warehouseName;
    }

    public void setWarehouseName(String warehouseName) {
        this.warehouseName = warehouseName;
    }

    public String getWarehouseAddress() {
        return warehouseAddress;
    }

    public void setWarehouseAddress(String warehouseAddress) {
        this.warehouseAddress = warehouseAddress;
    }

    public String getWarehousePhone() {
        return warehousePhone;
    }

    public void setWarehousePhone(String warehousePhone) {
        this.warehousePhone = warehousePhone;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getSizeName() {
        return sizeName;
    }

    public void setSizeName(String sizeName) {
        this.sizeName = sizeName;
    }

    public int getBatchId() {
        return batchId;
    }

    public void setBatchId(int batchId) {
        this.batchId = batchId;
    }

    public int getRecordedQuantity() {
        return recordedQuantity;
    }

    public void setRecordedQuantity(int recordedQuantity) {
        this.recordedQuantity = recordedQuantity;
    }

    public int getActualQuantity() {
        return actualQuantity;
    }

    public void setActualQuantity(int actualQuantity) {
        this.actualQuantity = actualQuantity;
    }

    public int getDiscrepancy() {
        return discrepancy;
    }

    public void setDiscrepancy(int discrepancy) {
        this.discrepancy = discrepancy;
    }

    public double getDifferencePrice() {
        return differencePrice;
    }

    public void setDifferencePrice(double differencePrice) {
        this.differencePrice = differencePrice;
    }

    public String getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getWarehouseStaff() {
        return warehouseStaff;
    }

    public void setWarehouseStaff(String warehouseStaff) {
        this.warehouseStaff = warehouseStaff;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public int getDifferenceUp() {
        return differenceUp;
    }

    public void setDifferenceUp(int differenceUp) {
        this.differenceUp = differenceUp;
    }

    public int getDifferenceDown() {
        return differenceDown;
    }

    public void setDifferenceDown(int differenceDown) {
        this.differenceDown = differenceDown;
    }

    public double getPriceDifferenceUp() {
        return priceDifferenceUp;
    }

    public void setPriceDifferenceUp(double priceDifferenceUp) {
        this.priceDifferenceUp = priceDifferenceUp;
    }

    public double getPriceDifferenceDown() {
        return priceDifferenceDown;
    }

    public void setPriceDifferenceDown(double priceDifferenceDown) {
        this.priceDifferenceDown = priceDifferenceDown;
    }
}
