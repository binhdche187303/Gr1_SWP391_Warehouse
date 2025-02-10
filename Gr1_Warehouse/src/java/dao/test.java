/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.Arrays;
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

        ProductDAO productsDAO = new ProductDAO();

        // Thông số lọc
        List<Integer> categoryIds = Arrays.asList(1);  // Lọc theo nhiều danh mục
        List<Integer> brandIds = Arrays.asList(1);        // Lọc theo nhiều thương hiệu
        Double minPrice = 10000.0;                            // Lọc theo giá tối thiểu
        Double maxPrice = 250000.0;                           // Lọc theo giá tối đa

        // Lấy danh sách sản phẩm đã lọc
        List<Products> filteredProducts = productsDAO.getFilteredProducts(categoryIds, brandIds, minPrice, maxPrice);

        // In kết quả ra console để kiểm tra
        System.out.println("Filtered Products: ");
        for (Products product : filteredProducts) {
            System.out.println("Product ID: " + product.getProductId());
            System.out.println("Product Name: " + product.getProductName());
            System.out.println("Category: " + product.getCate().getCategory_name());
            System.out.println("Description: " + product.getDescription());
            System.out.println("Size: " + product.getVariants().get(0).getSize().getSize_name());
            System.out.println("Price: " + product.getVariants().get(0).getPrice());
            System.out.println("Image: " + product.getImages().get(0).getImage_url());
            System.out.println("--------------------------------------");
        }
    }
}
