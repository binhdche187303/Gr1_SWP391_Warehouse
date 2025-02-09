/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import model.Categories;

/**
 *
 * @author Huy Nam
 */
public class test {
    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
List<Categories> categoryCounts = productDAO.getCategoryProductCounts();
            
            // Kiểm tra kết quả
            for (Categories category : categoryCounts) {
                System.out.println("Category ID: " + category.getCategory_id());
                System.out.println("Category Name: " + category.getCategory_name());
                System.out.println("Total Products: " + category.getTotalProducts());
                System.out.println("----------------------------");
            }
    }
}
