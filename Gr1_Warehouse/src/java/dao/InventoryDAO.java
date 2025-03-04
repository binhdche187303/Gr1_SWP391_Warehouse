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
import model.InventoryCheck;
import model.InventoryCheckDTO;
import model.ProductVariants;
import model.Products;
import model.Sizes;
import model.User;
import model.Warehouse;

public class InventoryDAO extends DBContext {
    public boolean insertInventoryDetails(int inventoryCheckId, int productId, double differenceUp, double differenceDown, double priceDifferenceUp, double priceDifferenceDown, String notes) {
    String sql = "INSERT INTO InventoryDetails (inventory_check_id, product_id, difference_up, difference_down, price_difference_up, price_difference_down, notes) VALUES (?, ?, ?, ?, ?, ?, ?)";
    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        stmt.setInt(1, inventoryCheckId);  // Sử dụng inventory_check_id từ request
        stmt.setInt(2, productId);
        stmt.setDouble(3, differenceUp);
        stmt.setDouble(4, differenceDown);
        stmt.setDouble(5, priceDifferenceUp);
        stmt.setDouble(6, priceDifferenceDown);
        stmt.setString(7, notes);
        int rowsInserted = stmt.executeUpdate();
        return rowsInserted > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}

    public boolean updateInventoryCheckStatus(int inventoryCheckId) {
    String sql = "UPDATE InventoryCheck SET completed_at = GETDATE(), status = 'Đã kiểm kho' WHERE inventory_check_id = ?";
    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        stmt.setInt(1, inventoryCheckId);
        int rowsUpdated = stmt.executeUpdate();
        return rowsUpdated > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}

  
    public InventoryCheck getInventoryCheckDetails(int checkId) {
        InventoryCheck check = null;
        String sql = "SELECT \n"
                + "    ic.check_id AS inventory_check_id,        \n"
                + "    ic.status AS inventory_check_status,      \n"
                + "    ic.check_date,                            \n"
                + "    ic.completed_at,                          \n"
                + "    w.warehouse_id,  \n"
                + "    w.warehouse_name,                         \n"
                + "    w.address AS warehouse_address,           \n"
                + "    w.phone AS warehouse_phone,               \n"
                + "    u1.user_id AS created_by_id,\n"
                + "    u1.username AS created_by_name,           \n"
                + "    u1.email AS created_by_email,             \n"
                + "    u1.phone AS created_by_phone,             \n"
                + "    u2.user_id AS reviewed_by_id,  \n"
                + "    u2.username AS reviewed_by_name,          \n"
                + "    u2.email AS reviewed_by_email,            \n"
                + "    u2.phone AS reviewed_by_phone             \n"
                + "FROM InventoryCheck ic\n"
                + "JOIN Warehouses w ON ic.warehouse_id = w.warehouse_id\n"
                + "JOIN Users u1 ON ic.created_by = u1.user_id\n"
                + "LEFT JOIN Users u2 ON ic.reviewed_by = u2.user_id\n"
                + "WHERE ic.check_id = ?;";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, checkId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // Tạo object Warehouse
                Warehouse warehouse = new Warehouse(
                        rs.getInt("warehouse_id"),
                        rs.getString("warehouse_name"),
                        rs.getString("warehouse_phone"),
                        rs.getString("warehouse_address")
                );

                // Tạo object User cho người tạo phiếu
                User createdBy = new User(
                        rs.getInt("created_by_id"),
                        rs.getString("created_by_name"),
                        rs.getString("created_by_phone"),
                        rs.getString("created_by_email")
                        
                );

                // Tạo object User cho người giám sát (nếu có)
                User reviewedBy = null;
                if (rs.getObject("reviewed_by_id") != null) {  // Fix lỗi NULL
                    reviewedBy = new User(
                            rs.getInt("reviewed_by_id"),
                            rs.getString("reviewed_by_name"),
                            rs.getString("reviewed_by_phone"),
                            rs.getString("reviewed_by_email")
                    );
                }

                // Tạo object InventoryCheck
                check = new InventoryCheck(
                        rs.getInt("inventory_check_id"), // Đúng alias
                        rs.getString("inventory_check_status"), // Đúng alias
                        rs.getTimestamp("check_date"),
                        rs.getTimestamp("completed_at"),
                        warehouse, // Gán warehouse vào InventoryCheck
                        createdBy, // Gán người tạo vào InventoryCheck
                        reviewedBy // Gán người giám sát vào InventoryCheck (có thể null)
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }

    public List<InventoryCheckDTO> getAllInventoryCheckByStaffId(int staffId) {
        List<InventoryCheckDTO> list = new ArrayList<>();
        String sql = "SELECT ic.check_id, ic.check_date, ic.completed_at, w.warehouse_name, ic.status, "
                + "u1.fullname AS created_by_name, u2.fullname AS reviewed_by_name, "
                + "COALESCE(SUM(icd.discrepancy), 0) AS total_discrepancy, "
                + "COALESCE(SUM(icd.discrepancyPrice), 0) AS total_discrepancy_value "
                + "FROM InventoryCheck ic "
                + "LEFT JOIN Warehouses w ON ic.warehouse_id = w.warehouse_id "
                + "LEFT JOIN Users u1 ON ic.created_by = u1.user_id "
                + "LEFT JOIN Users u2 ON ic.reviewed_by = u2.user_id "
                + "LEFT JOIN InventoryCheckDetails icd ON ic.check_id = icd.check_id "
                + "WHERE ic.reviewed_by = ? "
                + "GROUP BY ic.check_id, ic.check_date, ic.completed_at, w.warehouse_name, ic.status, u1.fullname, u2.fullname";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, staffId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                InventoryCheckDTO check = new InventoryCheckDTO();
                check.setCheckId(rs.getInt("check_id"));
                check.setWarehouseName(rs.getString("warehouse_name"));
                check.setStatus(rs.getString("status"));
                check.setCheckDate(rs.getTimestamp("check_date"));
                check.setCompleteDate(rs.getTimestamp("completed_at"));
                check.setCreatedBy(rs.getString("created_by_name"));
                check.setReviewedBy(rs.getString("reviewed_by_name"));
                check.setTotalDiscrepancy(rs.getInt("total_discrepancy"));
                check.setTotalDiscrepancyValue(rs.getDouble("total_discrepancy_value"));
                list.add(check);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ProductVariants> getProductsByWarehouseId(int warehouseId) {
        List<ProductVariants> products = new ArrayList<>();
        String sql = "SELECT p.product_id, p.product_name, pv.variant_id, "
                + "s.size_name, pv.sku, ib.batch_id, ib.quantity, ib.unit_price, ib.expiration_date "
                + "FROM InventoryBatches ib "
                + "JOIN ProductVariants pv ON ib.variant_id = pv.variant_id "
                + "JOIN Products p ON pv.product_id = p.product_id "
                + "JOIN Sizes s ON pv.size_id = s.size_id "
                + "WHERE ib.warehouse_id = ? "
                + "ORDER BY pv.variant_id, ib.batch_id";

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
