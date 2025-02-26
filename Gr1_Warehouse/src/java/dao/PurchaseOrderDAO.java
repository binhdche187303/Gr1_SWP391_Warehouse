package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import model.PurchaseOrder;
import model.PurchaseDetails;
import java.sql.*;
import java.text.SimpleDateFormat;
import model.PurchaseOrderDetailDTO;
import model.Suppliers;
import model.User;
import model.Warehouse;

public class PurchaseOrderDAO extends DBContext {

    public int insertPurchaseOrder(PurchaseOrder order) {
        String sql = "INSERT INTO PurchaseOrder (order_date, supplier_id, total_amount, bill_img_url, status, notes, warehouse_id, user_id, reference_code) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            // Sử dụng Statement.RETURN_GENERATED_KEYS để lấy khóa chính mới được tạo
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            st.setTimestamp(1, new java.sql.Timestamp(order.getOrderDate().getTime()));
            st.setInt(2, order.getSupplierId());
            st.setDouble(3, order.getTotalAmount());
            st.setString(4, order.getBillImgUrl());
            st.setString(5, order.getStatus());
            st.setString(6, order.getNotes());
            st.setInt(7, order.getWarehouseId());
            st.setInt(8, order.getUserId());
            st.setString(9, order.getReferenceCode());

            int rowsAffected = st.executeUpdate(); // Thực thi câu lệnh

            if (rowsAffected > 0) {
                ResultSet generatedKeys = st.getGeneratedKeys();
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1); // Lấy order_id mới được tạo
                }
            }
        } catch (Exception e) {
            System.out.println("Lỗi khi thực thi SQL: " + e.getMessage());
            e.printStackTrace();
        }
        return -1; // Nếu có lỗi, trả về -1
    }

    // Lấy danh sách tất cả đơn hàng
    public List<PurchaseOrder> getAllPurchaseOrders() {
        List<PurchaseOrder> orders = new ArrayList<>();
        String sql = "SELECT * FROM PurchaseOrder";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                PurchaseOrder order = new PurchaseOrder();
                order.setOrderId(rs.getInt("order_id"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setSupplierId(rs.getInt("supplier_id"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setBillImgUrl(rs.getString("bill_img_url"));
                order.setStatus(rs.getString("status"));
                order.setNotes(rs.getString("notes"));
                order.setWarehouseId(rs.getInt("warehouse_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setReferenceCode(rs.getString("reference_code"));
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    // ✅ Tìm lô hàng dựa trên variant_id
    public int findExistingBatchByVariantId(int variantId, String expirationDate, int warehouseId) {
        int batchId = -1;
        String sql = "SELECT batch_id FROM InventoryBatches WHERE variant_id = ? AND warehouse_id = ? AND (expiration_date = ? OR expiration_date IS NULL)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, variantId);
            stmt.setInt(2, warehouseId);

            if (expirationDate != null && !expirationDate.isEmpty()) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                stmt.setDate(3, new java.sql.Date(sdf.parse(expirationDate).getTime()));
            } else {
                stmt.setNull(3, Types.DATE);
            }

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    batchId = rs.getInt("batch_id");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return batchId;
    }

    // ✅ Tạo lô hàng mới với variant_id
    public int insertNewBatchByVariantId(int variantId, int quantity, double unitPrice, String expirationDate, int warehouseId) {
        int batchId = -1;
        String sql = "INSERT INTO InventoryBatches (variant_id, quantity, unit_price, expiration_date, received_date, warehouse_id) "
                + "VALUES (?, ?, ?, ?, GETDATE(), ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, variantId);
            stmt.setInt(2, quantity);
            stmt.setDouble(3, unitPrice);

            if (expirationDate != null && !expirationDate.isEmpty()) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                stmt.setDate(4, new java.sql.Date(sdf.parse(expirationDate).getTime()));
            } else {
                stmt.setNull(4, Types.DATE);
            }

            stmt.setInt(5, warehouseId);
            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        batchId = rs.getInt(1);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return batchId;
    }

    // ✅ Thêm chi tiết nhập hàng với variant_id
    public boolean insertPurchaseDetailsByVariantId(PurchaseDetails purchaseDetails) {
        String sql = "INSERT INTO PurchaseDetails (order_id, variant_id, quantity, unit_price, expiration_date, batch_id, warehouse_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, purchaseDetails.getOrderId());
            stmt.setInt(2, purchaseDetails.getVariantId());
            stmt.setInt(3, purchaseDetails.getQuantity());
            stmt.setDouble(4, purchaseDetails.getUnitPrice());

            if (purchaseDetails.getExpirationDate() != null) {
                stmt.setTimestamp(5, purchaseDetails.getExpirationDate());
            } else {
                stmt.setNull(5, Types.TIMESTAMP);
            }

            stmt.setInt(6, purchaseDetails.getBatchId());
            stmt.setInt(7, purchaseDetails.getWarehouseId());

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ Cập nhật số lượng lô hàng
    public boolean updateBatchQuantity(int batchId, int quantity) {
        String sql = "UPDATE InventoryBatches SET quantity = quantity + ? WHERE batch_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setInt(2, batchId);
            return st.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public PurchaseOrderDetailDTO getOrderDetail(int orderId) {
        String sql = """
            SELECT 
                po.reference_code,
                po.order_date,
                po.status,
                s.supplier_name, s.address AS supplier_address, s.email AS supplier_email, s.phone AS supplier_phone,
                w.warehouse_name, w.address AS warehouse_address, w.phone AS warehouse_phone,
                u.fullname AS processed_by,
                po.notes,
                po.bill_img_url,
                po.total_amount,
                pd.detail_id,
                p.product_name,
                pv.sku,
                pd.quantity,
                pd.unit_price,
                pd.total_price
            FROM PurchaseOrder po
            JOIN Suppliers s ON po.supplier_id = s.supplier_id
            JOIN Warehouses w ON po.warehouse_id = w.warehouse_id
            JOIN Users u ON po.user_id = u.user_id
            JOIN PurchaseDetails pd ON po.order_id = pd.order_id
            JOIN ProductVariants pv ON pd.variant_id = pv.variant_id
            JOIN Products p ON pv.product_id = p.product_id
            WHERE po.order_id = ?;
        """;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();

            PurchaseOrderDetailDTO orderDetail = null;
            List<PurchaseDetails> purchaseDetailsList = new ArrayList<>();

            while (rs.next()) {
                if (orderDetail == null) {
                    // Khởi tạo PurchaseOrder
                    PurchaseOrder order = new PurchaseOrder();
                    order.setReferenceCode(rs.getString("reference_code"));
                    order.setOrderDate(rs.getTimestamp("order_date"));
                    order.setStatus(rs.getString("status"));
                    order.setNotes(rs.getString("notes"));
                    order.setBillImgUrl(rs.getString("bill_img_url"));
                    order.setTotalAmount(rs.getDouble("total_amount"));

                    // Khởi tạo Suppliers
                    Suppliers supplier = new Suppliers();
                    supplier.setSupplierName(rs.getString("supplier_name"));
                    supplier.setAddress(rs.getString("supplier_address"));
                    supplier.setEmail(rs.getString("supplier_email"));
                    supplier.setPhone(rs.getString("supplier_phone"));

                    // Khởi tạo Warehouse
                    Warehouse warehouse = new Warehouse();
                    warehouse.setWarehouseName(rs.getString("warehouse_name"));
                    warehouse.setAddress(rs.getString("warehouse_address"));
                    warehouse.setPhone(rs.getString("warehouse_phone"));

                    // Khởi tạo User (Processed by)
                    User processedBy = new User();
                    processedBy.setFullname(rs.getString("processed_by"));

                    // Tạo đối tượng PurchaseOrderDetailDTO
                    orderDetail = new PurchaseOrderDetailDTO();
                    orderDetail.setOrder(order);
                    orderDetail.setSupplier(supplier);
                    orderDetail.setWarehouse(warehouse);
                    orderDetail.setProcessedBy(processedBy);
                    orderDetail.setPurchaseDetails(purchaseDetailsList);
                }

                // Tạo PurchaseDetails cho từng sản phẩm trong đơn hàng
                PurchaseDetails purchaseDetail = new PurchaseDetails();
                purchaseDetail.setDetailId(rs.getInt("detail_id"));
                purchaseDetail.setSku(rs.getString("sku"));
                purchaseDetail.setQuantity(rs.getInt("quantity"));
                purchaseDetail.setUnitPrice(rs.getDouble("unit_price"));
                purchaseDetail.setTotalPrice(rs.getDouble("total_price"));

                // Thêm vào danh sách chi tiết sản phẩm
                purchaseDetailsList.add(purchaseDetail);
            }
            return orderDetail;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
