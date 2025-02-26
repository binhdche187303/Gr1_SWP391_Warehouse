
import dao.ProductDAO;
import dao.UserDAO;
import java.util.List;
import model.ProductDTO;
import model.User;
import model.Role;

public class TestCreateUser {
//    public static void main(String[] args) {
//        try {
//            // 2. Khởi tạo UserDAO
//            UserDAO userDAO = new UserDAO();
//
//            // 3. Tạo tài khoản admin
//            User newAdmin = new User();
//            newAdmin.setUsername("admin");
//            newAdmin.setFullname("Admin System ");
//            newAdmin.setEmail("admin2@example.com");
//            newAdmin.setRole(new Role(1)); // role_id = 1 (Admin)
//            newAdmin.setStatus("Active");
//            newAdmin.setAddress("123 Trụ sở chính");
//
//            
//            // 3. Admin tạo tài khoản cho Warehouse Manager
//            User manager = new User();
//            manager.setUsername("manager01");
//            manager.setFullname("Warehouse Manager 01");
//            manager.setEmail("manager01@example.com");
//            manager.setRole(new Role(3)); // role_id = 3 (Warehouse Manager)
//            manager.setStatus("Active");
//            manager.setAddress("Hà Nội");
//
//            userDAO.create(manager);
//
//            // 4. Admin tạo tài khoản cho Warehouse Staff
//            User staff = new User();
//            staff.setUsername("staff02");
//            staff.setFullname("Warehouse Staff 02");
//            staff.setEmail("staff02@example.com");
//            staff.setRole(new Role(4)); // role_id = 4 (Warehouse Staff)
//            staff.setStatus("Active");
//            staff.setAddress(null); // Không có địa chỉ
//
//            userDAO.create(staff);
//            
//            // 4. Gọi phương thức tạo admin
//            userDAO.create(newAdmin);
//            System.out.println("✅ Tạo tài khoản admin thành công!");
//
//        } catch (Exception e) {
//            System.out.println("❌ Lỗi khi tạo tài khoản admin: " + e.getMessage());
//            e.printStackTrace();
//        }
//    }
        public static void main(String[] args) {
        try {
            // 1. Khởi tạo ProductDAO
            ProductDAO productDAO = new ProductDAO();

            // 2. Gọi phương thức lấy danh sách sản phẩm của supplier_code = "A"
            String supplierCode = "A";
            List<ProductDTO> products = productDAO.getProductsBySupplier(supplierCode);

            // 3. Kiểm tra kết quả
            if (products.isEmpty()) {
                System.out.println("⚠️ Không có sản phẩm nào cho supplier_code = " + supplierCode);
            } else {
                System.out.println("✅ Danh sách sản phẩm của supplier_code = " + supplierCode + ":");
                for (ProductDTO product : products) {
                    System.out.println("- " + product.getProductName() + " (SKU: " + product.getSku() + ")");
                }
            }
        } catch (Exception e) {
            System.out.println("❌ Lỗi khi lấy danh sách sản phẩm: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
