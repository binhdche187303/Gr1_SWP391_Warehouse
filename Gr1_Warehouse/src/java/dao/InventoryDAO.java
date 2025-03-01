/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.ProductVariants;
import model.Products;
import model.Sizes;

public class InventoryDAO extends DBContext{
    public List<ProductVariants> getProductsByWarehouseId(int warehouseId) {
        List<ProductVariants> products = new ArrayList<>();
        String sql = "SELECT p.product_id, p.product_name, pv.variant_id, " +
                     "s.size_name, pv.sku, SUM(ib.quantity) AS total_quantity " +
                     "FROM InventoryBatches ib " +
                     "JOIN ProductVariants pv ON ib.variant_id = pv.variant_id " +
                     "JOIN Products p ON pv.product_id = p.product_id " +
                     "JOIN Sizes s ON pv.size_id = s.size_id " +
                     "WHERE ib.warehouse_id = ? " +
                     "GROUP BY p.product_id, p.product_name, pv.variant_id, s.size_name, pv.sku " +
                     "ORDER BY pv.variant_id";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, warehouseId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductVariants variant = new ProductVariants();
                variant.setVariantId(rs.getInt("variant_id"));

                Products product = new Products();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                variant.setProduct(product);

                Sizes size = new Sizes();
                size.setSize_name(rs.getString("size_name"));
                variant.setSize(size);

                variant.setSku(rs.getString("sku"));
                variant.setStock(rs.getInt("total_quantity"));

                products.add(variant);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }
}

