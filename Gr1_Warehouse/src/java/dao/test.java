/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import model.InventoryBatches;
import model.InventoryCheck;
import model.InventoryCheckDTO;
import model.InventoryCheckDetailDTO;
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
        int testCheckId = 3;
        String warehouseFilter = "Kho Hà Nội";
        String statusFilter = "Đã cân bằng";
  List<InventoryCheckDTO> list = dao.getFilteredInventoryCheck(warehouseFilter, statusFilter);

 if (list.isEmpty()) {
            System.out.println("Không có dữ liệu kiểm kê nào cho check_id = " + testCheckId);
        } else {
            for (InventoryCheckDTO dto : list) {
                System.out.println("==========================================");
                System.out.println("Bao gồm: " + list.size() + "phiếu kiểm");
                System.out.println("Check ID: " + dto.getCheckId());
                System.out.println("Trạng thái: " + dto.getStatus());
               
                System.out.println("==========================================\n");
            }
        }}
}
