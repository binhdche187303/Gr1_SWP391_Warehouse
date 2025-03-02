
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
//        // Tạo đối tượng DAO
//        OrderDAO orderDAO = new OrderDAO();
//
//        // Order ID cần test
//        int orderId = 5;  // Thay đổi ID tùy theo dữ liệu trong database
//
//        // Lấy chi tiết đơn hàng
//        OrderDetailDTO orderDetailDTO = orderDAO.getOrderDetails(orderId);
//
//        // Kiểm tra kết quả
//        if (orderDetailDTO.getOrder() == null) {
//            System.out.println("❌ Không tìm thấy đơn hàng với ID: " + orderId);
//            return;
//        }
//
//        // In thông tin đơn hàng
//        System.out.println("\n📌 Thông tin đơn hàng:");
//        System.out.println("🔹 Order ID: " + orderDetailDTO.getOrder().getOrderId());
//        System.out.println("🔹 Ngày đặt hàng: " + orderDetailDTO.getOrder().getOrderDate());
//        System.out.println("🔹 Trạng thái: " + orderDetailDTO.getOrder().getStatus());
//        System.out.println("🔹 Tổng tiền: " + orderDetailDTO.getOrder().getTotalAmount());
//
//        // In thông tin khách hàng
//        System.out.println("\n📌 Thông tin khách hàng:");
//        System.out.println("🔹 Họ tên: " + orderDetailDTO.getUser().getFullname());
//        System.out.println("🔹 Số điện thoại: " + orderDetailDTO.getUser().getPhone());
//        System.out.println("🔹 Email: " + orderDetailDTO.getUser().getEmail());
//
//        // In thông tin thanh toán
//        System.out.println("\n📌 Thông tin thanh toán:");
//        System.out.println("🔹 Phương thức thanh toán: " + orderDetailDTO.getPayment().getPaymentMethod());
//        System.out.println("🔹 Trạng thái thanh toán: " + orderDetailDTO.getPayment().getPaymentStatus());
//        System.out.println("🔹 Ngày thanh toán: " + orderDetailDTO.getPayment().getPaymentDate());
//
//        // In danh sách sản phẩm
//        System.out.println("\n📌 Danh sách sản phẩm:");
//        for (int i = 0; i < orderDetailDTO.getOrderDetails().size(); i++) {
//            OrderDetail orderDetail = orderDetailDTO.getOrderDetails().get(i);
//            Products product = orderDetailDTO.getProducts().get(i);
//            ProductVariants variant = orderDetailDTO.getProductVariants().get(i);
//            Sizes size = orderDetailDTO.getSizes().get(i);
//
//            System.out.println("🔹 Product ID: " + product.getProductId());
//            System.out.println("   - Tên sản phẩm: " + product.getProductName());
//            System.out.println("   - SKU: " + variant.getSku());
//            System.out.println("   - Giá biến thể: " + variant.getPrice());
//            System.out.println("   - Kích thước: " + size.getSize_name());
//            System.out.println("   - Số lượng: " + orderDetail.getQuantity());
//            System.out.println("   - Giá đơn vị: " + orderDetail.getUnitPrice());
//            System.out.println("   💰 Tổng giá: "
//                    + new BigDecimal(orderDetail.getQuantity()).multiply(orderDetail.getUnitPrice()));
//            System.out.println("-------------------------------------------------");
//
//        }
//
//    }
//        // Khởi tạo đối tượng DAO (giả sử bạn đã có lớp DAO kết nối cơ sở dữ liệu)
//        OrderDAO orderDAO = new OrderDAO();
//
//        // Test phương thức getOrdersByCustomerId() với customerId giả định (ví dụ: 1)
//        int customerId = 6;
//
//        // Lấy danh sách OrderDetailDTO cho customerId = 1
//        List<OrderDetailDTO> orders = orderDAO.getOrdersByCustomerId(customerId);
//
//
//        // In thông tin các đơn hàng trả về
//        for (OrderDetailDTO orderDetailDTO : orders) {
//            System.out.println("Order ID: " + orderDetailDTO.getOrder().getOrderId());
//            System.out.println("Order Date: " + orderDetailDTO.getOrder().getOrderDate());
//            System.out.println("Order Status: " + orderDetailDTO.getOrder().getStatus());
//            System.out.println("Total Amount: " + orderDetailDTO.getOrder().getTotalAmount());
//            System.out.println("Customer Name: " + orderDetailDTO.getUser().getFullname());
//            System.out.println("Payment Method: " + orderDetailDTO.getPayment().getPaymentMethod());
//            System.out.println("Total Before Discount: " + orderDetailDTO.getTotalBeforeDiscount());
//            System.out.println("Total After Discount: " + orderDetailDTO.getTotalAfterDiscount());
//
//            // In thông tin chi tiết sản phẩm
//            for (OrderDetail orderDetail : orderDetailDTO.getOrderDetails()) {
//                System.out.println("Product ID: " + orderDetail.getProductId());
//                System.out.println("Quantity: " + orderDetail.getQuantity());
//                System.out.println("Unit Price: " + orderDetail.getUnitPrice());
//            }
//
//            // In thông tin sản phẩm, biến thể và kích thước
//            for (Products product : orderDetailDTO.getProducts()) {
//                System.out.println("Product Name: " + product.getProductName());
//            }
//            for (ProductVariants productVariant : orderDetailDTO.getProductVariants()) {
//                System.out.println("SKU: " + productVariant.getSku());
//                System.out.println("Variant Price: " + productVariant.getPrice());
//            }
//            for (Sizes size : orderDetailDTO.getSizes()) {
//                System.out.println("Size: " + size.getSize_name());
//            }
//
//            System.out.println("------------------------------------------------------");
//        }
//            
//            }
        // Khởi tạo đối tượng DAO (giả sử có lớp OrderDAO)
        OrderDAO orderDAO = new OrderDAO();

        // ID đơn hàng cần test
        int testOrderId = 4; // Thay bằng ID thực tế trong database

        // Gọi hàm lấy chi tiết đơn hàng
        OrderDetailDTO orderDetail = orderDAO.getOrderDetailById(testOrderId);

        // Kiểm tra kết quả
        if (orderDetail != null) {
            System.out.println("===== ORDER DETAIL =====");
            System.out.println("Order ID: " + orderDetail.getOrder().getOrderId());
            System.out.println("Customer Name: " + orderDetail.getOrder().getCustomerName());
            System.out.println("Total Amount: " + orderDetail.getTotalAfterDiscount() + " VND");
            System.out.println("Order Date: " + orderDetail.getOrder().getOrderDate());
            System.out.println("Status: " + orderDetail.getOrder().getStatus());
            System.out.println("Shipping Address: " + orderDetail.getOrder().getShippingAddress());
            System.out.println("Phone: " + orderDetail.getOrder().getPhoneNumber());
            System.out.println("Email: " + orderDetail.getOrder().getEmail());

            // Hiển thị thông tin thanh toán
            System.out.println("===== PAYMENT INFO =====");
            System.out.println("Payment Method: " + orderDetail.getPayment().getPaymentMethod());
            System.out.println("Payment Status: " + orderDetail.getPayment().getPaymentStatus());
            System.out.println("Payment Date: " + orderDetail.getPayment().getPaymentDate());

            // Hiển thị danh sách sản phẩm
            System.out.println("===== ORDER ITEMS =====");
            for (int i = 0; i < orderDetail.getOrderDetails().size(); i++) {
                OrderDetail item = orderDetail.getOrderDetails().get(i);
                Products product = orderDetail.getProducts().get(i);
                ProductVariants variant = orderDetail.getProductVariants().get(i);
                Sizes size = orderDetail.getSizes().get(i);

                System.out.println("- Product: " + product.getProductName());
                System.out.println("  SKU: " + variant.getSku());
                System.out.println("  Size: " + size.getSize_name());
                System.out.println("  Quantity: " + item.getQuantity());
                System.out.println("  Unit Price: " + item.getUnitPrice() + " VND");
                System.out.println("  Total: " + item.getUnitPrice().multiply(BigDecimal.valueOf(item.getQuantity())) + " VND");
            }

            // Tổng tiền trước giảm giá
            System.out.println("===== SUMMARY =====");
            System.out.println("Total Before Discount: " + orderDetail.getTotalBeforeDiscount() + " VND");
            System.out.println("Total After Discount: " + orderDetail.getTotalAfterDiscount() + " VND");
        } else {
            System.out.println("No order found with ID: " + testOrderId);
        }
    }
}
