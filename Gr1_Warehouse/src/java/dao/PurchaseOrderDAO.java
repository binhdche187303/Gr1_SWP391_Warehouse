package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import model.PurchaseOrder;

public class PurchaseOrderDAO extends DBContext {

    public boolean insertPurchaseOrder(PurchaseOrder order) {
        String sql = "INSERT INTO PurchaseOrder (order_date, supplier_id, total_amount, bill_img_url, status, notes, warehouse_id, user_id, reference_code) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setTimestamp(1, new java.sql.Timestamp(order.getOrderDate().getTime())); // Chuyển đổi từ java.util.Date thành java.sql.Timestamp
            st.setInt(2, order.getSupplierId());
            st.setDouble(3, order.getTotalAmount());
            st.setString(4, order.getBillImgUrl());
            st.setString(5, order.getStatus());
            st.setString(6, order.getNotes());
            st.setInt(7, order.getWarehouseId());
            st.setInt(8, order.getUserId());
            st.setString(9, order.getReferenceCode());

            int rowsAffected = st.executeUpdate(); // Lấy kết quả số dòng bị ảnh hưởng
            System.out.println("Số dòng bị ảnh hưởng: " + rowsAffected);
            return rowsAffected > 0; // Kiểm tra insert thành công
        } catch (Exception e) {
            System.out.println("Lỗi khi thực thi câu lệnh SQL: " + e.getMessage());
            e.printStackTrace(); // In ra thông tin lỗi chi tiết
        }
        return false;
    }


    // Lấy danh sách tất cả đơn hàng
    public List<PurchaseOrder> getAllPurchaseOrders() {
        List<PurchaseOrder> orders = new ArrayList<>();
        String sql = "SELECT * FROM PurchaseOrder";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                PurchaseOrder order = new PurchaseOrder();
                order.setOrderId(rs.getInt("order_id"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setSupplierId(rs.getInt("supplier_id"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setBillImgUrl(rs.getString("bill_img_url"));
                order.setStatus(rs.getString("status"));
                order.setNotes(rs.getString("notes"));
                order.setWarehouseId(rs.getInt("warehouse_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setReferenceCode(rs.getString("reference_code"));
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }
//
//    // Lấy đơn hàng theo ID
//    public PurchaseOrder getPurchaseOrderById(int orderId) {
//        String sql = "SELECT * FROM PurchaseOrder WHERE order_id = ?";
//        try (PreparedStatement st = connection.prepareStatement(sql)) {
//            st.setInt(1, orderId); // Đặt giá trị trước khi executeQuery
//
//            try (ResultSet rs = st.executeQuery()) { // Bọc ResultSet trong try-with-resources
//                if (rs.next()) {
//                    PurchaseOrder order = new PurchaseOrder();
//                    order.setOrderId(rs.getInt("order_id"));
//                    order.setOrderDate(rs.getTimestamp("order_date"));
//                    order.setSupplierId(rs.getInt("supplier_id"));
//                    order.setTotalAmount(rs.getDouble("total_amount"));
//                    order.setBillImgUrl(rs.getString("bill_img_url"));
//                    order.setStatus(rs.getString("status"));
//                    order.setNotes(rs.getString("notes"));
//                    order.setWarehouseId(rs.getInt("warehouse_id"));
//                    order.setUserId(rs.getInt("user_id"));
//                    order.setReferenceCode(rs.getString("reference_code"));
//                    return order;
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
//
//    // Cập nhật đơn hàng
//    public boolean updatePurchaseOrder(PurchaseOrder order) {
//        String sql = "UPDATE PurchaseOrder SET order_date=?, supplier_id=?, total_amount=?, bill_img_url=?, status=?, notes=?, warehouse_id=?, user_id=?, reference_code=? WHERE order_id=?";
//
//        try (PreparedStatement st = connection.prepareStatement(sql)) {
//            // Đặt giá trị cho các tham số
//            st.setTimestamp(1, new java.sql.Timestamp(order.getOrderDate().getTime()));
//            st.setInt(2, order.getSupplierId());
//            st.setDouble(3, order.getTotalAmount());
//            st.setString(4, order.getBillImgUrl());
//            st.setString(5, order.getStatus());
//            st.setString(6, order.getNotes());
//            st.setInt(7, order.getWarehouseId());
//            st.setInt(8, order.getUserId());
//            st.setString(9, order.getReferenceCode());
//            st.setInt(10, order.getOrderId());
//
//            // Thực thi UPDATE và kiểm tra kết quả
//            return st.executeUpdate() > 0;
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//
//    // Xóa đơn hàng theo ID
//    public boolean deletePurchaseOrder(int orderId) {
//        String sql = "DELETE FROM PurchaseOrder WHERE order_id=?";
//        try (PreparedStatement st = connection.prepareStatement(sql)) {
//
//            st.setInt(1, orderId);
//            return st.executeUpdate() > 0;
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return false;
//    }

}
