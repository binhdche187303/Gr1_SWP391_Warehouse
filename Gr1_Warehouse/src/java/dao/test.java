/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.Arrays;
import java.util.List;
import model.Categories;
import model.Images;
import model.ProductVariants;
import model.Products;

/**
 *
 * @author Huy Nam
 */
public class test {
    public static void main(String[] args) {
        ProductDAO pdao = new ProductDAO();
// Nhập productId để test
        int productId = 1; // Thay đổi ID theo dữ liệu trong database

        // Gọi hàm getDetails
        Products product = pdao.getDetails(productId);

        // Kiểm tra sản phẩm có tồn tại hay không
        if (product != null) {
            System.out.println("===== CHI TIẾT SẢN PHẨM =====");
            System.out.println("ID: " + product.getProductId());
            System.out.println("Tên: " + product.getProductName());
            System.out.println("SKU: " + product.getSku());
            System.out.println("Xuất xứ: " + product.getOrigin());
            System.out.println("Mô tả: " + product.getDescription());

            // In danh mục sản phẩm
            if (product.getCate() != null) {
                System.out.println("Danh mục: " + product.getCate().getCategory_name());
            }

            // In thương hiệu sản phẩm
            if (product.getBrand() != null) {
                System.out.println("Thương hiệu: " + product.getBrand().getBrand_name());
            }

            // In danh sách ảnh
            System.out.println("\nHình ảnh sản phẩm:");
            if (product.getImages() != null) {
                for (Images img : product.getImages()) {
                    System.out.println("- " + img.getImage_url());
                }
            }

            // In danh sách biến thể (kích thước, giá, tồn kho)
            System.out.println("\nCác biến thể của sản phẩm:");
            if (product.getVariants() != null) {
                for (ProductVariants variant : product.getVariants()) {
                    System.out.println("- Size: " + variant.getSize().getSize_name() +
                            " | Giá: " + variant.getPrice() +
                            " | Tồn kho: " + variant.getStock());
                }
            }
        } else {
            System.out.println("Không tìm thấy sản phẩm với ID: " + productId);
        
            }
    }
}
