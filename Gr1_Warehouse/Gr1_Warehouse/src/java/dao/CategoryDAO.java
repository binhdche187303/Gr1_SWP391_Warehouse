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

    public boolean createCategory(String categoryName) throws SQLException {
        String sql = "INSERT INTO Categories (category_name) VALUES (?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, categoryName);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            throw new SQLException("Tên thể loại đã tồn tại!", e);
        }
    }

    public boolean updateCategory(int categoryId, String categoryName) {
        boolean result = false;
        PreparedStatement ps = null;

        try {

            // SQL query to update category
            String sql = "UPDATE Categories SET category_name = ? WHERE category_id = ?";

            // Create prepared statement
            ps = connection.prepareStatement(sql);
            ps.setString(1, categoryName);
            ps.setInt(2, categoryId);

            // Execute the query
            int rowsAffected = ps.executeUpdate();

            // Check if update was successful
            if (rowsAffected > 0) {
                result = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return result;
    }

     //Ham nay check luc update
    public boolean isCategoryNameExists(int currentCategoryId, String categoryName) throws SQLException {
        // Loại bỏ tất cả khoảng trắng và chuyển về chữ thường
        String cleanedCategoryName = categoryName.replaceAll("\\s+", "").toLowerCase();

        String sql = "SELECT COUNT(*) FROM Categories WHERE LOWER(REPLACE(category_name, ' ', '')) = ? AND category_id != ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, cleanedCategoryName);
            stmt.setInt(2, currentCategoryId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // Nếu COUNT > 0 tức là đã tồn tại
                }
            }
        }
        return false;
    }

    
    //Ham nay check luc tao
    public boolean isCategoryNameExists(String categoryName) throws SQLException {
        // Loại bỏ tất cả khoảng trắng và chuyển về chữ thường
        String cleanedCategoryName = categoryName.replaceAll("\\s+", "").toLowerCase();

        String sql = "SELECT COUNT(*) FROM Categories WHERE LOWER(REPLACE(category_name, ' ', '')) = ?";

        try (PreparedStatement pstm = connection.prepareStatement(sql)) {
            pstm.setString(1, cleanedCategoryName);
            try (ResultSet rs = pstm.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    public static void main(String[] args) throws SQLException {
        CategoryDAO cd = new CategoryDAO();
        System.out.println(cd.isCategoryNameExists(1, "  K ẹO          "));
    }
}
