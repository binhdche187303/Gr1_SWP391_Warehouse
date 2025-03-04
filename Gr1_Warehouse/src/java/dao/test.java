/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import model.InventoryBatches;
import model.InventoryCheck;
import model.InventoryCheckDTO;
import model.ProductVariants;
import model.User;
import model.Warehouse;

/**
 *
 * @author Huy Nam
 */
public class test {

    public static void main(String[] args) {
        // Nhập warehouseId cần kiểm tra
        
        InventoryDAO dao = new InventoryDAO(); 
    int checkId = 1; // Thay đổi checkId phù hợp với dữ liệu trong DB
            InventoryCheck inventoryCheck = dao.getInventoryCheckDetails(checkId);

            // Kiểm tra kết quả
            if (inventoryCheck != null) {
                System.out.println("===== Inventory Check Details =====");
                System.out.println("Check ID: " + inventoryCheck.getCheckId());
                System.out.println("Status: " + inventoryCheck.getStatus());
                System.out.println("Check Date: " + inventoryCheck.getCheckDate());
                System.out.println("Completed At: " + inventoryCheck.getCompletedAt());

                // Thông tin kho
                Warehouse warehouse = inventoryCheck.getWarehouse();
                System.out.println("Warehouse: " + warehouse.getWarehouseName());
                System.out.println("Address: " + warehouse.getAddress());
                System.out.println("Phone: " + warehouse.getPhone());

                // Người tạo phiếu
                User createdBy = inventoryCheck.getCreatedBy();
                System.out.println("Created By: " + createdBy.getFullname()+ " (" + createdBy.getPhone() + createdBy.getEmail() + ")");

                // Người giám sát (có thể null)
                User reviewedBy = inventoryCheck.getReviewedBy();
                if (reviewedBy != null) {
                    System.out.println("Reviewed By: " + reviewedBy.getFullname()+ " (" + reviewedBy.getPhone() + reviewedBy.getEmail() + ")");
                } else {
                    System.out.println("Reviewed By: None");
                }
            } else {
                System.out.println("❌ Không tìm thấy Inventory Check với ID: " + checkId);
            
    }
}}
