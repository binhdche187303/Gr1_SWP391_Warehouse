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
        
        InventoryDAO dao = new InventoryDAO();
            // Test: Thêm phiếu kiểm kho
            int warehouseId = 1; // ID Kho lưu trữ
            int managerId = 6;   // ID Manager (người tạo)
            int staffId = 3;     // ID Người kiểm kê

            boolean success = dao.insertInventoryCheck(warehouseId, managerId, staffId);

            // Kiểm tra kết quả
            if (success) {
                System.out.println("✔ Phiếu kiểm kho đã được tạo thành công!");
            } else {
                System.out.println("✖ Thêm phiếu kiểm kho thất bại!");
            }
        
    }
}
