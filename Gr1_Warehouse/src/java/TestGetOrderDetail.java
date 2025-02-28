
import dao.OrderDAO;
import dao.PurchaseOrderDAO;
import dao.WarehouseDAO;
import java.math.BigDecimal;
import java.util.List;
import model.Order;
import model.OrderDetail;
import model.OrderDetailDTO;
import model.Payment;
import model.ProductVariants;
import model.Products;
import model.PurchaseOrderDetailDTO;
import model.PurchaseDetails;
import model.Sizes;
import model.User;
import model.Warehouse;

public class TestGetOrderDetail {

    public static void main(String[] args) {
        //        // Tạo DAO
        //        PurchaseOrderDAO dao = new PurchaseOrderDAO();
        //
        //        // Nhập một orderId hợp lệ từ database (ví dụ orderId = 23)
        //        int orderId = 23; // Thay bằng ID thực tế
        //
        //        // Gọi hàm getOrderDetail để lấy dữ liệu chi tiết đơn hàng
        //        PurchaseOrderDetailDTO orderDetail = dao.getOrderDetail(orderId);
        //
        //        // Kiểm tra nếu orderDetail không phải là null
        //        if (orderDetail != null) {
        //            // In thông tin đơn hàng
        //            System.out.println("Mã đơn hàng: " + orderDetail.getOrder().getReferenceCode());
        //            System.out.println("Ngày đặt: " + orderDetail.getOrder().getOrderDate());
        //            System.out.println("Trạng thái: " + orderDetail.getOrder().getStatus());
        //            System.out.println("------------------------------------------------");
        //
        //            System.out.println("Nhà cung cấp: " + orderDetail.getSupplier().getSupplierName());
        //            System.out.println("Địa chỉ nhà cung cấp: " + orderDetail.getSupplier().getAddress());
        //            System.out.println("Email nhà cung cấp: " + orderDetail.getSupplier().getEmail());
        //            System.out.println("SĐT nhà cung cấp: " + orderDetail.getSupplier().getPhone());
        //            System.out.println("------------------------------------------------");
        //
        //            System.out.println("Kho: " + orderDetail.getWarehouse().getWarehouseName());
        //            System.out.println("Địa chỉ kho: " + orderDetail.getWarehouse().getAddress());
        //            System.out.println("SĐT kho: " + orderDetail.getWarehouse().getPhone());
        //            System.out.println("------------------------------------------------");
        //
        //            System.out.println("Người xử lý: " + orderDetail.getProcessedBy().getFullname());
        //            System.out.println("Ghi chú: " + orderDetail.getOrder().getNotes());
        //            System.out.println("URL hóa đơn: " + orderDetail.getOrder().getBillImgUrl());
        //            System.out.println("Tổng số tiền: " + orderDetail.getOrder().getTotalAmount());
        //            System.out.println("------------------------------------------------");
        //
        //            // In thông tin chi tiết sản phẩm
        //            // Lặp qua danh sách chi tiết đơn hàng
        //            for (int i = 0; i < orderDetail.getPurchaseDetails().size(); i++) {
        //                PurchaseDetails detail = orderDetail.getPurchaseDetails().get(i);
        //                System.out.println("  Sản phẩm " + (i + 1) + ": ");
        //                System.out.println("    Tên sản phẩm: " + orderDetail.getProductNames().get(i));
        //                System.out.println("    Mã sản phẩm (SKU): " + detail.getSku());
        //                System.out.println("    Số lượng: " + detail.getQuantity());
        //                System.out.println("    Giá đơn vị: " + detail.getUnitPrice());
        //                System.out.println("    Tổng giá: " + detail.getTotalPrice());
        //                System.out.println("    Hạn sử dụng: " + detail.getExpirationDate());
        //                System.out.println("    Kích cỡ: " + orderDetail.getSizeName().get(i)); // In tên kích cỡ
        //            }
        //        } else {
        //            System.out.println("Không tìm thấy thông tin đơn hàng.");
        //        }
        //    }
        //        WarehouseDAO warehouseDAO = new WarehouseDAO();
        //
        //        // Gọi phương thức getActiveWarehouses() để lấy danh sách kho Active
        //        List<Warehouse> activeWarehouses = warehouseDAO.getActiveWarehouses();
        //
        //        // In kết quả để kiểm tra
        //        System.out.println("Danh sách kho Active:");
        //        for (Warehouse w : activeWarehouses) {
        //            System.out.println("ID: " + w.getWarehouseId()
        //                    + ", Name: " + w.getWarehouseName()
        //                    + ", Phone: " + w.getPhone()
        //                    + ", Address: " + w.getAddress()
        //                    + ", Status: " + w.getStatus());
        //        }
        //    }

        //        OrderDAO orderDAO = new OrderDAO();
        //        
        //        // Gọi phương thức getAllOrders()
        //        List<Order> orders = orderDAO.getAllOrders();
        //
        //        // Kiểm tra kết quả
        //        if (orders.isEmpty()) {
        //            System.out.println("Không có đơn hàng nào.");
        //        } else {
        //            System.out.println("Danh sách đơn hàng:");
        //            for (Order order : orders) {
        //                System.out.println("Order ID: " + order.getOrderId());
        //                System.out.println("User ID: " + order.getUserId());
        //                System.out.println("Order Date: " + order.getOrderDate());
        //                System.out.println("Total Amount: " + order.getTotalAmount());
        //                System.out.println("Status: " + order.getStatus());
        //                System.out.println("Customer Name: " + order.getCustomerName());
        //                System.out.println("Phone: " + order.getPhoneNumber());
        //                System.out.println("Email: " + order.getEmail());
        //                System.out.println("Shipping Address: " + order.getShippingAddress());
        //                System.out.println("Notes: " + order.getNotes());
        //                System.out.println("---------------------------");
        //            }
        //        }
        //    }
        // Tạo đối tượng DAO
        OrderDAO orderDAO = new OrderDAO();

        // Order ID cần test
        int orderId = 3;  // Thay đổi ID tùy theo dữ liệu trong database

        // Lấy chi tiết đơn hàng
        OrderDetailDTO orderDetailDTO = orderDAO.getOrderDetails(orderId);

        // Kiểm tra kết quả
        if (orderDetailDTO.getOrder() == null) {
            System.out.println("❌ Không tìm thấy đơn hàng với ID: " + orderId);
            return;
        }

        // In thông tin đơn hàng
        System.out.println("\n📌 Thông tin đơn hàng:");
        System.out.println("🔹 Order ID: " + orderDetailDTO.getOrder().getOrderId());
        System.out.println("🔹 Ngày đặt hàng: " + orderDetailDTO.getOrder().getOrderDate());
        System.out.println("🔹 Trạng thái: " + orderDetailDTO.getOrder().getStatus());
        System.out.println("🔹 Tổng tiền: " + orderDetailDTO.getOrder().getTotalAmount());

        // In thông tin khách hàng
        System.out.println("\n📌 Thông tin khách hàng:");
        System.out.println("🔹 Họ tên: " + orderDetailDTO.getUser().getFullname());
        System.out.println("🔹 Số điện thoại: " + orderDetailDTO.getUser().getPhone());
        System.out.println("🔹 Email: " + orderDetailDTO.getUser().getEmail());

        // In thông tin thanh toán
        System.out.println("\n📌 Thông tin thanh toán:");
        System.out.println("🔹 Phương thức thanh toán: " + orderDetailDTO.getPayment().getPaymentMethod());
        System.out.println("🔹 Trạng thái thanh toán: " + orderDetailDTO.getPayment().getPaymentStatus());
        System.out.println("🔹 Ngày thanh toán: " + orderDetailDTO.getPayment().getPaymentDate());

        // In danh sách sản phẩm
        System.out.println("\n📌 Danh sách sản phẩm:");
        for (int i = 0; i < orderDetailDTO.getOrderDetails().size(); i++) {
            OrderDetail orderDetail = orderDetailDTO.getOrderDetails().get(i);
            Products product = orderDetailDTO.getProducts().get(i);
            ProductVariants variant = orderDetailDTO.getProductVariants().get(i);
            Sizes size = orderDetailDTO.getSizes().get(i);

            System.out.println("🔹 Product ID: " + product.getProductId());
            System.out.println("   - Tên sản phẩm: " + product.getProductName());
            System.out.println("   - SKU: " + variant.getSku());
            System.out.println("   - Giá biến thể: " + variant.getPrice());
            System.out.println("   - Kích thước: " + size.getSize_name());
            System.out.println("   - Số lượng: " + orderDetail.getQuantity());
            System.out.println("   - Giá đơn vị: " + orderDetail.getUnitPrice());
            System.out.println("   💰 Tổng giá: "
                    + new BigDecimal(orderDetail.getQuantity()).multiply(orderDetail.getUnitPrice()));
            System.out.println("-------------------------------------------------");

        }

    }
}
