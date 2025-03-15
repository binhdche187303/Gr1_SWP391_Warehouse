/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.OrderDetail;
import model.OrderDetailDTO;
import model.Payment;
import model.ProductDTO;
import model.ProductVariants;
import model.Products;
import model.Sizes;
import model.User;

/**
 *
 * @author HP
 */
public class OrderDAO extends DBContext {

    public boolean processCheckoutWithPayment(int userId, String customerName, String phoneNumber, String email,
            String shippingAddress, String notes, List<OrderDetail> orderDetails,
            BigDecimal totalAmount, String paymentMethod) {
        Connection conn = null;
        PreparedStatement orderStmt = null;
        PreparedStatement detailStmt = null;
        PreparedStatement paymentStmt = null;
        PreparedStatement stockStmt = null;
        int orderId = -1;

        try {
            conn = connection;
            conn.setAutoCommit(false);

            // Kiểm tra tồn kho trước khi tạo đơn hàng
            for (OrderDetail detail : orderDetails) {
                int stock = getStockByProductIdAndSize(detail.getProductId(), detail.getSizeId());
                if (stock < detail.getQuantity()) {
                    throw new SQLException("Not enough stock for product ID " + detail.getProductId() + " and size ID " + detail.getSizeId());
                }
            }

            // Tạo đơn hàng
            String orderSQL = "INSERT INTO Orders (user_id, total_amount, shipping_address,customer_name,phone_number,email,notes) VALUES (?, ?, ?, ?, ?,?,?)";
            orderStmt = conn.prepareStatement(orderSQL, Statement.RETURN_GENERATED_KEYS);
            orderStmt.setInt(1, userId);
            orderStmt.setBigDecimal(2, totalAmount);
            orderStmt.setString(3, shippingAddress);
            orderStmt.setString(4, customerName);
            orderStmt.setString(5, phoneNumber);
            orderStmt.setString(6, email);
            orderStmt.setString(7, notes);

            orderStmt.executeUpdate();

            ResultSet rs = orderStmt.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1);
            } else {
                throw new SQLException("Cannot retrieve Order ID.");
            }

            // Thêm chi tiết đơn hàng + trừ stock
            String detailSQL = "INSERT INTO OrderDetails (order_id, product_id, size_id, quantity, unit_price) VALUES (?, ?, ?, ?, ?)";
            detailStmt = conn.prepareStatement(detailSQL);

