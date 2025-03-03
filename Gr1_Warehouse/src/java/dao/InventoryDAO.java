/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.InventoryBatches;
import model.ProductVariants;
import model.Products;
import model.Sizes;

public class InventoryDAO extends DBContext{
   public List<ProductVariants> getProductsByWarehouseId(int warehouseId) {
    List<ProductVariants> products = new ArrayList<>();
    String sql = "SELECT p.product_id, p.product_name, pv.variant_id, " +
                 "s.size_name, pv.sku, ib.batch_id, ib.quantity, ib.unit_price, ib.expiration_date " +
                 "FROM InventoryBatches ib " +
                 "JOIN ProductVariants pv ON ib.variant_id = pv.variant_id " +
                 "JOIN Products p ON pv.product_id = p.product_id " +
                 "JOIN Sizes s ON pv.size_id = s.size_id " +
                 "WHERE ib.warehouse_id = ? " +
                 "ORDER BY pv.variant_id, ib.batch_id";

    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, warehouseId);
        ResultSet rs = ps.executeQuery();

        Map<Integer, ProductVariants> variantMap = new HashMap<>();

        while (rs.next()) {
            int variantId = rs.getInt("variant_id");

            ProductVariants variant = variantMap.get(variantId);
            if (variant == null) {
                variant = new ProductVariants();
                variant.setVariantId(variantId);

                Products product = new Products();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                variant.setProduct(product);

                Sizes size = new Sizes();
                size.setSize_name(rs.getString("size_name"));
                variant.setSize(size);

                variant.setSku(rs.getString("sku"));
                variant.setPrice(rs.getBigDecimal("unit_price")); // Lấy giá từ lô hàng đầu tiên

                // Khởi tạo danh sách lô hàng
                variant.setInventoryBatches(new ArrayList<>());

                variantMap.put(variantId, variant);
            }

            // Tạo lô hàng
            InventoryBatches batch = new InventoryBatches();
            batch.setBatchId(rs.getInt("batch_id"));
            batch.setQuantity(rs.getInt("quantity"));
            batch.setUnitPrice(rs.getBigDecimal("unit_price"));
            batch.setExpirationDate(rs.getDate("expiration_date"));

            // Thêm vào danh sách lô hàng của variant
            variant.getInventoryBatches().add(batch);
        }

        products.addAll(variantMap.values());
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return products;
}

    public boolean insertInventoryCheck(int warehouseId, int managerId, int staffId) {
        String sql = "INSERT INTO InventoryCheck (check_date, warehouse_id, created_by, reviewed_by) VALUES (GETDATE(), ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, warehouseId);
            stmt.setInt(2, managerId);
            stmt.setInt(3, staffId);
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

