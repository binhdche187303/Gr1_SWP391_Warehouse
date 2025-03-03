/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Order;
import model.PackingDetail;
import model.Payment;

/**
 *
 * @author Dell
 */
public class PackingDetailDAO extends DBContext {

    public List<Map<String, Object>> getPendingPackingOrdersWithPaymentStatus() {
        List<Map<String, Object>> orders = new ArrayList<>();
        String sql = "SELECT o.order_id, o.user_id, o.order_date, o.total_amount, o.status, "
                + "o.customer_name, o.phone_number, o.email, o.shipping_address, o.notes, p.payment_status "
                + "FROM Orders o "
                + "JOIN Payment p ON o.order_id = p.order_id "
                + "WHERE o.status = N'Đã xác nhận' AND p.payment_status = N'Thanh toán 50%'";

        try (PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> orderData = new HashMap<>();
                orderData.put("order_id", rs.getInt("order_id"));
                orderData.put("user_id", rs.getInt("user_id"));
                orderData.put("order_date", rs.getTimestamp("order_date"));
                orderData.put("total_amount", rs.getBigDecimal("total_amount"));
                orderData.put("status", rs.getString("status"));
                orderData.put("customer_name", rs.getString("customer_name"));
                orderData.put("phone_number", rs.getString("phone_number"));
                orderData.put("email", rs.getString("email"));
                orderData.put("shipping_address", rs.getString("shipping_address"));
                orderData.put("notes", rs.getString("notes"));
                orderData.put("payment_status", rs.getString("payment_status"));

                orders.add(orderData);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    public boolean assignPackingOrder(int orderId, int staffId) {
        try {
            // Kiểm tra nếu đơn hàng đã có nhân viên đóng gói chưa
            String checkOrderSql = "SELECT COUNT(*) FROM PackingDetails WHERE order_id = ?";
            try (PreparedStatement checkOrderStmt = connection.prepareStatement(checkOrderSql)) {
                checkOrderStmt.setInt(1, orderId);
                try (ResultSet rs = checkOrderStmt.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        System.out.println("Đơn hàng đã có nhân viên đóng gói.");
                        return false;
                    }
                }
            }

            // Chèn vào bảng PackingDetails
            String insertSql = "INSERT INTO PackingDetails (order_id, staff_id, status) VALUES (?, ?, N'Đang đóng gói')";
            String updateOrderSql = "UPDATE Orders SET status = N'Đang đóng gói' WHERE order_id = ?";

            try (PreparedStatement insertStmt = connection.prepareStatement(insertSql); PreparedStatement updateStmt = connection.prepareStatement(updateOrderSql)) {

                connection.setAutoCommit(false);

                insertStmt.setInt(1, orderId);
                insertStmt.setInt(2, staffId);
                int insertResult = insertStmt.executeUpdate();

                if (insertResult > 0) {
                    updateStmt.setInt(1, orderId);
                    updateStmt.executeUpdate();
                    connection.commit();
                    return true;
                }

                connection.rollback();
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean updatePackingStatus(int packingId, int staffId) {
        // Chỉ cho phép nhân viên đóng gói xác nhận đơn hàng của chính họ
        String checkSql = "SELECT COUNT(*) FROM PackingDetails WHERE packing_id = ? AND staff_id = ?";
        try (PreparedStatement checkStmt = connection.prepareStatement(checkSql)) {
            checkStmt.setInt(1, packingId);
            checkStmt.setInt(2, staffId);
            try (ResultSet rs = checkStmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) == 0) {
                    System.out.println("Bạn không có quyền xác nhận đơn này.");
                    return false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        // Cập nhật trạng thái sang 'Đã đóng gói'
        String sql = "UPDATE PackingDetails SET status = N'Đã đóng gói', packed_at = GETDATE() WHERE packing_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, packingId);
            return stmt.executeUpdate() > 0; // Trả về true nếu update thành công
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Map<String, Object>> getMyPackingOrders(int staffId) {
        List<Map<String, Object>> orders = new ArrayList<>();
        String sql = "SELECT o.order_id, o.status, p.payment_status "
                + "FROM Orders o "
                + "JOIN Payment p ON o.order_id = p.order_id "
                + "JOIN PackingDetails pd ON o.order_id = pd.order_id "
                + "WHERE pd.staff_id = ?"; // Lọc theo nhân viên đã nhận đơn

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, staffId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> orderData = new HashMap<>();
                    orderData.put("order_id", rs.getInt("order_id"));
                    orderData.put("status", rs.getString("status"));
                    orderData.put("payment_status", rs.getString("payment_status"));
                    orders.add(orderData);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

}
