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
  
            List<InventoryCheckDTO> checks = dao.getAllInventoryCheck();

            // In kết quả kiểm tra tồn kho
            for (InventoryCheckDTO check : checks) {
                System.out.println("Check ID: " + check.getCheckId());
                System.out.println("Warehouse: " + check.getWarehouseName());
                System.out.println("Status: " + check.getStatus());
                System.out.println("Completed At: " + check.getCompleteDate());
                System.out.println("Created By: " + check.getCreatedBy());
                System.out.println("Reviewed By: " + check.getReviewedBy());
                System.out.println("Total Difference Up: " + check.getTotalDifferenceUp());
                System.out.println("Total Difference Down: " + check.getTotalDifferenceDown());
                System.out.println("Total Price Difference Up: " + check.getTotalPriceDifferenceUp());
                System.out.println("Total Price Difference Down: " + check.getTotalPriceDifferenceDown());
                System.out.println("---------------------------------");
            }
            
    }
}
