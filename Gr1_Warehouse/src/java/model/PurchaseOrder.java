package model;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;

public class PurchaseOrder {
    private int orderId;
    private Timestamp orderDate;
    private int supplierId;
    private double totalAmount;
    private String billImgUrl;
    private String status;
    private String notes;
    private int warehouseId;
    private int userId;
    private String referenceCode;

    public PurchaseOrder() {
        this.orderDate = new Timestamp(System.currentTimeMillis()); // Lấy thời gian hiện tại mặc định
    }

    public PurchaseOrder(int orderId, Timestamp orderDate, int supplierId, double totalAmount, String billImgUrl, String status, String notes, int warehouseId, int userId, String referenceCode) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.supplierId = supplierId;
        this.totalAmount = totalAmount;
        this.billImgUrl = billImgUrl;
        this.status = status;
        this.notes = notes;
        this.warehouseId = warehouseId;
        this.userId = userId;
        this.referenceCode = referenceCode;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getBillImgUrl() {
        return billImgUrl;
    }

    public void setBillImgUrl(String billImgUrl) {
        this.billImgUrl = billImgUrl;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public int getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(int warehouseId) {
        this.warehouseId = warehouseId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getReferenceCode() {
        return referenceCode;
    }

    public void setReferenceCode(String referenceCode) {
        this.referenceCode = referenceCode;
    }
    
    public String getFormattedTotalAmount() {
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        return currencyFormatter.format(totalAmount);
    }
}