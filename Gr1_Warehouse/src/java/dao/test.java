/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import model.ProductVariants;

/**
 *
 * @author Huy Nam
 */
public class test {

    public static void main(String[] args) {
        // Nhập warehouseId cần kiểm tra
        int warehouseId = 1; // Giả sử test với kho có ID = 1
        InventoryDAO dao = new InventoryDAO();
        // Gọi hàm lấy danh sách sản phẩm trong kho
        List<ProductVariants> productList = dao.getProductsByWarehouseId(warehouseId);

        // Kiểm tra kết quả
        if (productList.isEmpty()) {
            System.out.println("Không có sản phẩm nào trong kho ID " + warehouseId);
        } else {
            System.out.println("Danh sách sản phẩm trong kho ID " + warehouseId + ":");
            System.out.println("Có tất cả " + productList.size() + " sản phẩm");
            for (ProductVariants product : productList) {
                System.out.println("Variant ID: " + product.getVariantId()
                        + ", Tên sản phẩm: " + product.getProduct().getProductName()
                        + ", Size: " + product.getSize().getSize_name()
                        + ", SKU: " + product.getSku()
                        + ", Số lượng tồn kho: " + product.getStock());
            }
        }
    }
}
