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
public class PurchaseDetails {

    private int detailId;
    private int orderId;
    private int variantId;
    private String sku;
    private int quantity;
    private double unitPrice;
    private double totalPrice;
    private Timestamp expirationDate;
    private int warehouseId;
    private int batchId;

    public PurchaseDetails() {
    }

    public PurchaseDetails(int orderId, int variantId, String sku, int quantity, double unitPrice, Timestamp expirationDate, int batchId, int warehouseId) {
        this.orderId = orderId;
        this.variantId = variantId;
        this.sku = sku;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.expirationDate = expirationDate;
        this.batchId = batchId;
        this.warehouseId = warehouseId;
        this.totalPrice = unitPrice * quantity; // Tính tổng giá trị sản phẩm
    }

    public int getDetailId() {
        return detailId;
    }

    public void setDetailId(int detailId) {
        this.detailId = detailId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Timestamp getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Timestamp expirationDate) {
        this.expirationDate = expirationDate;
    }

    public int getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(int warehouseId) {
        this.warehouseId = warehouseId;
    }

    public int getBatchId() {
        return batchId;
    }

    public void setBatchId(int batchId) {
        this.batchId = batchId;
    }
}
