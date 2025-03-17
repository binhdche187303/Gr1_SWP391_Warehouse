/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class InventoryAdjustments {
    private int adjustmentId;
    private int checkDetailId;
    private int batchId;
    private int variantId;
    private int adjustmentQuantity;
    private String adjustmentReason;
    private int adjustedBy;
    private String adjustmentDate;

    public InventoryAdjustments() {
    }

    public InventoryAdjustments(int adjustmentId, int checkDetailId, int batchId, int variantId, int adjustmentQuantity, String adjustmentReason, int adjustedBy, String adjustmentDate) {
        this.adjustmentId = adjustmentId;
        this.checkDetailId = checkDetailId;
        this.batchId = batchId;
        this.variantId = variantId;
        this.adjustmentQuantity = adjustmentQuantity;
        this.adjustmentReason = adjustmentReason;
        this.adjustedBy = adjustedBy;
        this.adjustmentDate = adjustmentDate;
    }

    public int getAdjustmentId() {
        return adjustmentId;
    }

    public void setAdjustmentId(int adjustmentId) {
        this.adjustmentId = adjustmentId;
    }

    public int getCheckDetailId() {
        return checkDetailId;
    }

    public void setCheckDetailId(int checkDetailId) {
        this.checkDetailId = checkDetailId;
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

    public int getAdjustmentQuantity() {
        return adjustmentQuantity;
    }

    public void setAdjustmentQuantity(int adjustmentQuantity) {
        this.adjustmentQuantity = adjustmentQuantity;
    }

    public String getAdjustmentReason() {
        return adjustmentReason;
    }

    public void setAdjustmentReason(String adjustmentReason) {
        this.adjustmentReason = adjustmentReason;
    }

    public int getAdjustedBy() {
        return adjustedBy;
    }

    public void setAdjustedBy(int adjustedBy) {
        this.adjustedBy = adjustedBy;
    }

    public String getAdjustmentDate() {
        return adjustmentDate;
    }

    public void setAdjustmentDate(String adjustmentDate) {
        this.adjustmentDate = adjustmentDate;
    }
}