            for (OrderDetail detail : orderDetails) {
                detailStmt.setInt(1, orderId);
                detailStmt.setInt(2, detail.getProductId());
                detailStmt.setInt(3, detail.getSizeId());
                detailStmt.setInt(4, detail.getQuantity());
                detailStmt.setBigDecimal(5, detail.getUnitPrice());
                detailStmt.addBatch();

                // Trừ tồn kho từ InventoryBatches
                int remainingQuantity = detail.getQuantity();
                String stockUpdateSQL = "SELECT batch_id, quantity FROM InventoryBatches "
                        + "WHERE variant_id = (SELECT variant_id FROM ProductVariants WHERE product_id = ? AND size_id = ?) "
                        + "AND status = 'In Stock' "
                        + "ORDER BY expiration_date ASC, received_date ASC";
                stockStmt = conn.prepareStatement(stockUpdateSQL, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                stockStmt.setInt(1, detail.getProductId());
                stockStmt.setInt(2, detail.getSizeId());
                ResultSet stockRS = stockStmt.executeQuery();

                while (stockRS.next() && remainingQuantity > 0) {
                    int batchId = stockRS.getInt("batch_id");
                    int availableQuantity = stockRS.getInt("quantity");

                    int deductedQuantity = Math.min(remainingQuantity, availableQuantity);
                    remainingQuantity -= deductedQuantity;
                    int updatedQuantity = availableQuantity - deductedQuantity;

                    stockRS.updateInt("quantity", updatedQuantity);
                    stockRS.updateRow();

                    if (updatedQuantity == 0) {
                        String updateStatusSQL = "UPDATE InventoryBatches SET status = 'Sold Out' WHERE batch_id = ?";
                        try (PreparedStatement updateStatusStmt = conn.prepareStatement(updateStatusSQL)) {
                            updateStatusStmt.setInt(1, batchId);
                            updateStatusStmt.executeUpdate();
                        }
                    }
                }

                if (remainingQuantity > 0) {
                    throw new SQLException("Stock inconsistency for product ID " + detail.getProductId() + " and size ID " + detail.getSizeId());
                }
            }

            detailStmt.executeBatch();

            // Xử lý thanh toán
            String paymentSQL = "INSERT INTO Payment (order_id, payment_method) VALUES (?, ?)";
            paymentStmt = conn.prepareStatement(paymentSQL);
            paymentStmt.setInt(1, orderId);
            paymentStmt.setString(2, paymentMethod);
            paymentStmt.executeUpdate();

            conn.commit();
            return true;
        } catch (SQLException e) {
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (orderStmt != null) {
                    orderStmt.close();
                }
                if (detailStmt != null) {
                    detailStmt.close();
                }
                if (paymentStmt != null) {
                    paymentStmt.close();
                }
                if (stockStmt != null) {
                    stockStmt.close();
                }
                if (conn != null) {
                    conn.setAutoCommit(true);
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public int getStockByProductIdAndSize(int productId, int sizeId) {
        String query = "SELECT SUM(ib.quantity) AS total_stock "
                + "FROM InventoryBatches ib "
                + "JOIN ProductVariants pv ON ib.variant_id = pv.variant_id "
                + "WHERE pv.product_id = ? AND pv.size_id = ? "
                + "AND ib.status = 'In Stock'";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ps.setInt(2, sizeId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("total_stock");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Lấy ra list đơn hàng của customer cho manager
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.order_id, o.user_id, o.order_date, o.total_amount, "
                + "o.status, u.fullname, u.phone, u.email, o.shipping_address, o.notes "
                + "FROM Orders o "
                + "JOIN Users u ON o.user_id = u.user_id "
                + "ORDER BY o.order_date ASC";

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

    //Lấy status payment ra getAll đơn hàng
    public Payment getPaymentByOrderId(int orderId) {
        Payment payment = null;
        String sql = "SELECT * FROM Payment WHERE order_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                payment = new Payment();
                payment.setPaymentId(rs.getInt("payment_id"));
                payment.setOrderId(rs.getInt("order_id"));
                payment.setPaymentMethod(rs.getString("payment_method"));
                payment.setPaymentDate(rs.getTimestamp("payment_date"));
                payment.setPaymentStatus(rs.getString("payment_status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payment;
    }

    public OrderDetailDTO getOrderDetails(int orderId) {
        Order order = null;
        User user = null;
        Payment payment = null;
        List<OrderDetail> orderDetails = new ArrayList<>();
        List<Products> productList = new ArrayList<>();
        List<ProductVariants> productVariantList = new ArrayList<>();
        List<Sizes> sizeList = new ArrayList<>();

        String sql = "SELECT "
                + "o.order_id, o.order_date, o.status AS order_status, o.total_amount, "
                + "o.customer_name, o.phone_number, o.email, o.shipping_address, o.notes, "
                + "u.fullname AS account_name, u.phone AS account_phone, u.email AS account_email, "
                + "p.payment_method, p.payment_status, p.payment_date, "
                + "od.product_id, pdt.product_name, "
                + "pv.sku, pv.price AS variant_price, "
                + "s.size_id, s.size_name, "
                + "od.quantity, od.unit_price "
                + "FROM Orders o "
                + "JOIN Users u ON o.user_id = u.user_id "
                + "LEFT JOIN Payment p ON o.order_id = p.order_id "
                + "JOIN OrderDetails od ON o.order_id = od.order_id "
                + "JOIN ProductVariants pv ON od.product_id = pv.product_id AND od.size_id = pv.size_id "
                + "JOIN Products pdt ON pv.product_id = pdt.product_id "
                + "JOIN Sizes s ON od.size_id = s.size_id "
                + "WHERE o.order_id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    if (order == null) {
                        order = new Order();
                        order.setOrderId(rs.getInt("order_id"));
                        order.setOrderDate(rs.getTimestamp("order_date"));
                        order.setStatus(rs.getString("order_status"));
                        order.setTotalAmount(rs.getBigDecimal("total_amount"));
                        order.setCustomerName(rs.getString("customer_name"));
                        order.setPhoneNumber(rs.getString("phone_number"));
                        order.setEmail(rs.getString("email"));
                        order.setShippingAddress(rs.getString("shipping_address"));
                        order.setNotes(rs.getString("notes"));

                        user = new User();
                        user.setFullname(rs.getString("account_name"));
                        user.setPhone(rs.getString("account_phone"));
                        user.setEmail(rs.getString("account_email"));

                        payment = new Payment();
                        payment.setPaymentMethod(rs.getString("payment_method"));
                        payment.setPaymentStatus(rs.getString("payment_status"));
                        payment.setPaymentDate(rs.getTimestamp("payment_date"));
                    }

                    // Lấy thông tin sản phẩm
                    int productId = rs.getInt("product_id");
                    Products product = productList.stream()
                            .filter(p -> p.getProductId() == productId)
                            .findFirst()
                            .orElse(null);
                    if (product == null) {
                        product = new Products();
                        product.setProductId(productId);
                        product.setProductName(rs.getString("product_name"));
                        productList.add(product);
                    }

                    // Lấy thông tin biến thể sản phẩm
                    String sku = rs.getString("sku");
                    ProductVariants productVariant = productVariantList.stream()
                            .filter(pv -> pv.getSku().equals(sku))
                            .findFirst()
                            .orElse(null);
                    if (productVariant == null) {
                        productVariant = new ProductVariants();
                        productVariant.setSku(sku);
                        productVariant.setPrice(rs.getBigDecimal("variant_price"));
                        productVariantList.add(productVariant);
                    }

                    // Lấy thông tin kích thước
                    int sizeId = rs.getInt("size_id");
                    Sizes size = sizeList.stream()
                            .filter(s -> s.getSize_id() == sizeId)
                            .findFirst()
                            .orElse(null);
                    if (size == null) {
                        size = new Sizes();
                        size.setSize_id(sizeId);
                        size.setSize_name(rs.getString("size_name"));
                        sizeList.add(size);
                    }

                    // Lưu thông tin chi tiết đơn hàng
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setProductId(productId);
                    orderDetail.setQuantity(rs.getInt("quantity"));
                    orderDetail.setUnitPrice(rs.getBigDecimal("unit_price"));
                    orderDetails.add(orderDetail);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return new OrderDetailDTO(order, user, payment, orderDetails, productList, productVariantList, sizeList);
    }

    public List<OrderDetailDTO> getOrdersByCustomerId(int customerId) {
        List<OrderDetailDTO> orderDetailDTOList = new ArrayList<>();

        String sql = "SELECT "
                + "o.order_id, o.order_date, o.status AS order_status, o.total_amount, "
                + "o.customer_name, o.phone_number, o.email, o.shipping_address, o.notes, "
                + "u.fullname AS account_name, u.phone AS account_phone, u.email AS account_email, "
                + "p.payment_method, p.payment_status, p.payment_date, "
                + "od.product_id, pdt.product_name, "
                + "pv.sku, pv.price AS variant_price, "
                + "s.size_id, s.size_name, "
                + "od.quantity, od.unit_price "
                + "FROM Orders o "
                + "JOIN Users u ON o.user_id = u.user_id "
                + "LEFT JOIN Payment p ON o.order_id = p.order_id "
                + "JOIN OrderDetails od ON o.order_id = od.order_id "
                + "JOIN ProductVariants pv ON od.product_id = pv.product_id AND od.size_id = pv.size_id "
                + "JOIN Products pdt ON pv.product_id = pdt.product_id "
                + "JOIN Sizes s ON od.size_id = s.size_id "
                + "WHERE o.user_id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, customerId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    User user = new User();
                    Payment payment = new Payment();
                    List<OrderDetail> orderDetails = new ArrayList<>();
                    List<Products> productList = new ArrayList<>();
                    List<ProductVariants> productVariantList = new ArrayList<>();
                    List<Sizes> sizeList = new ArrayList<>();

                    // Lấy thông tin đơn hàng
                    order.setOrderId(rs.getInt("order_id"));
                    order.setOrderDate(rs.getTimestamp("order_date"));
                    order.setStatus(rs.getString("order_status"));
                    order.setTotalAmount(rs.getBigDecimal("total_amount"));  // Giá trị đã áp mã giảm giá
                    order.setCustomerName(rs.getString("customer_name"));
                    order.setPhoneNumber(rs.getString("phone_number"));
                    order.setEmail(rs.getString("email"));
                    order.setShippingAddress(rs.getString("shipping_address"));
                    order.setNotes(rs.getString("notes"));

                    user.setFullname(rs.getString("account_name"));
                    user.setPhone(rs.getString("account_phone"));
                    user.setEmail(rs.getString("account_email"));

                    payment.setPaymentMethod(rs.getString("payment_method"));
                    payment.setPaymentStatus(rs.getString("payment_status"));
                    payment.setPaymentDate(rs.getTimestamp("payment_date"));

                    // Lấy thông tin chi tiết đơn hàng
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setProductId(rs.getInt("product_id"));
                    orderDetail.setQuantity(rs.getInt("quantity"));
                    orderDetail.setUnitPrice(rs.getBigDecimal("unit_price"));
                    orderDetails.add(orderDetail);

                    // Lấy thông tin sản phẩm, biến thể và kích thước
                    Products product = new Products();
                    product.setProductId(rs.getInt("product_id"));
                    product.setProductName(rs.getString("product_name"));
                    productList.add(product);

                    ProductVariants productVariant = new ProductVariants();
                    productVariant.setSku(rs.getString("sku"));
                    productVariant.setPrice(rs.getBigDecimal("variant_price"));
                    productVariantList.add(productVariant);

                    Sizes size = new Sizes();
                    size.setSize_id(rs.getInt("size_id"));
                    size.setSize_name(rs.getString("size_name"));
                    sizeList.add(size);

                    // Tính tổng tiền trước khi áp mã giảm giá
                    BigDecimal totalBeforeDiscount = BigDecimal.ZERO;
                    totalBeforeDiscount = totalBeforeDiscount.add(orderDetail.getUnitPrice().multiply(BigDecimal.valueOf(orderDetail.getQuantity())));

                    // Cập nhật DTO
                    OrderDetailDTO orderDetailDTO = new OrderDetailDTO();
                    orderDetailDTO.setOrder(order);
                    orderDetailDTO.setUser(user);
                    orderDetailDTO.setPayment(payment);
                    orderDetailDTO.setOrderDetails(orderDetails);
                    orderDetailDTO.setProducts(productList);
                    orderDetailDTO.setProductVariants(productVariantList);
                    orderDetailDTO.setSizes(sizeList);
                    orderDetailDTO.setTotalBeforeDiscount(totalBeforeDiscount);
                    orderDetailDTO.setTotalAfterDiscount(order.getTotalAmount());  // Đã áp mã giảm giá

                    orderDetailDTOList.add(orderDetailDTO);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderDetailDTOList;
    }

    public OrderDetailDTO getOrderDetailById(int orderId) {
        OrderDetailDTO orderDetailDTO = null;

        String sql = "SELECT "
                + "o.order_id, o.order_date, o.status AS order_status, o.total_amount, "
                + "o.customer_name, o.phone_number, o.email, o.shipping_address, o.notes, "
                + "u.fullname AS account_name, u.phone AS account_phone, u.email AS account_email, "
                + "p.payment_method, p.payment_status, p.payment_date, "
                + "od.product_id, pdt.product_name, "
                + "pv.sku, pv.price AS variant_price, "
                + "s.size_id, s.size_name, "
                + "od.quantity, od.unit_price "
                + "FROM Orders o "
                + "JOIN Users u ON o.user_id = u.user_id "
                + "LEFT JOIN Payment p ON o.order_id = p.order_id "
                + "JOIN OrderDetails od ON o.order_id = od.order_id "
                + "JOIN ProductVariants pv ON od.product_id = pv.product_id AND od.size_id = pv.size_id "
                + "JOIN Products pdt ON pv.product_id = pdt.product_id "
                + "JOIN Sizes s ON od.size_id = s.size_id "
                + "WHERE o.order_id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Order order = new Order();
                    User user = new User();
                    Payment payment = new Payment();
                    List<OrderDetail> orderDetails = new ArrayList<>();
                    List<Products> productList = new ArrayList<>();
                    List<ProductVariants> productVariantList = new ArrayList<>();
                    List<Sizes> sizeList = new ArrayList<>();

                    // Lấy thông tin đơn hàng
                    order.setOrderId(rs.getInt("order_id"));
                    order.setOrderDate(rs.getTimestamp("order_date"));
                    order.setStatus(rs.getString("order_status"));
                    order.setTotalAmount(rs.getBigDecimal("total_amount"));
                    order.setCustomerName(rs.getString("customer_name"));
                    order.setPhoneNumber(rs.getString("phone_number"));
                    order.setEmail(rs.getString("email"));
                    order.setShippingAddress(rs.getString("shipping_address"));
                    order.setNotes(rs.getString("notes"));

                    user.setFullname(rs.getString("account_name"));
                    user.setPhone(rs.getString("account_phone"));
                    user.setEmail(rs.getString("account_email"));

                    payment.setPaymentMethod(rs.getString("payment_method"));
                    payment.setPaymentStatus(rs.getString("payment_status"));
                    payment.setPaymentDate(rs.getTimestamp("payment_date"));

                    // Lấy thông tin chi tiết đơn hàng
                    do {
                        OrderDetail orderDetail = new OrderDetail();
                        orderDetail.setProductId(rs.getInt("product_id"));
                        orderDetail.setQuantity(rs.getInt("quantity"));
                        orderDetail.setUnitPrice(rs.getBigDecimal("unit_price"));
                        orderDetails.add(orderDetail);

                        // Lấy thông tin sản phẩm, biến thể và kích thước
                        Products product = new Products();
                        product.setProductId(rs.getInt("product_id"));
                        product.setProductName(rs.getString("product_name"));
                        productList.add(product);

                        ProductVariants productVariant = new ProductVariants();
                        productVariant.setSku(rs.getString("sku"));
                        productVariant.setPrice(rs.getBigDecimal("variant_price"));
                        productVariantList.add(productVariant);

                        Sizes size = new Sizes();
                        size.setSize_id(rs.getInt("size_id"));
                        size.setSize_name(rs.getString("size_name"));
                        sizeList.add(size);
                    } while (rs.next());

                    // Tính tổng tiền trước khi áp mã giảm giá
                    BigDecimal totalBeforeDiscount = orderDetails.stream()
                            .map(detail -> detail.getUnitPrice().multiply(BigDecimal.valueOf(detail.getQuantity())))
                            .reduce(BigDecimal.ZERO, BigDecimal::add);

                    // Cập nhật DTO
                    orderDetailDTO = new OrderDetailDTO();
                    orderDetailDTO.setOrder(order);
                    orderDetailDTO.setUser(user);
                    orderDetailDTO.setPayment(payment);
                    orderDetailDTO.setOrderDetails(orderDetails);
                    orderDetailDTO.setProducts(productList);
                    orderDetailDTO.setProductVariants(productVariantList);
                    orderDetailDTO.setSizes(sizeList);
                    orderDetailDTO.setTotalBeforeDiscount(totalBeforeDiscount);
                    orderDetailDTO.setTotalAfterDiscount(order.getTotalAmount());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderDetailDTO;
    }

    public boolean updatePaymentStatus(int orderId, String paymentStatus) {
        String sql = "UPDATE Payment SET payment_status = ? WHERE order_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, paymentStatus);
            stmt.setInt(2, orderId);
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
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

}
