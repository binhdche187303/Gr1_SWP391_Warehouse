/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 *
 * @author admin
 */
public class TransactionRecord {
    private String type;
    private String reason;
    private Timestamp date;
    private String createdBy;
    private BigDecimal amount;
    private int referenceId;

    public TransactionRecord() {
    }

    public TransactionRecord(String type, String reason, Timestamp date, String createdBy, BigDecimal amount, int referenceId) {
        this.type = type;
        this.reason = reason;
        this.date = date;
        this.createdBy = createdBy;
        this.amount = amount;
        this.referenceId = referenceId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public int getReferenceId() {
        return referenceId;
    }

    public void setReferenceId(int referenceId) {
        this.referenceId = referenceId;
    }

    @Override
    public String toString() {
        return "TransactionRecord{" + "type=" + type + ", reason=" + reason + ", date=" + date + ", createdBy=" + createdBy + ", amount=" + amount + ", referenceId=" + referenceId + '}';
    }
    
    
}
