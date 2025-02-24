/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;

/**
 *
 * @author Huy Nam
 */
public class ProductVariants {
    private int variantId;
    private int productId;
    private int sizeId;
    private BigDecimal price;
    private int stock;
    private Sizes size;
    private String sku;

    public Sizes getSize() {
        return size;
    }

    public void setSize(Sizes size) {
        this.size = size;
    }

    
    // Getter và Setter
    public int getVariantId() {
        return variantId;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getSizeId() {
        return sizeId;
    }

    public void setSizeId(int sizeId) {
        this.sizeId = sizeId;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    
    // Constructor

    public ProductVariants(int variantId, int productId, int sizeId, BigDecimal price, int stock, Sizes size, String sku) {
        this.variantId = variantId;
        this.productId = productId;
        this.sizeId = sizeId;
        this.price = price;
        this.stock = stock;
        this.size = size;
        this.sku = sku;
    }
    

    // Default constructor
    public ProductVariants() {
    }
}