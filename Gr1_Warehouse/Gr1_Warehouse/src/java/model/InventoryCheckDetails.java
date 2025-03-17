/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class InventoryCheckDetails {
    private int checkDetailId;
    private int checkId;
    private int batchId;
    private int variantId;
    private String sku;
    private int expectedQuantity;
    private int actualQuantity;
    private int discrepancy;
    private int discrepancyPrice;
    private String expirationDate;
    private String discrepancyStatus;
    private String reason;

    public InventoryCheckDetails() {
    }

    public InventoryCheckDetails(int checkDetailId, int checkId, int batchId, int variantId, String sku, int expectedQuantity, int actualQuantity, int discrepancy, int discrepancyPrice, String expirationDate, String discrepancyStatus, String reason) {
        this.checkDetailId = checkDetailId;
        this.checkId = checkId;
        this.batchId = batchId;
        this.variantId = variantId;
        this.sku = sku;
        this.expectedQuantity = expectedQuantity;
        this.actualQuantity = actualQuantity;
        this.discrepancy = discrepancy;
        this.discrepancyPrice = discrepancyPrice;
        this.expirationDate = expirationDate;
        this.discrepancyStatus = discrepancyStatus;
        this.reason = reason;
    }

    

    public int getCheckDetailId() {
        return checkDetailId;
    }

    public void setCheckDetailId(int checkDetailId) {
        this.checkDetailId = checkDetailId;
    }

    public int getCheckId() {
        return checkId;
    }

    public void setCheckId(int checkId) {
        this.checkId = checkId;
    }

    public int getBatchId() {
        return batchId;
    }

    public void setBatchId(int batchId) {
        this.batchId = batchId;
    }

    public int getVariantId() {
        return variantId;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public int getExpectedQuantity() {
        return expectedQuantity;
    }

    public void setExpectedQuantity(int expectedQuantity) {
        this.expectedQuantity = expectedQuantity;
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

    public int getDiscrepancyPrice() {
        return discrepancyPrice;
    }

    public void setDiscrepancyPrice(int discrepancyPrice) {
        this.discrepancyPrice = discrepancyPrice;
    }

    public String getDiscrepancyStatus() {
        return discrepancyStatus;
    }

    public void setDiscrepancyStatus(String discrepancyStatus) {
        this.discrepancyStatus = discrepancyStatus;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }
    
    
}
