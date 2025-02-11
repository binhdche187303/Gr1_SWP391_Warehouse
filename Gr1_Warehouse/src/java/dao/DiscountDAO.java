/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.security.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.Discounts;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import model.DiscountHistory;

/**
 *
 * @author admin
 */
public class DiscountDAO extends DBContext {

    public List<Discounts> getAllDiscounts() {

        List<Discounts> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Discounts\n"
                + "ORDER BY discount_id DESC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Discounts discount = new Discounts();
                discount.setDiscount_id(rs.getInt("discount_id"));
                discount.setDiscount_code(rs.getString("discount_code"));
                discount.setDiscount_percentage(rs.getDouble("discount_percentage"));
                Integer min_quantity = rs.getObject("min_quantity", Integer.class);
                discount.setMin_quantity(min_quantity);

                Integer min_order_value = rs.getObject("min_order_value", Integer.class);
                discount.setMin_order_value(min_order_value);

                discount.setStart_date(rs.getTimestamp("start_date").toLocalDateTime());
                discount.setEnd_date(rs.getTimestamp("end_date") != null ? rs.getTimestamp("end_date").toLocalDateTime() : null);
                Integer maxUses = rs.getObject("max_uses", Integer.class);
                discount.setMax_uses(maxUses);
                discount.setCreated_at(rs.getTimestamp("created_at").toLocalDateTime());
                discount.setStatus(rs.getString("status"));
                list.add(discount);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public Discounts getDiscountById(int discount_id) {
        String sql = "SELECT * FROM dbo.Discounts WHERE discount_id=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, discount_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Discounts discount = new Discounts();
                discount.setDiscount_id(rs.getInt("discount_id"));
                discount.setDiscount_code(rs.getString("discount_code"));
                discount.setDiscount_percentage(rs.getDouble("discount_percentage"));
                Integer min_quantity = rs.getObject("min_quantity", Integer.class);
                discount.setMin_quantity(min_quantity);

                Integer min_order_value = rs.getObject("min_order_value", Integer.class);
                discount.setMin_order_value(min_order_value);

                discount.setStart_date(rs.getTimestamp("start_date").toLocalDateTime());
                discount.setEnd_date(rs.getTimestamp("end_date") != null ? rs.getTimestamp("end_date").toLocalDateTime() : null);
                Integer maxUses = rs.getObject("max_uses", Integer.class);
                discount.setMax_uses(maxUses);
                discount.setCreated_at(rs.getTimestamp("created_at").toLocalDateTime());
                discount.setStatus(rs.getString("status"));
                return discount;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateDiscount(int discountId, double newPercentage, String newStatus, Integer newMaxUses, int userId) throws SQLException {
        String updateDiscountSql = "UPDATE dbo.Discounts SET "
                + "discount_percentage = ?, "
                + "status = ?, "
                + "max_uses = ? "
                + "WHERE discount_id = ?";

        connection.setAutoCommit(false);
        try {
            // Get current discount information
            String getCurrentSql = "SELECT discount_percentage, max_uses FROM dbo.Discounts WHERE discount_id = ?";
            PreparedStatement getCurrentSt = connection.prepareStatement(getCurrentSql);
            getCurrentSt.setInt(1, discountId);
            ResultSet rs = getCurrentSt.executeQuery();

            double oldPercentage = 0;
            Integer currentMaxUses = null;

            if (rs.next()) {
                oldPercentage = rs.getDouble("discount_percentage");
                Object maxUsesObj = rs.getObject("max_uses");
                if (maxUsesObj != null) {
                    currentMaxUses = (Integer) maxUsesObj;
                }
            } else {
                // Discount not found
                return false;
            }

            // Validate max_uses
            Integer finalMaxUses;
            if (currentMaxUses == null) {
                finalMaxUses = newMaxUses;
            } else if (newMaxUses == null) {
                finalMaxUses = currentMaxUses;
            } else if (newMaxUses > currentMaxUses) {
                finalMaxUses = newMaxUses;
            } else {
                finalMaxUses = currentMaxUses;
            }

            // Update discount record
            PreparedStatement updateSt = connection.prepareStatement(updateDiscountSql);
            updateSt.setDouble(1, newPercentage);
            updateSt.setString(2, newStatus);
            if (finalMaxUses != null) {
                updateSt.setInt(3, finalMaxUses);
            } else {
                updateSt.setNull(3, java.sql.Types.INTEGER);
            }
            updateSt.setInt(4, discountId);

            int rowsAffected = updateSt.executeUpdate();

            connection.commit();
            return rowsAffected > 0;

        } catch (SQLException e) {
            connection.rollback();
            throw e;
        } finally {
            connection.setAutoCommit(true);
        }
    }

    public Discounts createDiscount(
            String discountCode,
            double discountPercentage,
            Integer minQuantity,
            Integer minOrderValue,
            LocalDateTime startDate,
            LocalDateTime endDate,
            Integer maxUses,
            LocalDateTime createdAt,
            String status,
            int userId
    ) throws SQLException {
        String insertDiscountSql = "INSERT INTO dbo.Discounts "
                + "(discount_code, discount_percentage, min_quantity, min_order_value, start_date, end_date, max_uses, created_at, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        connection.setAutoCommit(false);
        try {
            // Kiểm tra mã giảm giá có tồn tại không
            if (isDiscountCodeExists(discountCode)) {
                return null;
            }

            try (PreparedStatement ps = connection.prepareStatement(insertDiscountSql, PreparedStatement.RETURN_GENERATED_KEYS)) {
                ps.setString(1, discountCode);
                ps.setDouble(2, discountPercentage);

                if (minQuantity != null) {
                    ps.setInt(3, minQuantity);
                } else {
                    ps.setNull(3, java.sql.Types.INTEGER);
                }

                if (minOrderValue != null) {
                    ps.setInt(4, minOrderValue);
                } else {
                    ps.setNull(4, java.sql.Types.INTEGER);
                }

                ps.setObject(5, startDate);

                if (endDate != null) {
                    ps.setObject(6, endDate);
                } else {
                    ps.setNull(6, java.sql.Types.TIMESTAMP);
                }

                if (maxUses != null) {
                    ps.setInt(7, maxUses);
                } else {
                    ps.setNull(7, java.sql.Types.INTEGER);
                }

                ps.setObject(8, createdAt);
                ps.setString(9, status);

                int affectedRows = ps.executeUpdate();

                // Lấy discount_id vừa tạo
                try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int discountId = generatedKeys.getInt(1);

                        Discounts discount = new Discounts(
                                discountId, discountCode, discountPercentage, minQuantity, minOrderValue,
                                startDate, endDate, maxUses, createdAt, status
                        );

                        connection.commit();
                        return discount;
                    }
                }
            }

            connection.rollback();
            return null;

        } catch (SQLException e) {
            connection.rollback();
            throw e;
        } finally {
            connection.setAutoCommit(true);
        }
    }

