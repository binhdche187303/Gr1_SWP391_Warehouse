/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author admin
 */
public class Discounts {

    private int discount_id;
    private String discount_code;
    private double discount_percentage;
    private Integer min_quantity; // Số lượng tối thiểu (có thể null)
    private Integer min_order_value; // Giá trị tối thiểu của đơn hàng (có thể null)
    private LocalDateTime start_date;
    private LocalDateTime end_date;
    private Integer max_uses; // Có thể null (không giới hạn)
    private LocalDateTime created_at;
    private String status;

    public Discounts() {
    }

    public Discounts(int discount_id, String discount_code, double discount_percentage, Integer min_quantity, Integer min_order_value, LocalDateTime start_date, LocalDateTime end_date, Integer max_uses, LocalDateTime created_at, String status) {
        this.discount_id = discount_id;
        this.discount_code = discount_code;
        this.discount_percentage = discount_percentage;
        this.min_quantity = min_quantity;
        this.min_order_value = min_order_value;
        this.start_date = start_date;
        this.end_date = end_date;
        this.max_uses = max_uses;
        this.created_at = created_at;
        this.status = status;
    }

    public int getDiscount_id() {
        return discount_id;
    }

    public void setDiscount_id(int discount_id) {
        this.discount_id = discount_id;
    }

    public String getDiscount_code() {
        return discount_code;
    }

    public void setDiscount_code(String discount_code) {
        this.discount_code = discount_code;
    }

    public double getDiscount_percentage() {
        return discount_percentage;
    }

    public void setDiscount_percentage(double discount_percentage) {
        this.discount_percentage = discount_percentage;
    }

    public Integer getMin_quantity() {
        return min_quantity;
    }

    public void setMin_quantity(Integer min_quantity) {
        this.min_quantity = min_quantity;
    }

    public Integer getMin_order_value() {
        return min_order_value;
    }

    public void setMin_order_value(Integer min_order_value) {
        this.min_order_value = min_order_value;
    }

    public LocalDateTime getStart_date() {
        return start_date;
    }

    public void setStart_date(LocalDateTime start_date) {
        this.start_date = start_date;
    }

    public LocalDateTime getEnd_date() {
        return end_date;
    }

    public void setEnd_date(LocalDateTime end_date) {
        this.end_date = end_date;
    }

    public Integer getMax_uses() {
        return max_uses;
    }

    public void setMax_uses(Integer max_uses) {
        this.max_uses = max_uses;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Discounts{" + "discount_id=" + discount_id + ", discount_code=" + discount_code + ", discount_percentage=" + discount_percentage + ", min_quantity=" + min_quantity + ", min_order_value=" + min_order_value + ", start_date=" + start_date + ", end_date=" + end_date + ", max_uses=" + max_uses + ", created_at=" + created_at + ", status=" + status + '}';
    }

    

}
