/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.Categories;
import model.Images;
import model.OrderDetail;
import model.ProductVariants;
import model.Products;

/**
 *
 * @author Huy Nam
 */
public class test {
    public static void main(String[] args) {
        // Khởi tạo dữ liệu test
        ProductDAO productDAO = new ProductDAO();
        
        // Thay đổi productId thành ID thực tế có trong database của bạn
        int productId = 1;  // Ví dụ: 1
        
        // Gọi hàm getDetails và lưu kết quả
        Products product = productDAO.getDetails(productId);
        
        // Kiểm tra nếu sản phẩm tồn tại
        if (product != null) {
            System.out.println("Product ID: " + product.getProductId());
            System.out.println("Product Name: " + product.getProductName());
            System.out.println("Origin: " + product.getOrigin());
            System.out.println("Description: " + product.getDescription());

            // In danh mục
            if (product.getCate() != null) {
                System.out.println("Category: " + product.getCate().getCategory_name());
            }
            
            // In thương hiệu
            if (product.getBrand() != null) {
                System.out.println("Brand: " + product.getBrand().getBrand_name());
            }

            // In các biến thể sản phẩm
            System.out.println("\nProduct Variants:");
            for (ProductVariants variant : product.getVariants()) {
                System.out.println("- Variant ID: " + variant.getVariantId());
                System.out.println("  Size: " + variant.getSize().getSize_name());
                System.out.println("  Price: " + variant.getPrice());
                System.out.println("  SKU: " + variant.getSku());
                System.out.println("  Stock: " + variant.getStock());
            }

            // In hình ảnh sản phẩm
            System.out.println("\nProduct Images:");
            for (Images image : product.getImages()) {
                System.out.println("- Image URL: " + image.getImage_url());
            }
        } else {
            System.out.println("Product not found with ID: " + productId);
        }
    }
}
