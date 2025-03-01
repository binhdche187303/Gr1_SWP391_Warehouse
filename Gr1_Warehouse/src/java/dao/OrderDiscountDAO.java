package dao;

import java.math.BigDecimal;
import model.Discounts;
import model.OrderDiscount;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDiscountDAO extends DBContext {

// 1️⃣ Lấy danh sách mã giảm giá theo orderId
    public List<OrderDiscount> getDiscountsByOrderId(int orderId) {
        List<OrderDiscount> list = new ArrayList<>();
        String sql = "SELECT * FROM OrderDiscounts WHERE order_id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                OrderDiscount od = new OrderDiscount();
                od.setId(rs.getInt("id"));
                od.setOrderId(rs.getInt("order_id"));
                od.setDiscountId(rs.getInt("discount_id"));
                od.setAppliedDiscountPercentage(rs.getDouble("applied_discount_percentage"));  // Sử dụng BigDecimal
                od.setAppliedAmount(rs.getBigDecimal("applied_amount"));  // Sử dụng BigDecimal
                od.setAppliedDate(rs.getTimestamp("applied_date").toLocalDateTime());

                list.add(od);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 2️⃣ Kiểm tra mã giảm giá đã được áp dụng hay chưa
    public boolean isDiscountApplied(int orderId, int discountId) {
        String sql = "SELECT 1 FROM OrderDiscounts WHERE order_id = ? AND discount_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            stmt.setInt(2, discountId);
            ResultSet rs = stmt.executeQuery();
            return rs.next(); // Nếu có dữ liệu nghĩa là mã đã được áp dụng
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

// 3️⃣ Thêm mã giảm giá vào đơn hàng
public boolean insertOrderDiscount(OrderDiscount orderDiscount) {
    String sql = "INSERT INTO OrderDiscounts (order_id, discount_id, applied_discount_percentage, applied_amount, applied_date) VALUES (?, ?, ?, ?, ?)";
    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        stmt.setInt(1, orderDiscount.getOrderId());
        stmt.setInt(2, orderDiscount.getDiscountId());
        stmt.setDouble(3, orderDiscount.getAppliedDiscountPercentage());  // Sử dụng BigDecimal
        stmt.setBigDecimal(4, orderDiscount.getAppliedAmount());  // Sử dụng BigDecimal
        stmt.setTimestamp(5, Timestamp.valueOf(orderDiscount.getAppliedDate())); // Chuyển đổi từ LocalDateTime

        return stmt.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}


// 4️⃣ Cập nhật tổng tiền đơn hàng sau khi áp dụng mã giảm giá
    public void updateTotalAfterDiscount(int orderId) {
        String sql = """
UPDATE Orders 
        SET total_amount = (
            SELECT total_before * (1 - total_discount / 100)
            FROM (
                SELECT SUM(od.unit_price * od.quantity) AS total_before, 
                       COALESCE(MAX(d.discount_percentage), 0) AS total_discount
                FROM OrderDetails od
                LEFT JOIN OrderDiscounts odc ON od.order_id = odc.order_id
                LEFT JOIN Discounts d ON odc.discount_id = d.discount_id
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

    // 5️⃣ Xóa mã giảm giá khỏi đơn hàng
    public boolean removeDiscount(int orderId, int discountId) {
        String sql = "DELETE FROM OrderDiscounts WHERE order_id = ? AND discount_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            stmt.setInt(2, discountId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 6️⃣ Lấy thông tin giảm giá theo mã
    public Discounts getDiscountByCode(String discountCode) {
        String sql = "SELECT * FROM Discounts WHERE discount_code = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, discountCode);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Discounts discount = new Discounts();
                    discount.setDiscount_id(rs.getInt("discount_id"));
                    discount.setDiscount_code(rs.getString("discount_code"));
                    discount.setDiscount_percentage(rs.getDouble("discount_percentage"));
                    return discount;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

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
