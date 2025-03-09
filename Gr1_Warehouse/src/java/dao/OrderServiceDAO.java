/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.math.BigDecimal;
import java.net.URLEncoder;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Order;
import model.OrderPayment;
import java.sql.Timestamp;

/**
 *
 * @author Dell
 */
public class OrderServiceDAO extends DBContext {

    public boolean confirmOrder(int orderId) {
        String sql = "UPDATE dbo.Orders SET status = N'Đã xác nhận' WHERE order_id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            // Thiết lập giá trị cho câu lệnh SQL
            st.setInt(1, orderId);

            int rowsAffected = st.executeUpdate();

            // Nếu đơn hàng được xác nhận, gửi thông báo cọc
            if (rowsAffected > 0) {
                sendDepositNotification(orderId); // Gọi phương thức gửi thông báo cọc
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public String sendDepositNotification(int orderId) {
        try {
            Order order = getOrderById(orderId);
            if (order == null) {
                System.err.println("❌ Không tìm thấy đơn hàng ID: " + orderId);
                return "Không tìm thấy đơn hàng. Vui lòng thử lại sau.";
            }
            // Tạo thông báo yêu cầu thanh toán cọc 50%
            String message = "Đơn hàng #" + orderId + " của bạn đã được xác nhận. Vui lòng thanh toán cọc 50%. Cảm ơn bạn đã mua hàng!";
            return message;
        } catch (Exception e) {
            e.printStackTrace();
            return "Lỗi khi gửi thông báo. Vui lòng thử lại sau.";
        }
    }

    public Order getOrderById(int orderId) {
        Order order = null;
        String sql = "SELECT * FROM Orders WHERE order_id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    order = new Order();
                    order.setOrderId(rs.getInt("order_id")); // Cột trong cơ sở dữ liệu
                    order.setTotalAmount(rs.getBigDecimal("total_amount")); // ✅ Đúng
                    // Nếu cần, bạn có thể lấy thêm thông tin userId từ đơn hàng
                    order.setUserId(rs.getInt("user_id")); // Cập nhật từ cơ sở dữ liệu
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return order;
    }

    private double getTotalAmountByOrderId(String orderId) {
        double totalAmount = 0.0;
        String sql = "SELECT SUM(quantity * price) AS totalAmount FROM OrderDetail WHERE orderId = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, orderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalAmount = rs.getDouble("totalAmount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Lấy 50% tổng số tiền
        return totalAmount * 0.5;
    }

    public boolean updatePaymentStatus(int orderId, String status) {
        String sql = "UPDATE dbo.Payment SET payment_status = ? WHERE order_id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, status);
            st.setInt(2, orderId);

            int rowsAffected = st.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean insertOrderDeposit(int orderId) {
        boolean isInserted = false;
        String sql = "INSERT INTO OrderPayments (order_id, deposit_amount, remaining_amount, payment_status) "
                + "SELECT ?, total_amount * 0.5, total_amount * 0.5, 'Đã thanh toán 50%' "
                + "FROM Orders WHERE order_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ps.setInt(2, orderId);

            int rowsInserted = ps.executeUpdate();
            isInserted = rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isInserted;
    }

    public OrderPayment getOrderPaymentByOrderId(int orderId) {
        String sql = "SELECT * FROM OrderPayments WHERE order_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new OrderPayment(
                        rs.getInt("payment_id"),
                        rs.getInt("order_id"),
                        rs.getBigDecimal("deposit_amount"),
                        rs.getBigDecimal("remaining_amount"),
                        rs.getString("payment_status"),
                        rs.getTimestamp("created_at"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

// Phương thức để lấy trạng thái hiện tại của đơn hàng
    public String getOrderStatus(int orderId) {
        String status = "";
        String sql = "SELECT payment_status FROM Payment WHERE order_id = ?";  // Sửa lại để đúng với trường `order_id`

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, orderId);  // Sử dụng `orderId` làm tham số truy vấn
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                status = rs.getString("payment_status");  // Truyền đúng tên cột `payment_status` vào
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    public static void main(String[] args) {
        OrderServiceDAO osd= new OrderServiceDAO();
        OrderPayment op= osd.getOrderPaymentByOrderId(1);
        System.out.println(op.getPaymentStatus());
    }
}
