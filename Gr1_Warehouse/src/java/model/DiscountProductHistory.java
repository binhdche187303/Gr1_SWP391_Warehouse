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
public class DiscountProductHistory {
//     product_discount_history_id INT IDENTITY(1,1) PRIMARY KEY, -- Mã lịch sử thay đổi
//    product_discount_id INT NOT NULL, -- Mã giảm giá sản phẩm
//    old_min_quantity INT, -- Số lượng tối thiểu trước khi thay đổi
//    new_min_quantity INT, -- Số lượng tối thiểu sau khi thay đổi
//    old_discount_percentage DECIMAL(5, 2), -- Tỷ lệ giảm giá trước khi thay đổi
//    new_discount_percentage DECIMAL(5, 2), -- Tỷ lệ giảm giá sau khi thay đổi
//    old_status NVARCHAR(10), -- Trạng thái cũ
//    new_status NVARCHAR(10), -- Trạng thái mới
//    change_date DATETIME DEFAULT GETDATE(), -- Thời điểm thay đổi
//    changed_by INT NULL, -- ID người thay đổi (nếu cần theo dõi ai thực hiện)

    private int product_discount_history_id;
    private int product_discount_id;
    private Integer old_min_quantity;
    private int new_min_quantity;
    private Double old_discount_percentage;
    private double new_discount_percentage;
    private String old_status;
    private String new_status;
    private LocalDateTime change_date;
    private String changed_by;

    public DiscountProductHistory() {
    }

    public DiscountProductHistory(int product_discount_history_id, int product_discount_id, Integer old_min_quantity, int new_min_quantity, Double old_discount_percentage, double new_discount_percentage, String old_status, String new_status, LocalDateTime change_date, String changed_by) {
        this.product_discount_history_id = product_discount_history_id;
        this.product_discount_id = product_discount_id;
        this.old_min_quantity = old_min_quantity;
        this.new_min_quantity = new_min_quantity;
        this.old_discount_percentage = old_discount_percentage;
        this.new_discount_percentage = new_discount_percentage;
        this.old_status = old_status;
        this.new_status = new_status;
        this.change_date = change_date;
        this.changed_by = changed_by;
    }

    public int getProduct_discount_history_id() {
        return product_discount_history_id;
    }

    public void setProduct_discount_history_id(int product_discount_history_id) {
        this.product_discount_history_id = product_discount_history_id;
    }

    public int getProduct_discount_id() {
        return product_discount_id;
    }

    public void setProduct_discount_id(int product_discount_id) {
        this.product_discount_id = product_discount_id;
    }

    public Integer getOld_min_quantity() {
        return old_min_quantity;
    }

    public void setOld_min_quantity(Integer old_min_quantity) {
        this.old_min_quantity = old_min_quantity;
    }

    public int getNew_min_quantity() {
        return new_min_quantity;
    }

    public void setNew_min_quantity(int new_min_quantity) {
        this.new_min_quantity = new_min_quantity;
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
        return "DiscountProductHistory{" + "product_discount_history_id=" + product_discount_history_id + ", product_discount_id=" + product_discount_id + ", old_min_quantity=" + old_min_quantity + ", new_min_quantity=" + new_min_quantity + ", old_discount_percentage=" + old_discount_percentage + ", new_discount_percentage=" + new_discount_percentage + ", old_status=" + old_status + ", new_status=" + new_status + ", change_date=" + change_date + ", changed_by=" + changed_by + '}';
    }

}
