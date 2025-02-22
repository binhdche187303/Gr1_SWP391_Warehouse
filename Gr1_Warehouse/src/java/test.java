
import dao.ProductDAO;
import dao.WarehouseDAO;
import java.util.List;
import model.ProductDTO;
import model.Warehouse;

public class test {

    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO(); // Kế thừa DBContext nên tự có connection
        String supplierCode = "A"; // Thay đổi để test với các nhà cung cấp khác

        List<ProductDTO> productList = productDAO.getProductsBySupplier(supplierCode);

        System.out.println("Danh sách sản phẩm của nhà cung cấp " + supplierCode + ":");
        for (ProductDTO product : productList) {
            System.out.println("Tên sản phẩm: " + product.getProductName());
            System.out.println("SKU: " + product.getSku());
            System.out.println("Tồn kho: " + product.getStock());
            System.out.println("-------------------------");
        }
    }
}
