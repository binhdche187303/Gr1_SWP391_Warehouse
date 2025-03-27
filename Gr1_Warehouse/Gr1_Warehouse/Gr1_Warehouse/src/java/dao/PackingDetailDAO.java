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
import model.OrderDetail;
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

    public Map<String, Object> getOrderDetailById(int orderId) {
        Map<String, Object> orderDetail = new HashMap<>();
        List<Map<String, Object>> productList = new ArrayList<>();

        String sql = "SELECT "
                + "o.order_id, "
                + "o.order_date, "
                + "o.total_amount, "
                + "o.status AS order_status, "
                + "o.customer_name, "
                + "o.phone_number, "
                + "o.email, "
                + "o.shipping_address, "
                + "o.notes, "
                + "p.payment_id, "
                + "p.payment_method, "
                + "p.payment_date, "
                + "p.payment_status, "
                + "op.deposit_amount, "
                + "op.remaining_amount, "
                + "op.payment_status AS deposit_status, "
                + "od.applied_discount_percentage, "
                + "od.applied_amount, "
                + "od.applied_date, "
                + "odt.order_detail_id, "
                + "pr.product_id, "
                + "pr.product_name, "
                + "pv.sku, "
                + "s.size_name, "
                + "odt.quantity, "
                + "odt.unit_price, "
                + "(odt.quantity * odt.unit_price) AS total_price, "
                + "pd.packing_id, "
                + "pd.staff_id, "
                + "u.fullname AS staff_name, "
                + "pd.status AS packing_status, "
                + "pd.packed_at "
                + "FROM Orders o "
                + "LEFT JOIN Payment p ON o.order_id = p.order_id "
                + "LEFT JOIN OrderPayments op ON o.order_id = op.order_id "
                + "LEFT JOIN OrderDiscounts od ON o.order_id = od.order_id "
                + "LEFT JOIN OrderDetails odt ON o.order_id = odt.order_id "
                + "LEFT JOIN Products pr ON odt.product_id = pr.product_id "
                + "LEFT JOIN ProductVariants pv ON pr.product_id = pv.product_id AND odt.size_id = pv.size_id "
                + "LEFT JOIN Sizes s ON odt.size_id = s.size_id "
                + "LEFT JOIN PackingDetails pd ON o.order_id = pd.order_id "
                + "LEFT JOIN Users u ON pd.staff_id = u.user_id "
                + "WHERE o.order_id = ?;";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            try (ResultSet rs = stmt.executeQuery()) {
                boolean firstRow = true; // Đánh dấu hàng đầu tiên để lưu thông tin đơn hàng

                while (rs.next()) {
                    if (firstRow) { // Chỉ lưu thông tin đơn hàng một lần
                        orderDetail.put("order_id", rs.getInt("order_id"));
                        orderDetail.put("order_date", rs.getTimestamp("order_date"));
                        orderDetail.put("total_amount", rs.getBigDecimal("total_amount"));
                        orderDetail.put("order_status", rs.getString("order_status"));
                        orderDetail.put("customer_name", rs.getString("customer_name"));
                        orderDetail.put("phone_number", rs.getString("phone_number"));
                        orderDetail.put("email", rs.getString("email"));
                        orderDetail.put("shipping_address", rs.getString("shipping_address"));
                        orderDetail.put("notes", rs.getString("notes"));

                        // Payment details
                        orderDetail.put("payment_id", rs.getInt("payment_id"));
                        orderDetail.put("payment_method", rs.getString("payment_method"));
                        orderDetail.put("payment_date", rs.getTimestamp("payment_date"));
                        orderDetail.put("payment_status", rs.getString("payment_status"));

                        // Order payments
                        orderDetail.put("deposit_amount", rs.getBigDecimal("deposit_amount"));
                        orderDetail.put("remaining_amount", rs.getBigDecimal("remaining_amount"));
                        orderDetail.put("deposit_status", rs.getString("deposit_status"));

                        // Order discounts
                        orderDetail.put("applied_discount_percentage", rs.getBigDecimal("applied_discount_percentage"));
                        orderDetail.put("applied_amount", rs.getBigDecimal("applied_amount"));
                        orderDetail.put("applied_date", rs.getTimestamp("applied_date"));

                        // Packing details
                        orderDetail.put("packing_id", rs.getInt("packing_id"));
                        orderDetail.put("staff_id", rs.getInt("staff_id"));
                        orderDetail.put("staff_name", rs.getString("staff_name"));
                        orderDetail.put("packing_status", rs.getString("packing_status"));
                        orderDetail.put("packed_at", rs.getTimestamp("packed_at"));

                        firstRow = false;
                    }

                    // Thêm sản phẩm vào danh sách productList
                    Map<String, Object> product = new HashMap<>();
                    product.put("order_detail_id", rs.getInt("order_detail_id"));
                    product.put("product_id", rs.getInt("product_id"));
                    product.put("product_name", rs.getString("product_name"));
                    product.put("sku", rs.getString("sku"));
                    product.put("size_name", rs.getString("size_name"));
                    product.put("quantity", rs.getInt("quantity"));
                    product.put("unit_price", rs.getBigDecimal("unit_price"));
                    product.put("total_price", rs.getBigDecimal("total_price"));

                    productList.add(product);
                }

                // Gán danh sách sản phẩm vào orderDetail
                orderDetail.put("products", productList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderDetail;
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

    public boolean confirmPackingAndShip(int orderId) {
        String updatePackingSql = "UPDATE PackingDetails SET status = N'Đã gửi hàng' WHERE order_id = ?";
        String updateOrderSql = "UPDATE Orders SET status = N'Đã gửi hàng' WHERE order_id = ?";

        try {
            connection.setAutoCommit(false); // Bắt đầu transaction

            try (PreparedStatement updatePackingStmt = connection.prepareStatement(updatePackingSql); PreparedStatement updateOrderStmt = connection.prepareStatement(updateOrderSql)) {

                // Cập nhật trạng thái đóng gói
                updatePackingStmt.setInt(1, orderId);
                int packingUpdated = updatePackingStmt.executeUpdate();

                // Cập nhật trạng thái đơn hàng
                updateOrderStmt.setInt(1, orderId);
                int orderUpdated = updateOrderStmt.executeUpdate();

                if (packingUpdated > 0 && orderUpdated > 0) {
                    connection.commit(); // Xác nhận transaction nếu cả 2 bảng đều cập nhật thành công
                    return true;
                } else {
                    connection.rollback(); // Hoàn tác nếu có lỗi
                }
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

}
