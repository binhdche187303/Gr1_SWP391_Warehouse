/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author Dell
 */
public class PurchaseOrderDetailDTO {
    private PurchaseOrder order;
    private Suppliers supplier;
    private Warehouse warehouse;
    private User processedBy;
    private List<PurchaseDetails> purchaseDetails;
    private List<String> productNames;  // Thêm danh sách tên sản phẩm

    public PurchaseOrderDetailDTO() {
    }

    public PurchaseOrderDetailDTO(PurchaseOrder order, Suppliers supplier, Warehouse warehouse, User processedBy, List<PurchaseDetails> purchaseDetails, List<String> productNames) {
        this.order = order;
        this.supplier = supplier;
        this.warehouse = warehouse;
        this.processedBy = processedBy;
        this.purchaseDetails = purchaseDetails;
        this.productNames = productNames;
    }

    public PurchaseOrder getOrder() {
        return order;
    }

    public void setOrder(PurchaseOrder order) {
        this.order = order;
    }

    public Suppliers getSupplier() {
        return supplier;
    }

    public void setSupplier(Suppliers supplier) {
        this.supplier = supplier;
    }

    public Warehouse getWarehouse() {
        return warehouse;
    }

    public void setWarehouse(Warehouse warehouse) {
        this.warehouse = warehouse;
    }

    public User getProcessedBy() {
        return processedBy;
    }

    public void setProcessedBy(User processedBy) {
        this.processedBy = processedBy;
    }

    public List<PurchaseDetails> getPurchaseDetails() {
        return purchaseDetails;
    }

    public void setPurchaseDetails(List<PurchaseDetails> purchaseDetails) {
        this.purchaseDetails = purchaseDetails;
    }

    public List<String> getProductNames() {
        return productNames;
    }

    public void setProductNames(List<String> productNames) {
        this.productNames = productNames;
    }


}