    public boolean isDiscountCodeExists(String discountCode) throws SQLException {
        String checkCodeSql = "SELECT COUNT(*) FROM dbo.Discounts WHERE discount_code = ?";
        try (PreparedStatement ps = connection.prepareStatement(checkCodeSql)) {
            ps.setString(1, discountCode);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    public List<DiscountHistory> getDiscountHistoryByDiscountId(int discount_id) {
        List<DiscountHistory> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.DiscountHistory dh\n"
                + "LEFT JOIN dbo.Users u ON u.user_id = dh.changed_by\n"
                + "JOIN dbo.Roles r ON r.role_id = u.role_id\n"
                + "WHERE dh.discount_id = ?\n"
                + "ORDER BY dh.discount_history_id DESC";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, discount_id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                DiscountHistory history = new DiscountHistory();
                history.setDiscount_history_id(rs.getInt("discount_history_id"));
                history.setDiscount_id(rs.getInt("discount_id"));
                history.setOld_discount_percentage(rs.getObject("old_discount_percentage", Double.class));
                history.setNew_discount_percentage(rs.getDouble("new_discount_percentage"));
                history.setOld_status(rs.getString("old_status"));
                history.setNew_status(rs.getString("new_status"));
                history.setOld_max_uses(rs.getObject("old_max_uses", Integer.class));
                history.setNew_max_uses(rs.getObject("new_max_uses", Integer.class));
                history.setChange_date(rs.getTimestamp("change_date").toLocalDateTime());
                history.setChanged_by(rs.getString("role_name"));

                list.add(history);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static void main(String[] args) throws SQLException {
        DiscountDAO dd = new DiscountDAO();
        List<DiscountHistory> list = dd.getDiscountHistoryByDiscountId(10);
        for (DiscountHistory discountHistory : list) {
            System.out.println(discountHistory);
        }
//
//    List<Discounts> l= dd.getAllDiscounts();
//        for (Discounts discounts : l) {
//            System.out.println(discounts);
//        }

//        Discounts d = dd.getDiscountById(1);
//        System.out.println(d);

    
    }
}
