import dao.PurchaseOrderDAO;
import model.PurchaseOrderDetailDTO;
import model.PurchaseDetails;

public class TestGetOrderDetail {

    public static void main(String[] args) {
        // Tạo DAO
        PurchaseOrderDAO dao = new PurchaseOrderDAO();

        // Nhập một orderId hợp lệ từ database (ví dụ orderId = 23)
        int orderId = 23; // Thay bằng ID thực tế

        // Gọi hàm getOrderDetail để lấy dữ liệu chi tiết đơn hàng
        PurchaseOrderDetailDTO orderDetail = dao.getOrderDetail(orderId);

        // Kiểm tra nếu orderDetail không phải là null
        if (orderDetail != null) {
            // In thông tin đơn hàng
            System.out.println("Mã đơn hàng: " + orderDetail.getOrder().getReferenceCode());
            System.out.println("Ngày đặt: " + orderDetail.getOrder().getOrderDate());
            System.out.println("Trạng thái: " + orderDetail.getOrder().getStatus());
            System.out.println("------------------------------------------------");

            System.out.println("Nhà cung cấp: " + orderDetail.getSupplier().getSupplierName());
            System.out.println("Địa chỉ nhà cung cấp: " + orderDetail.getSupplier().getAddress());
            System.out.println("Email nhà cung cấp: " + orderDetail.getSupplier().getEmail());
            System.out.println("SĐT nhà cung cấp: " + orderDetail.getSupplier().getPhone());
            System.out.println("------------------------------------------------");

            System.out.println("Kho: " + orderDetail.getWarehouse().getWarehouseName());
            System.out.println("Địa chỉ kho: " + orderDetail.getWarehouse().getAddress());
            System.out.println("SĐT kho: " + orderDetail.getWarehouse().getPhone());
            System.out.println("------------------------------------------------");

            System.out.println("Người xử lý: " + orderDetail.getProcessedBy().getFullname());
            System.out.println("Ghi chú: " + orderDetail.getOrder().getNotes());
            System.out.println("URL hóa đơn: " + orderDetail.getOrder().getBillImgUrl());
            System.out.println("Tổng số tiền: " + orderDetail.getOrder().getTotalAmount());
            System.out.println("------------------------------------------------");

            // In thông tin chi tiết sản phẩm
                System.out.println("\nChi tiết sản phẩm:");
                for (int i = 0; i < orderDetail.getPurchaseDetails().size(); i++) {
                    PurchaseDetails detail = orderDetail.getPurchaseDetails().get(i);
                    System.out.println("Sản phẩm: " + orderDetail.getProductNames().get(i));
                    System.out.println("SKU: " + detail.getSku());
                    System.out.println("Số lượng: " + detail.getQuantity());
                    System.out.println("Đơn giá: " + detail.getUnitPrice());
                    System.out.println("Hạn sử dụng: " + detail.getExpirationDate());
                    System.out.println("Thành tiền: " + detail.getTotalPrice());
                    System.out.println("-------------------------");
                }
        } else {
            System.out.println("Không tìm thấy thông tin đơn hàng.");
        }
    }
}
