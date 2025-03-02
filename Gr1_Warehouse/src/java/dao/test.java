/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import model.InventoryBatches;
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
        // Gọi phương thức lấy danh sách sản phẩm trong kho
        List<ProductVariants> products = dao.getProductsByWarehouseId(warehouseId);

        // Kiểm tra kết quả
        if (products.isEmpty()) {
            System.out.println("Không có sản phẩm nào trong kho với ID: " + warehouseId);
        } else {
            System.out.println("Danh sách sản phẩm trong kho ID: " + warehouseId);
            for (ProductVariants variant : products) {
                System.out.println("Variant ID: " + variant.getVariantId());
                System.out.println("Tên sản phẩm: " + variant.getProduct().getProductName());
                System.out.println("Kích thước: " + variant.getSize().getSize_name());
                System.out.println("SKU: " + variant.getSku());
                System.out.println("Giá bán: " + variant.getPrice());

                // Hiển thị thông tin từng lô hàng
                System.out.println("Danh sách lô hàng:");
                for (InventoryBatches batch : variant.getInventoryBatches()) {
                    System.out.println("  - Batch ID: " + batch.getBatchId());
                    System.out.println("    Số lượng tồn: " + batch.getQuantity());
                    System.out.println("    Giá nhập: " + batch.getUnitPrice());
                    System.out.println("    Ngày hết hạn: " + (batch.getExpirationDate() != null ? batch.getExpirationDate() : "Không có"));
                }
                System.out.println("-----------------------------");
            }
        }
    }
}
