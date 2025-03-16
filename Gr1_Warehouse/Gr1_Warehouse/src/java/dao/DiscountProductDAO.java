/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.security.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import model.DiscountProduct;
import model.DiscountProductHistory;
import model.Products;

/**
 *
 * @author admin
 */
public class DiscountProductDAO extends DBContext {

    public List<DiscountProduct> getAllDiscountsProduct() {

        List<DiscountProduct> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.ProductQuantityDiscounts\n"
                + "JOIN dbo.Products ON Products.product_id = ProductQuantityDiscounts.product_id";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DiscountProduct dp = new DiscountProduct();
                dp.setProduct_discount_id(rs.getInt("product_discount_id"));

                Products p = new Products();
                p.setProductId(rs.getInt("product_id"));
                p.setProductName(rs.getString("product_name"));

                dp.setProduct(p);

                dp.setMin_quantity(rs.getInt("min_quantity"));
                dp.setDiscount_percentage(rs.getDouble("discount_percentage"));
                dp.setCreated_at(rs.getTimestamp("created_at").toLocalDateTime());
                dp.setStatus(rs.getString("status"));
                list.add(dp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<DiscountProduct> getAllDiscountsProductById(int product_id) {

        List<DiscountProduct> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.ProductQuantityDiscounts pqd\n"
                + "JOIN dbo.Products p ON p.product_id = pqd.product_id\n"
                + "WHERE p.product_id = ?"
                + "ORDER BY pqd.product_discount_id DESC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, product_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DiscountProduct dp = new DiscountProduct();
                dp.setProduct_discount_id(rs.getInt("product_discount_id"));

                Products p = new Products();
                p.setProductId(rs.getInt("product_id"));
                p.setProductName(rs.getString("product_name"));

                dp.setProduct(p);

                dp.setMin_quantity(rs.getInt("min_quantity"));
                dp.setDiscount_percentage(rs.getDouble("discount_percentage"));
                dp.setCreated_at(rs.getTimestamp("created_at").toLocalDateTime());
                dp.setStatus(rs.getString("status"));
                list.add(dp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<DiscountProductHistory> getAllDiscountsHistoryById(int product_discount_id) {

        List<DiscountProductHistory> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.ProductQuantityDiscountHistory pqdh\n"
                + "JOIN dbo.ProductQuantityDiscounts pqd ON pqd.product_discount_id = pqdh.product_discount_id\n"
                + "WHERE pqd.product_discount_id = ? \n"
                + "ORDER BY pqdh.product_discount_history_id DESC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, product_discount_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DiscountProductHistory dph = new DiscountProductHistory();
                dph.setProduct_discount_history_id(rs.getInt("product_discount_history_id"));
                dph.setProduct_discount_id(rs.getInt("product_discount_id"));
                dph.setOld_min_quantity(rs.getObject("old_min_quantity", Integer.class));
                dph.setNew_min_quantity(rs.getObject("new_min_quantity", Integer.class));
                dph.setOld_discount_percentage(rs.getObject("old_discount_percentage", Double.class));
                dph.setNew_discount_percentage(rs.getObject("new_discount_percentage", Double.class));
                dph.setOld_status(rs.getString("old_status"));
                dph.setNew_status(rs.getString("new_status"));
                dph.setChange_date(rs.getTimestamp("change_date").toLocalDateTime());
                dph.setChanged_by(rs.getString("changed_by"));
                list.add(dph);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public String updateDiscountProduct(int product_discount_id, double newPercentage, Integer min_quantity, String newStatus) throws SQLException {
        // SQL để kiểm tra trùng min_quantity
        String checkDuplicateMinQuantitySql = "SELECT COUNT(*) FROM dbo.ProductQuantityDiscounts "
                + "WHERE min_quantity = ? "
                + "AND product_discount_id != ? "
                + "AND product_id = (SELECT product_id FROM dbo.ProductQuantityDiscounts WHERE product_discount_id = ?)";

        // SQL để kiểm tra trùng discount_percentage
        String checkDuplicatePercentageSql = "SELECT COUNT(*) FROM dbo.ProductQuantityDiscounts "
                + "WHERE discount_percentage = ? "
                + "AND product_discount_id != ? "
                + "AND product_id = (SELECT product_id FROM dbo.ProductQuantityDiscounts WHERE product_discount_id = ?)";

        // SQL để cập nhật discount
        String updateDiscountSql = "UPDATE dbo.ProductQuantityDiscounts "
                + "SET discount_percentage = ?, "
                + "min_quantity = ?, "
                + "status = ? "
                + "WHERE product_discount_id = ?";

        connection.setAutoCommit(false);
        try {
            // Kiểm tra trùng min_quantity
            try (PreparedStatement checkMinQuantitySt = connection.prepareStatement(checkDuplicateMinQuantitySql)) {
                checkMinQuantitySt.setInt(1, min_quantity);
                checkMinQuantitySt.setInt(2, product_discount_id);
                checkMinQuantitySt.setInt(3, product_discount_id);
                ResultSet rs = checkMinQuantitySt.executeQuery();
                if (rs.next() && rs.getInt(1) > 0) {
                    return "Số lượng tối thiểu " + min_quantity + " để giảm giá đã tồn tại cho sản phẩm này";
                }
            }

            // Kiểm tra trùng discount_percentage
            try (PreparedStatement checkPercentageSt = connection.prepareStatement(checkDuplicatePercentageSql)) {
                checkPercentageSt.setDouble(1, newPercentage);
                checkPercentageSt.setInt(2, product_discount_id);
                checkPercentageSt.setInt(3, product_discount_id);
                ResultSet rs = checkPercentageSt.executeQuery();
                if (rs.next() && rs.getInt(1) > 0) {
                    return "Phần trăm giảm giá " + newPercentage + "% đã tồn tại cho sản phẩm này";
                }
            }

            // Cập nhật discount nếu không có trùng lặp
            try (PreparedStatement updateSt = connection.prepareStatement(updateDiscountSql)) {
                updateSt.setDouble(1, newPercentage);
                updateSt.setInt(2, min_quantity);
                updateSt.setString(3, newStatus);
                updateSt.setInt(4, product_discount_id);
                int rowsAffected = updateSt.executeUpdate();
                if (rowsAffected == 0) {
                    return "Không có dòng nào được cập nhật";
                }
            }

            connection.commit();
            return "SUCCESS";
        } catch (SQLException e) {
            connection.rollback();
            return e.getMessage();
        } finally {
            connection.setAutoCommit(true);
        }
    }

    public String createDiscountProduct(
            int product_id,
            double discount_percentage,
            int min_quantity,
            LocalDateTime createdAt,
            String status
    ) throws SQLException {
        // Check for duplicate min_quantity
        String checkDuplicateQuantitySql = "SELECT COUNT(*) FROM dbo.ProductQuantityDiscounts "
                + "WHERE product_id = ? AND min_quantity = ? AND status = 'Active'";

        // Check for duplicate discount_percentage
        String checkDuplicatePercentageSql = "SELECT COUNT(*) FROM dbo.ProductQuantityDiscounts "
                + "WHERE product_id = ? AND discount_percentage = ? AND status = 'Active'";

        // Check duplicate min_quantity
        try (PreparedStatement checkQuantityStmt = connection.prepareStatement(checkDuplicateQuantitySql)) {
            checkQuantityStmt.setInt(1, product_id);
            checkQuantityStmt.setInt(2, min_quantity);

            try (ResultSet rs = checkQuantityStmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    return "Đã tồn tại mức giảm giá cho số lượng tối thiểu " + min_quantity;
                }
            }
        }

        // Check duplicate discount_percentage
        try (PreparedStatement checkPercentageStmt = connection.prepareStatement(checkDuplicatePercentageSql)) {
            checkPercentageStmt.setInt(1, product_id);
            checkPercentageStmt.setDouble(2, discount_percentage);

            try (ResultSet rs = checkPercentageStmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    return "Đã tồn tại mức giảm giá " + discount_percentage + "%";
                }
            }
        }

        // If no duplicates found, proceed with insertion
        String insertDiscountSql = "INSERT INTO dbo.ProductQuantityDiscounts "
                + "(product_id, min_quantity, discount_percentage, created_at, status) "
                + "VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement insertStmt = connection.prepareStatement(insertDiscountSql)) {
            insertStmt.setInt(1, product_id);
            insertStmt.setInt(2, min_quantity);
            insertStmt.setDouble(3, discount_percentage);
            insertStmt.setObject(4, createdAt);
            insertStmt.setString(5, status);

            int rowsAffected = insertStmt.executeUpdate();

            if (rowsAffected > 0) {
                return "Tạo mức giảm giá thành công";
            } else {
                return "Không thể tạo mức giảm giá";
            }
        }
    }

    public static void main(String[] args) throws SQLException {
        DiscountProductDAO dpd = new DiscountProductDAO();
        //        List<DiscountProduct> list = dpd.getAllDiscountsProductById(1);
        //        for (DiscountProduct discountProduct : list) {
        //            System.out.println(discountProduct);
        //        }
//        List<DiscountProductHistory> list = dpd.getAllDiscountsHistoryById(1);
//        for (DiscountProductHistory discountProductHistory : list) {
//            System.out.println(discountProductHistory);
//        }

        dpd.updateDiscountProduct(1, 50, 125, "Active");
    }
}
