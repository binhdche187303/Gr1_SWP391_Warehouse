/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author admin
 */
public class DiscountHistory {
//     discount_history_id INT IDENTITY(1,1) PRIMARY KEY,  
//    discount_id INT NOT NULL,  
//    old_discount_percentage DECIMAL(5,2) NULL CHECK (old_discount_percentage > 0 AND old_discount_percentage < 100),  
//    new_discount_percentage DECIMAL(5,2) NOT NULL CHECK (new_discount_percentage > 0 AND new_discount_percentage < 100),  
//    old_status NVARCHAR(10) CHECK (old_status IN ('Active', 'Inactive')),
//    new_status NVARCHAR(10) CHECK (new_status IN ('Active', 'Inactive')),
//    old_max_uses INT NULL CHECK (old_max_uses > 0),
//    new_max_uses INT NULL CHECK (new_max_uses > 0),
//    change_date DATETIME DEFAULT GETDATE() NOT NULL,  
//    changed_by INT DEFAULT 1,  
//    FOREIGN KEY (discount_id) REFERENCES Discounts(discount_id) ON DELETE CASCADE,  
//    FOREIGN KEY (changed_by) REFERENCES Users(user_id) ON DELETE SET NULL  

    private int discount_history_id;
    private int discount_id;
    private Double old_discount_percentage;
    private double new_discount_percentage;
    private String old_status;
    private String new_status;
    private Integer old_max_uses;
    private Integer new_max_uses;
    private LocalDateTime change_date;
    private String  changed_by;

    public DiscountHistory() {
    }

    public DiscountHistory(int discount_history_id, int discount_id, Double old_discount_percentage, double new_discount_percentage, String old_status, String new_status, Integer old_max_uses, Integer new_max_uses, LocalDateTime change_date, String changed_by) {
        this.discount_history_id = discount_history_id;
        this.discount_id = discount_id;
        this.old_discount_percentage = old_discount_percentage;
        this.new_discount_percentage = new_discount_percentage;
        this.old_status = old_status;
        this.new_status = new_status;
        this.old_max_uses = old_max_uses;
        this.new_max_uses = new_max_uses;
        this.change_date = change_date;
        this.changed_by = changed_by;
    }

    public int getDiscount_history_id() {
        return discount_history_id;
    }

    public void setDiscount_history_id(int discount_history_id) {
        this.discount_history_id = discount_history_id;
    }

    public int getDiscount_id() {
        return discount_id;
    }

    public void setDiscount_id(int discount_id) {
        this.discount_id = discount_id;
    }

    public Double getOld_discount_percentage() {
        return old_discount_percentage;
    }

    public void setOld_discount_percentage(Double old_discount_percentage) {
        this.old_discount_percentage = old_discount_percentage;
    }

    public double getNew_discount_percentage() {
        return new_discount_percentage;
    }

    public void setNew_discount_percentage(double new_discount_percentage) {
        this.new_discount_percentage = new_discount_percentage;
    }

    public String getOld_status() {
        return old_status;
    }

    public void setOld_status(String old_status) {
        this.old_status = old_status;
    }

    public String getNew_status() {
        return new_status;
    }

    public void setNew_status(String new_status) {
        this.new_status = new_status;
    }

    public Integer getOld_max_uses() {
        return old_max_uses;
    }

    public void setOld_max_uses(Integer old_max_uses) {
        this.old_max_uses = old_max_uses;
    }

    public Integer getNew_max_uses() {
        return new_max_uses;
    }

    public void setNew_max_uses(Integer new_max_uses) {
        this.new_max_uses = new_max_uses;
    }

    public LocalDateTime getChange_date() {
        return change_date;
    }

    public void setChange_date(LocalDateTime change_date) {
        this.change_date = change_date;
    }

    public String getChanged_by() {
        return changed_by;
    }

    public void setChanged_by(String changed_by) {
        this.changed_by = changed_by;
    }

    @Override
    public String toString() {
        return "DiscountHistory{" + "discount_history_id=" + discount_history_id + ", discount_id=" + discount_id + ", old_discount_percentage=" + old_discount_percentage + ", new_discount_percentage=" + new_discount_percentage + ", old_status=" + old_status + ", new_status=" + new_status + ", old_max_uses=" + old_max_uses + ", new_max_uses=" + new_max_uses + ", change_date=" + change_date + ", changed_by=" + changed_by + '}';
    }

}
