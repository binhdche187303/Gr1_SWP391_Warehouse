package dao;

import java.math.BigDecimal;
import model.Discounts;
import model.OrderDiscount;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDiscountDAO extends DBContext {

//// 1️⃣ Lấy danh sách mã giảm giá theo orderId
//    public List<OrderDiscount> getDiscountsByOrderId(int orderId) {
//        List<OrderDiscount> list = new ArrayList<>();
//        String sql = "SELECT * FROM OrderDiscounts WHERE order_id = ?";
//
//        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
//            stmt.setInt(1, orderId);
//            ResultSet rs = stmt.executeQuery();
//
//            while (rs.next()) {
//                OrderDiscount od = new OrderDiscount();
//                od.setId(rs.getInt("id"));
//                od.setOrderId(rs.getInt("order_id"));
//                od.setDiscountId(rs.getInt("discount_id"));
//                od.setAppliedDiscountPercentage(rs.getDouble("applied_discount_percentage"));  // Sử dụng BigDecimal
//                od.setAppliedAmount(rs.getBigDecimal("applied_amount"));  // Sử dụng BigDecimal
//                od.setAppliedDate(rs.getTimestamp("applied_date").toLocalDateTime());
//
//                list.add(od);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return list;
//    }

    // Kiểm xem đơn đã áp dụng phần trăm chiết khấu từ seller chưa
    public boolean isDiscountApplied(int orderId) {
        String sql = "SELECT 1 FROM OrderDiscounts WHERE order_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();
            return rs.next(); // Nếu có dữ liệu nghĩa là mã giảm giá đã được áp dụng
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Ghi lại lịch sử áp dụng phân trăm chiết khấu từ seller
    public boolean insertOrderDiscount(OrderDiscount orderDiscount) {
        String sql = "INSERT INTO OrderDiscounts (order_id, applied_discount_percentage, applied_amount, applied_date) VALUES (?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderDiscount.getOrderId());
            stmt.setDouble(2, orderDiscount.getAppliedDiscountPercentage()); // Dùng double nếu cần
            stmt.setBigDecimal(3, orderDiscount.getAppliedAmount()); // BigDecimal cho số tiền
            stmt.setTimestamp(4, Timestamp.valueOf(orderDiscount.getAppliedDate())); // LocalDateTime -> Timestamp

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Cập nhật tổng giá sau khi áp dụng phân trăm chiết khấu từ seller
    public void updateTotalAfterDiscount(int orderId) {
        String sql = """
        UPDATE Orders 
        SET total_amount = (
            SELECT total_before * (1 - total_discount / 100)
            FROM (
                SELECT SUM(od.unit_price * od.quantity) AS total_before, 
                       COALESCE(MAX(odc.applied_discount_percentage), 0) AS total_discount
                FROM OrderDetails od
                LEFT JOIN OrderDiscounts odc ON od.order_id = odc.order_id
                WHERE od.order_id = ?
            ) AS subquery
        ) 
        WHERE order_id = ?;
    """;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            stmt.setInt(2, orderId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

//    // 5️⃣ Xóa mã giảm giá khỏi đơn hàng
//    public boolean removeDiscount(int orderId, int discountId) {
//        String sql = "DELETE FROM OrderDiscounts WHERE order_id = ? AND discount_id = ?";
//        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
//            stmt.setInt(1, orderId);
//            stmt.setInt(2, discountId);
//            return stmt.executeUpdate() > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
//        }
//    }

// 6️⃣ Lấy thông tin giảm giá theo mã
//    public Discounts getDiscountByCode(String discountCode) {
//        String sql = "SELECT * FROM Discounts WHERE discount_code = ?";
//        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
//            stmt.setString(1, discountCode);
//            try (ResultSet rs = stmt.executeQuery()) {
//                if (rs.next()) {
//                    Discounts discount = new Discounts();
//                    discount.setDiscount_id(rs.getInt("discount_id"));
//                    discount.setDiscount_code(rs.getString("discount_code"));
//                    discount.setDiscount_percentage(rs.getDouble("discount_percentage"));
//                    discount.setStatus(rs.getString("status"));
//
//                    // Kiểm tra nếu status là null hoặc không phải "Active"
//                    if (discount.getStatus() == null || !discount.getStatus().equals("Active")) {
//                        return null;  // Trả về null nếu mã giảm giá không có trạng thái 'Active'
//                    }
//
//                    return discount;
//                }
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return null;
//    }

//    public OrderDiscount getExistingOrderDiscount(int orderId) {
//        OrderDiscount orderDiscount = null;
//        String sql = "SELECT * FROM OrderDiscounts WHERE order_id = ?";
//        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
//            stmt.setInt(1, orderId);
//            ResultSet rs = stmt.executeQuery();
//            if (rs.next()) {
//                orderDiscount = new OrderDiscount();
//                orderDiscount.setId(rs.getInt("id"));
//                orderDiscount.setOrderId(rs.getInt("order_id"));
//                orderDiscount.setDiscountId(rs.getInt("discount_id"));
//                orderDiscount.setAppliedDiscountPercentage(rs.getDouble("applied_discount_percentage"));
//                orderDiscount.setAppliedAmount(rs.getBigDecimal("applied_amount"));
//                orderDiscount.setAppliedDate(rs.getTimestamp("applied_date").toLocalDateTime());
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return orderDiscount;
//    }

    // Lấy tổng tiền sau khi chiết khấu
    public BigDecimal getTotalAmount(int orderId) {
        String sql = "SELECT total_amount FROM Orders WHERE order_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // Lấy tổng tiền mới sau giảm giá dưới dạng BigDecimal
                return rs.getBigDecimal("total_amount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return BigDecimal.ZERO; // Trả về BigDecimal.ZERO nếu không có kết quả
    }

}