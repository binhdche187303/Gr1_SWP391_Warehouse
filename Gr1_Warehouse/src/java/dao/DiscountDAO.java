/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import model.Discounts;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class DiscountDAO extends DBContext {

    public List<Discounts> getAllDiscounts() {

        List<Discounts> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Discounts";

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

    public boolean updateDiscountStatus(int discountId, double newPercentage, String newStatus, Integer newMaxUses, int userId) throws SQLException {
        String updateDiscountSql = "UPDATE dbo.Discounts SET "
                + "discount_percentage = ?, "
                + "status = ?, "
                + "max_uses = ? "
                + "WHERE discount_id = ?";

        String insertHistorySql = "INSERT INTO dbo.DiscountHistory "
                + "(discount_id, old_discount_percentage, new_discount_percentage, changed_by) "
                + "VALUES (?, ?, ?, ?)";

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
                // Đọc giá trị max_uses hiện tại, có thể là null
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
                // Nếu max_uses hiện tại là null, cho phép set giá trị mới
                finalMaxUses = newMaxUses;
            } else if (newMaxUses == null) {
                // Không cho phép set null nếu đã có giá trị
                finalMaxUses = currentMaxUses;
            } else if (newMaxUses > currentMaxUses) {
                // Chỉ cho phép tăng giá trị
                finalMaxUses = newMaxUses;
            } else {
                // Giữ nguyên giá trị cũ nếu giá trị mới nhỏ hơn hoặc bằng
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

            // If discount percentage has changed, record in history
            if (oldPercentage != newPercentage) {
                PreparedStatement historySt = connection.prepareStatement(insertHistorySql);
                historySt.setInt(1, discountId);
                historySt.setDouble(2, oldPercentage);
                historySt.setDouble(3, newPercentage);
                historySt.setInt(4, userId);
                historySt.executeUpdate();
            }

            connection.commit();
            return rowsAffected > 0;

        } catch (SQLException e) {
            connection.rollback();
            throw e;
        } finally {
            connection.setAutoCommit(true);
        }
    }

    public static void main(String[] args) throws SQLException {
        DiscountDAO dd = new DiscountDAO();
        try {
            // Test updating with new max_uses
            boolean success = dd.updateDiscountStatus(1, 25.0, "Active", 100, 1);
            System.out.println("Update " + (success ? "successful" : "failed"));
        } catch (SQLException e) {
            System.out.println("Error updating discount: " + e.getMessage());
        }
    }
}
