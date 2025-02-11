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

        ProductDAO pdao = new ProductDAO();
List<Integer> categoryIds = Arrays.asList(1); // Thay đổi ID theo DB thực tế
        List<Integer> brandIds = Arrays.asList(1); // Thay đổi ID theo DB thực tế
        Double minPrice = 10000.0;
        Double maxPrice = 50000.0;
        String sortOrder = "asc"; // "desc" nếu muốn giảm dần

        // Gọi phương thức getFilteredProducts để lấy danh sách sản phẩm theo bộ lọc
        List<Products> products = pdao.getFilteredProducts(categoryIds, brandIds, minPrice, maxPrice, sortOrder);

        // In kết quả ra console
        if (products.isEmpty()) {
            System.out.println("Không có sản phẩm nào phù hợp với bộ lọc.");
        } else {
            System.out.println("Danh sách sản phẩm lọc được:");
            for (Products p : products) {
                System.out.println("ID: " + p.getProductId());
                System.out.println("Tên: " + p.getProductName());
                System.out.println("Mô tả: " + p.getDescription());
                System.out.println("Danh mục: " + p.getCate().getCategory_name());
                System.out.println("Giá thấp nhất: " + p.getVariants().get(0).getPrice());
                System.out.println("Kích cỡ: " + p.getVariants().get(0).getSize().getSize_name());
                System.out.println("Hình ảnh: " + p.getImages().get(0).getImage_url());
                System.out.println("-----------------------------------");
            }
            }
    }
}
