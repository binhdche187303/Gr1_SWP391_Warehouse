import dao.OrderDAO;
import java.util.ArrayList;
import model.OrderDetailDTO;
import model.OrderDetail;
import model.Payment;

import java.util.List;
import model.ProductVariants;
import model.Products;
import model.Sizes;

public class TestCreateUser {

public static void main(String[] args) {
    // Chọn một orderId cụ thể để test
    int orderId = 9; // Thay thế bằng ID đơn hàng thực tế
    
    // Tạo đối tượng OrderDAO và lấy thông tin chi tiết đơn hàng
    OrderDAO orderDAO = new OrderDAO();
    OrderDetailDTO orderDetailDTO = orderDAO.getOrderDetails(orderId);
    
    // Kiểm tra đối tượng OrderDetailDTO
    if (orderDetailDTO == null) {
        System.out.println("OrderDetailDTO is null");
        return;
    }
    
    // Kiểm tra các danh sách
    List<OrderDetail> orderDetails = orderDetailDTO.getOrderDetails();
    List<Products> products = orderDetailDTO.getProducts();
    List<ProductVariants> variants = orderDetailDTO.getProductVariants();
    List<Sizes> sizes = orderDetailDTO.getSizes();
    
    // In thông tin số lượng các phần tử
    System.out.println("OrderDetails size: " + orderDetails.size());
    System.out.println("Products size: " + products.size());
    System.out.println("Variants size: " + variants.size());
    System.out.println("Sizes size: " + sizes.size());
    
    // Kiểm tra dữ liệu chi tiết
    System.out.println("\n--- Chi tiết đơn hàng ---");
    for (int i = 0; i < orderDetails.size(); i++) {
        OrderDetail detail = orderDetails.get(i);
        int productId = detail.getProductId();
        
        // Tìm sản phẩm tương ứng
        Products product = products.stream()
                .filter(p -> p.getProductId() == productId)
                .findFirst()
                .orElse(null);
        
        // Tìm variant và size tương ứng
        ProductVariants variant = (i < variants.size()) ? variants.get(i) : null;
        Sizes size = (i < sizes.size()) ? sizes.get(i) : null;
        
        System.out.println("\n--- Item " + (i + 1) + " ---");
        System.out.println("Product ID: " + productId);
        System.out.println("Product Name: " + (product != null ? product.getProductName() : "N/A"));
        System.out.println("SKU: " + (variant != null ? variant.getSku() : "N/A"));
        System.out.println("Size ID: " + (detail.getSizeId() != 0 ? detail.getSizeId() : "N/A"));
        System.out.println("Size Name: " + (size != null ? size.getSize_name() : "N/A"));
        System.out.println("Quantity: " + detail.getQuantity());
        System.out.println("Unit Price: " + detail.getUnitPrice());
    }
    
    // Kiểm tra cụ thể các trường hợp thiếu size
    System.out.println("\n--- Kiểm tra đặc biệt cho các mục không có size ---");
    for (int i = 0; i < orderDetails.size(); i++) {
        OrderDetail detail = orderDetails.get(i);
        ProductVariants variant = (i < variants.size()) ? variants.get(i) : null;
        Sizes size = (i < sizes.size()) ? sizes.get(i) : null;
        
        if (size == null || size.getSize_name() == null || size.getSize_name().isEmpty()) {
            System.out.println("Phát hiện mục không có size:");
            System.out.println("Item index: " + i);
            System.out.println("SKU: " + (variant != null ? variant.getSku() : "N/A"));
            
            // Kiểm tra xem OrderDetail có sizeId không
            System.out.println("Size ID trong OrderDetail: " + detail.getSizeId());
        }
    }
}
}
