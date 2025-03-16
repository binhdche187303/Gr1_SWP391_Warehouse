/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Order;
import model.Sale;
import model.User;

/**
 *
 * @author admin
 */
public class SaleDAO extends DBContext {

    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Orders\n"
                + "JOIN dbo.Users ON Users.user_id = Orders.user_id\n"
                + "WHERE Orders.status= N'pending' \n"
                + "AND Orders.order_id NOT IN\n"
                + "(SELECT order_id FROM dbo.Sale)";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setTotalAmount(rs.getBigDecimal("total_amount"));
                order.setStatus(rs.getString("status"));
                order.setCustomerName(rs.getString("fullname"));
                order.setPhoneNumber(rs.getString("phone"));
                order.setEmail(rs.getString("email"));
                order.setShippingAddress(rs.getString("shipping_address"));
                order.setNotes(rs.getString("notes"));

                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public boolean assignSaleOrder(int orderId, int staffId) {
        try {
            // Kiểm tra nếu đơn hàng đã có nhân viên vận chuyển chưa
            String checkOrderSql = "SELECT COUNT(*) FROM Sale WHERE order_id = ?";
            try (PreparedStatement checkOrderStmt = connection.prepareStatement(checkOrderSql)) {
                checkOrderStmt.setInt(1, orderId);
                try (ResultSet rs = checkOrderStmt.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        System.out.println("Đơn hàng đã có nhân viên tư vấn.");
                        return false;
                    }
                }
            }

            // Chèn vào bảng Sale
            String insertSql = "INSERT INTO Sale (order_id, staff_id) VALUES (?, ?)";

            try (PreparedStatement insertStmt = connection.prepareStatement(insertSql)) {

                connection.setAutoCommit(false);

                insertStmt.setInt(1, orderId);
                insertStmt.setInt(2, staffId);
                int insertResult = insertStmt.executeUpdate();

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

        String sql = "SELECT \n"
                + "				o.order_id,\n"
                + "				o.order_date,\n"
                + "				o.total_amount,\n"
                + "				o.status AS order_status,\n"
                + "				o.customer_name,\n"
                + "				o.phone_number,\n"
                + "				o.email,\n"
                + "				o.shipping_address,\n"
                + "				o.notes, \n"
                + "				p.payment_id, \n"
                + "				p.payment_method,               \n"
                + "				p.payment_date, \n"
                + "				p.payment_status, \n"
                + "                op.deposit_amount, \n"
                + "                op.remaining_amount, \n"
                + "                op.payment_status AS deposit_status, \n"
                + "                od.applied_discount_percentage, \n"
                + "                od.applied_amount, \n"
                + "                od.applied_date, \n"
                + "                odt.order_detail_id, \n"
                + "                pr.product_id, \n"
                + "                pr.product_name, \n"
                + "                pv.sku, \n"
                + "                s.size_name, \n"
                + "                odt.quantity,\n"
                + "                odt.unit_price,\n"
                + "                (odt.quantity * odt.unit_price) AS total_price, \n"
                + "                u.fullname AS staff_name,\n"
                + "                sa.sale_id,\n"
                + "                sa.staff_id,\n"
                + "                sa.noteSale AS noteSale\n"
                + "                FROM Orders o \n"
                + "                LEFT JOIN Payment p ON o.order_id = p.order_id \n"
                + "                LEFT JOIN OrderPayments op ON o.order_id = op.order_id \n"
                + "                LEFT JOIN OrderDiscounts od ON o.order_id = od.order_id\n"
                + "                LEFT JOIN OrderDetails odt ON o.order_id = odt.order_id \n"
                + "                LEFT JOIN Products pr ON odt.product_id = pr.product_id \n"
                + "                LEFT JOIN ProductVariants pv ON pr.product_id = pv.product_id AND odt.size_id = pv.size_id \n"
                + "                LEFT JOIN Sizes s ON odt.size_id = s.size_id \n"
                + "                LEFT JOIN Sale sa ON o.order_id = sa.order_id \n"
                + "                LEFT JOIN Users u ON sa.staff_id = u.user_id \n"
                + "                WHERE o.order_id = ?";

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

//                        // Sale 
                        orderDetail.put("sale_id", rs.getInt("sale_id"));
                        orderDetail.put("staff_id", rs.getInt("staff_id"));
                        orderDetail.put("staff_name", rs.getString("staff_name"));
                        orderDetail.put("noteSale", rs.getString("noteSale"));

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

    public List<Map<String, Object>> getMySaleOrders(int staffId) {
        List<Map<String, Object>> orders = new ArrayList<>();
        String sql = "SELECT o.order_id, o.status, p.payment_status,s.noteSale  "
                + "FROM Orders o "
                + "JOIN Payment p ON o.order_id = p.order_id "
                + "JOIN Sale s ON o.order_id = s.order_id "
                + "WHERE s.staff_id = ?"; // Lọc theo nhân viên đã nhận đơn

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, staffId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> orderData = new HashMap<>();
                    orderData.put("order_id", rs.getInt("order_id"));
                    orderData.put("status", rs.getString("status"));
                    orderData.put("payment_status", rs.getString("payment_status"));
                    orderData.put("noteSale", rs.getString("noteSale"));
                    orders.add(orderData);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    public boolean confirmSale(int orderId, String note) {
        String updateSaleSql = "UPDATE Sale SET noteSale = ? WHERE order_id = ?";

        try {
            connection.setAutoCommit(false); // Bắt đầu transaction

            try (PreparedStatement updateSaleStmt = connection.prepareStatement(updateSaleSql)) {

                // Cập nhật note Order
                updateSaleStmt.setString(1, note);
                updateSaleStmt.setInt(2, orderId);

                int shippingUpdated = updateSaleStmt.executeUpdate();

                if (shippingUpdated > 0) {
                    connection.commit(); // Xác nhận transaction nếu cả 4 bảng đều cập nhật thành công
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

    public Sale getSaleByOrderId(int orderId) {
        Sale s = new Sale();
        String sql = "SELECT * FROM dbo.Orders JOIN dbo.Sale ON Sale.order_id = Orders.order_id\n"
                + "JOIN dbo.Users ON Users.user_id = Sale.staff_id\n"
                + "WHERE Orders.order_id= ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));

                s.setOrder(order);
                s.setSale_id(rs.getInt("sale_id"));
                
                User user = new User();
                user.setFullname(rs.getString("fullname"));
                s.setUser(user);
                s.setNoteSale(rs.getString("noteSale"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return s;
    }

    public static void main(String[] args) {
        SaleDAO sd = new SaleDAO();
//        List<Order> list = sd.getAllOrders();
//        for (Order order : list) {
//            System.out.println(order);
//        }
        Sale s = sd.getSaleByOrderId(13);
        System.out.println(s);
    }
}
