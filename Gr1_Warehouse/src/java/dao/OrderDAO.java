/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.math.BigDecimal;
import java.util.List;
import model.OrderDetail;

/**
 *
 * @author HP
 */
public class OrderDAO extends DBContext {

   public boolean processCheckoutWithPayment(int userId, String customerName, String phoneNumber, String email,
        String shippingAddress, String notes, List<OrderDetail> orderDetails,
        BigDecimal totalAmount, String paymentMethod) {
    Connection conn = null;
    PreparedStatement orderStmt = null;
    PreparedStatement detailStmt = null;
    PreparedStatement paymentStmt = null;
    PreparedStatement stockStmt = null;
    int orderId = -1;

    try {
        conn = connection;
        conn.setAutoCommit(false);

        // Kiểm tra tồn kho trước khi tạo đơn hàng
        for (OrderDetail detail : orderDetails) {
            int stock = getStockByProductIdAndSize(detail.getProductId(), detail.getSizeId());
            if (stock < detail.getQuantity()) {
                throw new SQLException("Not enough stock for product ID " + detail.getProductId() + " and size ID " + detail.getSizeId());
            }
        }

        // Tạo đơn hàng
        String orderSQL = "INSERT INTO Orders (user_id, total_amount) VALUES (?, ?)";
        orderStmt = conn.prepareStatement(orderSQL, Statement.RETURN_GENERATED_KEYS);
        orderStmt.setInt(1, userId);
        orderStmt.setBigDecimal(2, totalAmount);
        orderStmt.executeUpdate();

        ResultSet rs = orderStmt.getGeneratedKeys();
        if (rs.next()) {
            orderId = rs.getInt(1);
        } else {
            throw new SQLException("Cannot retrieve Order ID.");
        }

        // Thêm chi tiết đơn hàng + trừ stock
        String detailSQL = "INSERT INTO OrderDetails (order_id, product_id, size_id, quantity, unit_price) VALUES (?, ?, ?, ?, ?)";
        detailStmt = conn.prepareStatement(detailSQL);

        for (OrderDetail detail : orderDetails) {
            detailStmt.setInt(1, orderId);
            detailStmt.setInt(2, detail.getProductId());
            detailStmt.setInt(3, detail.getSizeId());
            detailStmt.setInt(4, detail.getQuantity());
            detailStmt.setBigDecimal(5, detail.getUnitPrice());
            detailStmt.addBatch();

            // Trừ tồn kho từ InventoryBatches
            int remainingQuantity = detail.getQuantity();
            String stockUpdateSQL = "SELECT batch_id, quantity FROM InventoryBatches " +
                                    "WHERE variant_id = (SELECT variant_id FROM ProductVariants WHERE product_id = ? AND size_id = ?) " +
                                    "AND status = 'In Stock' " +
                                    "ORDER BY expiration_date ASC, received_date ASC";
            stockStmt = conn.prepareStatement(stockUpdateSQL, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            stockStmt.setInt(1, detail.getProductId());
            stockStmt.setInt(2, detail.getSizeId());
            ResultSet stockRS = stockStmt.executeQuery();

            while (stockRS.next() && remainingQuantity > 0) {
                int batchId = stockRS.getInt("batch_id");
                int availableQuantity = stockRS.getInt("quantity");

                int deductedQuantity = Math.min(remainingQuantity, availableQuantity);
                remainingQuantity -= deductedQuantity;
                int updatedQuantity = availableQuantity - deductedQuantity;

                stockRS.updateInt("quantity", updatedQuantity);
                stockRS.updateRow();

                if (updatedQuantity == 0) {
                    String updateStatusSQL = "UPDATE InventoryBatches SET status = 'Sold Out' WHERE batch_id = ?";
                    try (PreparedStatement updateStatusStmt = conn.prepareStatement(updateStatusSQL)) {
                        updateStatusStmt.setInt(1, batchId);
                        updateStatusStmt.executeUpdate();
                    }
                }
            }

            if (remainingQuantity > 0) {
                throw new SQLException("Stock inconsistency for product ID " + detail.getProductId() + " and size ID " + detail.getSizeId());
            }
        }

        detailStmt.executeBatch();

        // Xử lý thanh toán
        String paymentSQL = "INSERT INTO Payment (order_id, payment_method) VALUES (?, ?)";
        paymentStmt = conn.prepareStatement(paymentSQL);
        paymentStmt.setInt(1, orderId);
        paymentStmt.setString(2, paymentMethod);
        paymentStmt.executeUpdate();

        conn.commit();
        return true;
    } catch (SQLException e) {
        try {
            if (conn != null) {
                conn.rollback();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        e.printStackTrace();
        return false;
    } finally {
        try {
            if (orderStmt != null) orderStmt.close();
            if (detailStmt != null) detailStmt.close();
            if (paymentStmt != null) paymentStmt.close();
            if (stockStmt != null) stockStmt.close();
            if (conn != null) conn.setAutoCommit(true);
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


    public int getStockByProductIdAndSize(int productId, int sizeId) {
    String query = "SELECT SUM(ib.quantity) AS total_stock " +
                   "FROM InventoryBatches ib " +
                   "JOIN ProductVariants pv ON ib.variant_id = pv.variant_id " +
                   "WHERE pv.product_id = ? AND pv.size_id = ? " +
                   "AND ib.status = 'In Stock'";
    try (PreparedStatement ps = connection.prepareStatement(query)) {
        ps.setInt(1, productId);
        ps.setInt(2, sizeId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt("total_stock");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return 0;
}


}
