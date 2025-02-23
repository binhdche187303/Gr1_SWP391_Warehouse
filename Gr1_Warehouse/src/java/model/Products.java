/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author Huy Nam
 */
public class Products {

    private int productId;
    private String productName;
    private String origin;
    private String description;
    private Categories cate;
    private Brands brand;
    private List<Images> images;
    private List<ProductVariants> variants;

    public Products() {
    }

    public Products(int productId) {
        this.productId = productId;
    }


    public Products(int productId, String productName) {
        this.productId = productId;
        this.productName = productName;
    }

    public Products(int productId, String productName, String origin, String description, Categories cate, Brands brand, List<Images> images, List<ProductVariants> variants) {
        this.productId = productId;
        this.productName = productName;
        this.origin = origin;
        this.description = description;
        this.cate = cate;
        this.brand = brand;
        this.images = images;
        this.variants = variants;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Categories getCate() {
        return cate;
    }

    public void setCate(Categories cate) {
        this.cate = cate;
    }

    public Brands getBrand() {
        return brand;
    }

    public void setBrand(Brands brand) {
        this.brand = brand;
    }

    public List<Images> getImages() {
        return images;
    }

    public void setImages(List<Images> images) {
        this.images = images;
    }

    public List<ProductVariants> getVariants() {
        return variants;
    }

    public void setVariants(List<ProductVariants> variants) {
        this.variants = variants;
    }

    @Override
    public String toString() {
        return "Products{" + "productId=" + productId + ", productName=" + productName + ", origin=" + origin + ", description=" + description + ", cate=" + cate + ", brand=" + brand + ", images=" + images + ", variants=" + variants + '}';
    }

}
