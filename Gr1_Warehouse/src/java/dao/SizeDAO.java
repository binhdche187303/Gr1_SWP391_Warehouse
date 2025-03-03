/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import model.ProductVariants;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Sizes;

/**
 *
 * @author HP
 */
public class SizeDAO extends DBContext {

    public List<ProductVariants> getSizesByProductId(int productId) {
        List<ProductVariants> variants = new ArrayList<>();
        String query = "SELECT pv.variant_id, s.size_id, s.size_name, pv.price, "
                + "COALESCE(SUM(ib.quantity), 0) AS stock "
                + "FROM ProductVariants pv "
                + "JOIN Sizes s ON pv.size_id = s.size_id "
                + "LEFT JOIN InventoryBatches ib ON pv.variant_id = ib.variant_id "
                + "AND ib.status = 'In Stock' "
                + "WHERE pv.product_id = ? "
                + "GROUP BY pv.variant_id, s.size_id, s.size_name, pv.price";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ProductVariants variant = new ProductVariants();
                int varId = rs.getInt("variant_id");
                int sizeId = rs.getInt("size_id");
                String sizeName = rs.getString("size_name");
                BigDecimal price = rs.getBigDecimal("price");
                int stock = rs.getInt("stock");

                Sizes size = new Sizes(sizeId, sizeName);
                variant.setVariantId(varId);
                variant.setStock(stock);
                variant.setPrice(price);
                variant.setSize(size);

                variants.add(variant);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return variants;
    }

    public List<Sizes> getAllSizes() {

        List<Sizes> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Sizes";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Sizes size = new Sizes();
                size.setSize_id(rs.getInt("size_id"));
                size.setSize_name(rs.getString("size_name"));
                list.add(size);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean createSize(String sizeName) throws SQLException {
        String sql = "INSERT INTO Sizes (size_name) VALUES (?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, sizeName);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            throw new SQLException("Tên thương hiệu đã tồn tại!", e);
        }
    }

    // Kiểm tra xem tên thương hiệu đã tồn tại chưa
    public boolean isSizeNameExists(String sizeName) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Sizes WHERE size_name = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, sizeName);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // Nếu COUNT > 0 tức là đã tồn tại
                }
            }
        }
        return false;
    }

    public boolean updateSize(int sizeId, String sizeName) {
        boolean result = false;
        PreparedStatement ps = null;

        try {

            // SQL query to update size
            String sql = "UPDATE Sizes SET size_name = ? WHERE size_id = ?";

            // Create prepared statement
            ps = connection.prepareStatement(sql);
            ps.setString(1, sizeName);
            ps.setInt(2, sizeId);

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
        SizeDAO sd = new SizeDAO();
        List<Sizes> l = sd.getAllSizes();
        for (Sizes size : l) {
            System.out.println(size.getSize_name());
        }
    }

}
