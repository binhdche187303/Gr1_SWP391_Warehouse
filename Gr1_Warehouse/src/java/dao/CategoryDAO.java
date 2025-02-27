/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import model.Categories;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Brands;

/**
 *
 * @author admin
 */
public class CategoryDAO extends DBContext {

    public List<Categories> getAllCategories() {

        List<Categories> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Categories";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Categories category = new Categories();
                category.setCategory_id(rs.getInt("category_id"));
                category.setCategory_name(rs.getString("category_name"));
                list.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static void main(String[] args) {
        CategoryDAO cd = new CategoryDAO();
        List<Categories> l = cd.getAllCategories();
        for (Categories categories : l) {
            System.out.println(categories.getCategory_name());
        }
    }
}
