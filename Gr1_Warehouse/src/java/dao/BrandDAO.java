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

    // Kiểm tra xem tên thương hiệu đã tồn tại chưa
    public boolean isBrandNameExists(String brandName) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Brands WHERE brand_name = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, brandName);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // Nếu COUNT > 0 tức là đã tồn tại
                }
            }
        }
        return false;
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

    public static void main(String[] args) {
        BrandDAO bd = new BrandDAO();
        List<Brands> l = bd.getAllBrands();
        for (Brands brands : l) {
            System.out.println(brands.getBrand_name());
        }
    }
}