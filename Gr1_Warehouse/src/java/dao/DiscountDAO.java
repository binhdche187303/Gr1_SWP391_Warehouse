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
            LocalDateTime startDate,
            LocalDateTime endDate,
            Integer maxUses,
            LocalDateTime createdAt,
            String status,
            int userId
    ) throws SQLException {
        String insertDiscountSql = "INSERT INTO dbo.Discounts "
                + "(discount_code, discount_percentage, start_date, end_date, max_uses, created_at, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        connection.setAutoCommit(false);
        try {
            // Check if discount code already exists
            if (isDiscountCodeExists(discountCode)) {
                return null;
            }

            PreparedStatement ps = connection.prepareStatement(insertDiscountSql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, discountCode);
            ps.setDouble(2, discountPercentage);
            ps.setObject(3, startDate);

            if (endDate != null) {
                ps.setObject(4, endDate);
            } else {
                ps.setNull(4, java.sql.Types.TIMESTAMP);
            }

            if (maxUses != null) {
                ps.setInt(5, maxUses);
            } else {
                ps.setNull(5, java.sql.Types.INTEGER);
            }

            ps.setObject(6, createdAt);
            ps.setString(7, status);

            int affectedRows = ps.executeUpdate();

            // Get the generated discount_id
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int discountId = generatedKeys.getInt(1);

                    // Create and return Discount object
                    Discounts discount = new Discounts();
                    discount.setDiscount_id(discountId);
                    discount.setDiscount_code(discountCode);
                    discount.setDiscount_percentage(discountPercentage);
                    discount.setStart_date(startDate);
                    discount.setEnd_date(endDate);
                    discount.setMax_uses(maxUses);
                    discount.setCreated_at(createdAt);
                    discount.setStatus(status);

                    connection.commit();
                    return discount;
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

    public static void main(String[] args) throws SQLException {
        DiscountDAO dd = new DiscountDAO();
//         Discounts d1 = dd.createDiscount("KimTuan", 10, LocalDateTime.now(), LocalDateTime.now().plusDays(30), 100, LocalDateTime.now(), "Active", 1);
//Discounts d3 = dd.createDiscount("KimTuna11", 30, LocalDateTime.now(), null, null, LocalDateTime.now(), "Inactive", 2);

        boolean updated = dd.updateDiscount(20, 15, "Active", 120, 1);
        System.out.println(updated);
    }
}
