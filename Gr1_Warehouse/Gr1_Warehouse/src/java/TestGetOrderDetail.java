
import dao.OrderDAO;
import dao.PackingDetailDAO;
import dao.PurchaseOrderDAO;
import dao.WarehouseDAO;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
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
        PackingDetailDAO packingDetailDAO = new PackingDetailDAO();
        int orderId = 36; // ID của đơn hàng cần lấy thông tin
        Map<String, Object> orderDetail = packingDetailDAO.getOrderDetailById(orderId);

        // In ra kết quả
        if (orderDetail.isEmpty()) {
            System.out.println("Không tìm thấy đơn hàng với ID: " + orderId);
        } else {
            System.out.println("===== THÔNG TIN ĐƠN HÀNG =====");
            for (Map.Entry<String, Object> entry : orderDetail.entrySet()) {
                if (entry.getValue() instanceof List) {
                    System.out.println(entry.getKey() + ":");
                    List<Map<String, Object>> productList = (List<Map<String, Object>>) entry.getValue();
                    for (Map<String, Object> product : productList) {
                        System.out.println("  - Sản phẩm:");
                        for (Map.Entry<String, Object> productEntry : product.entrySet()) {
                            System.out.println("    + " + productEntry.getKey() + ": " + productEntry.getValue());
                        }
                    }
                } else {
                    System.out.println(entry.getKey() + ": " + entry.getValue());
                }
            }
        }
    }

}
