/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author Dell
 */
public class OrderDetailDTO {

    private Order order;
    private User user;
    private Payment payment;
    private List<OrderDetail> orderDetails;
    private List<Products> products; // ✅ Danh sách sản phẩm (để tránh trùng lặp)
    private List<ProductVariants> productVariants; // ✅ Danh sách biến thể sản phẩm
    private List<Sizes> sizes; // ✅ Danh sách kích thước
    private BigDecimal totalBeforeDiscount;  // Giá trị trước khi giảm giá
    private BigDecimal totalAfterDiscount;   // Giá trị sau khi giảm giá
    
    public OrderDetailDTO() {
    }

    public OrderDetailDTO(Order order, User user, Payment payment, List<OrderDetail> orderDetails, List<Products> products, List<ProductVariants> productVariants, List<Sizes> sizes) {
        this.order = order;
        this.user = user;
        this.payment = payment;
        this.orderDetails = orderDetails;
        this.products = products;
        this.productVariants = productVariants;
        this.sizes = sizes;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public List<Products> getProducts() {
        return products;
    }

    public void setProducts(List<Products> products) {
        this.products = products;
    }

    public List<ProductVariants> getProductVariants() {
        return productVariants;
    }

    public void setProductVariants(List<ProductVariants> productVariants) {
        this.productVariants = productVariants;
    }

    public List<Sizes> getSizes() {
        return sizes;
    }

    public void setSizes(List<Sizes> sizes) {
        this.sizes = sizes;
    }

     // Getter and Setter for the new fields
    public BigDecimal getTotalBeforeDiscount() {
        return totalBeforeDiscount;
    }

    public void setTotalBeforeDiscount(BigDecimal totalBeforeDiscount) {
        this.totalBeforeDiscount = totalBeforeDiscount;
    }

    public BigDecimal getTotalAfterDiscount() {
        return totalAfterDiscount;
    }

    public void setTotalAfterDiscount(BigDecimal totalAfterDiscount) {
        this.totalAfterDiscount = totalAfterDiscount;
    }
    


    
    



    
}