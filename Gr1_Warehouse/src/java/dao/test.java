/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import model.Categories;
import model.Products;

/**
 *
 * @author Huy Nam
 */
public class test {
    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();

        // Test case: Tìm sản phẩm thuộc các category_id = 1 và 3
        String[] testCategoryIds = {"1", "3"};

        // Gọi hàm cần test
        List<Products> products = productDAO.getAllProductsByCategories(testCategoryIds);

        // In kết quả ra console
        System.out.println("Số lượng sản phẩm tìm thấy: " + products.size());
        for (Products product : products) {
            System.out.println("ID: " + product.getProductId());
            System.out.println("Tên: " + product.getProductName());
            System.out.println("Mô tả: " + product.getDescription());
            System.out.println("Danh mục: " + product.getCate().getCategory_name());
            System.out.println("Giá: " + product.getVariants().get(0).getPrice());
            System.out.println("Size: " + product.getVariants().get(0).getSize().getSize_name());
            System.out.println("Hình ảnh: " + product.getImages().get(0).getImage_url());
            System.out.println("----------------------");
        }
    }
}
