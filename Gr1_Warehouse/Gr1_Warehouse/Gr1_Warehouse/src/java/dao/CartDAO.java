/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cart;

/**
 *
 * @author HP
 */
public class CartDAO extends DBContext {

    public boolean updateCartItemSize(int productId, int oldSizeId, int newSizeId) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            connection.setAutoCommit(false); // Bắt đầu transaction

            // Lấy số lượng cũ của oldSizeId và kiểm tra xem newSizeId đã tồn tại chưa
            String checkQuery = "SELECT size_id, quantity FROM Cart WHERE product_id = ? AND (size_id = ? OR size_id = ?)";
            pstmt = connection.prepareStatement(checkQuery);
            pstmt.setInt(1, productId);
            pstmt.setInt(2, oldSizeId);
            pstmt.setInt(3, newSizeId);
            rs = pstmt.executeQuery();

            int oldQuantity = 0, newQuantity = 0;
            boolean newSizeExists = false;

            while (rs.next()) {
                int sizeId = rs.getInt("size_id");
                int quantity = rs.getInt("quantity");

                if (sizeId == oldSizeId) {
                    oldQuantity = quantity;
                } else if (sizeId == newSizeId) {
                    newQuantity = quantity;
                    newSizeExists = true;
                }
            }
            rs.close();
            pstmt.close();

            if (oldQuantity == 0) {
                System.out.println("Không có số lượng để chuyển!");
                connection.rollback();
                return false;
            }

            if (newSizeExists) {
                // Nếu newSizeId đã tồn tại, cộng dồn số lượng
                String updateNewSizeQuery = "UPDATE Cart SET quantity = ? WHERE product_id = ? AND size_id = ?";
                pstmt = connection.prepareStatement(updateNewSizeQuery);
                pstmt.setInt(1, newQuantity + oldQuantity);
                pstmt.setInt(2, productId);
                pstmt.setInt(3, newSizeId);
                pstmt.executeUpdate();
                pstmt.close();

                // Xóa oldSizeId
                String deleteOldSizeQuery = "DELETE FROM Cart WHERE product_id = ? AND size_id = ?";
                pstmt = connection.prepareStatement(deleteOldSizeQuery);
                pstmt.setInt(1, productId);
                pstmt.setInt(2, oldSizeId);
                pstmt.executeUpdate();
                pstmt.close();
            } else {
                // Nếu newSizeId chưa tồn tại, chỉ cập nhật size_id
                String updateSizeQuery = "UPDATE Cart SET size_id = ? WHERE product_id = ? AND size_id = ?";
                pstmt = connection.prepareStatement(updateSizeQuery);
                pstmt.setInt(1, newSizeId);
                pstmt.setInt(2, productId);
                pstmt.setInt(3, oldSizeId);
                pstmt.executeUpdate();
                pstmt.close();
            }

            connection.commit();
            return true;

        } catch (Exception e) {
            try {
                connection.rollback();
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }

    public boolean removeCheckedOutItems(int userId, List<Cart> carts) {
        if (carts == null || carts.isEmpty()) {
            return false;
        }

        String sql = "DELETE FROM Cart WHERE user_id = ? AND product_id = ? AND size_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            for (Cart cart : carts) {
                ps.setInt(1, userId);
                ps.setInt(2, cart.getProductId());
                ps.setInt(3, cart.getSizeId());
                ps.addBatch();
            }
            int[] affectedRows = ps.executeBatch();
            return affectedRows.length > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void addToCart(int userId, int productId, int sizeId, int quantity) {
        try {
            // Kiểm tra sản phẩm đã tồn tại chưa
            String checkQuery = "SELECT quantity FROM Cart WHERE user_id = ? AND product_id = ? AND size_id = ?";
            PreparedStatement checkStmt = connection.prepareStatement(checkQuery);
            checkStmt.setInt(1, userId);
            checkStmt.setInt(2, productId);
            checkStmt.setInt(3, sizeId);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Nếu sản phẩm đã có, cập nhật số lượng
                int newQuantity = rs.getInt("quantity") + quantity;
                String updateQuery = "UPDATE Cart SET quantity = ? WHERE user_id = ? AND product_id = ? AND size_id = ?";
                PreparedStatement updateStmt = connection.prepareStatement(updateQuery);
                updateStmt.setInt(1, newQuantity);
                updateStmt.setInt(2, userId);
                updateStmt.setInt(3, productId);
                updateStmt.setInt(4, sizeId);
                updateStmt.executeUpdate();
            } else {
                // Nếu chưa có, thêm mới
                String insertQuery = "INSERT INTO Cart (user_id, product_id, size_id, quantity) VALUES (?, ?, ?, ?)";
                PreparedStatement insertStmt = connection.prepareStatement(insertQuery);
                insertStmt.setInt(1, userId);
                insertStmt.setInt(2, productId);
                insertStmt.setInt(3, sizeId);
                insertStmt.setInt(4, quantity);
                insertStmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Lấy danh sách giỏ hàng của người dùng
    public List<Cart> getCartByUserId(int userId) {
        List<Cart> cartList = new ArrayList<>();
        try {
            String query = "WITH ProductFirstImage AS ( "
                    + "    SELECT i.product_id, MIN(i.image_id) AS first_image_id "
                    + "    FROM Images i "
                    + "    GROUP BY i.product_id "
                    + ") "
                    + "SELECT c.cart_id, c.product_id, p.product_name, c.size_id, s.size_name, "
                    + "       pv.price, c.quantity, img.image_url "
                    + "FROM Cart c "
                    + "JOIN Products p ON c.product_id = p.product_id "
                    + "JOIN Sizes s ON c.size_id = s.size_id "
                    + "JOIN ProductVariants pv ON c.product_id = pv.product_id AND c.size_id = pv.size_id "
                    + "LEFT JOIN ProductFirstImage pi ON p.product_id = pi.product_id "
                    + "LEFT JOIN Images img ON pi.first_image_id = img.image_id "
                    + "WHERE c.user_id = ?";

            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                cartList.add(new Cart(
                        rs.getInt("cart_id"),
                        rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getInt("size_id"),
                        rs.getString("size_name"),
                        rs.getDouble("price"),
                        rs.getInt("quantity"),
                        rs.getString("image_url")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartList;
    }

    public boolean updateCartQuantity(int productId, int quantity, int user_id, int sizeId) {
        String updateQuery = "UPDATE Cart SET quantity = ? WHERE product_id = ? AND size_id = ? AND user_id = ?";

        try {
            PreparedStatement psUpdate = connection.prepareStatement(updateQuery);
            psUpdate.setInt(1, quantity);
            psUpdate.setInt(2, productId);
            psUpdate.setInt(3, sizeId);
            psUpdate.setInt(4, user_id);

            int rowsAffected = psUpdate.executeUpdate();
            System.out.println("Update Cart Rows Affected: " + rowsAffected); // Debug

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean removeFromCart(int cartId, int user_id) {
        String deleteQuery = "DELETE FROM Cart WHERE cart_Id = ? AND user_id = ?";

        try (PreparedStatement psDelete = connection.prepareStatement(deleteQuery)) {
            psDelete.setInt(1, cartId);
            psDelete.setInt(2, user_id);
            return psDelete.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int getCartItemCount(int userId) {
        int count = 0;
        String sql = "SELECT COUNT(cart_id) FROM Cart WHERE user_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

}
