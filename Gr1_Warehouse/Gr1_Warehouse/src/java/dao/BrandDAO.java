/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import model.Brands;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class BrandDAO extends DBContext {

    public List<Brands> getAllBrands() {

        List<Brands> list = new ArrayList<>();
        String sql = "SELECT * FROM Brands";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brands brand = new Brands();
                brand.setBrand_id(rs.getInt("brand_id"));
                brand.setBrand_name(rs.getString("brand_name"));
                list.add(brand);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean createBrand(String brandName) throws SQLException {
        String sql = "INSERT INTO Brands (brand_name) VALUES (?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, brandName);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            throw new SQLException("Tên thương hiệu đã tồn tại!", e);
        }
    }

    public boolean updateBrand(int brandId, String brandName) {
        boolean result = false;
        PreparedStatement ps = null;

        try {

            // SQL query to update brand
            String sql = "UPDATE Brands SET brand_name = ? WHERE brand_id = ?";

            // Create prepared statement
            ps = connection.prepareStatement(sql);
            ps.setString(1, brandName);
            ps.setInt(2, brandId);

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
    public boolean isBrandNameExists(int currentBrandId, String brandName) throws SQLException {
        // Loại bỏ tất cả khoảng trắng và chuyển về chữ thường
        String cleanedBrandName = brandName.replaceAll("\\s+", "").toLowerCase();

        String sql = "SELECT COUNT(*) FROM Brands WHERE LOWER(REPLACE(brand_name, ' ', '')) = ? AND brand_id != ?";

        try (PreparedStatement pstm = connection.prepareStatement(sql)) {
            pstm.setString(1, cleanedBrandName);
            pstm.setInt(2, currentBrandId);
            try (ResultSet rs = pstm.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
    
    //Ham nay check luc tao
    public boolean isBrandNameExists(String brandName) throws SQLException {
        // Loại bỏ tất cả khoảng trắng và chuyển về chữ thường
        String cleanedBrandName = brandName.replaceAll("\\s+", "").toLowerCase();

        String sql = "SELECT COUNT(*) FROM Brands WHERE LOWER(REPLACE(brand_name, ' ', '')) = ?";

        try (PreparedStatement pstm = connection.prepareStatement(sql)) {
            pstm.setString(1, cleanedBrandName);
            try (ResultSet rs = pstm.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
}
