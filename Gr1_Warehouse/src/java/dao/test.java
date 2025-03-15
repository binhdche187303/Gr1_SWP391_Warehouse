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
        
  List<InventoryCheckDetailDTO> list = dao.getInventoryCheckDetail(testCheckId);

 if (list.isEmpty()) {
            System.out.println("Không có dữ liệu kiểm kê nào cho check_id = " + testCheckId);
        } else {
            for (InventoryCheckDetailDTO dto : list) {
                System.out.println("==========================================");
                System.out.println("Check ID: " + dto.getCheckId());
                System.out.println("Trạng thái: " + dto.getStatus());
                System.out.println("Ngày hoàn thành: " + dto.getCompletedAt());
                System.out.println("Người kiểm kê: " + dto.getFullname() + " | " + dto.getUserPhone() + " | " + dto.getUserEmail());
                System.out.println("Kho: " + dto.getWarehouseName() + " | " + dto.getWarehouseAddress() + " | " + dto.getWarehousePhone());
                System.out.println("Sản phẩm: " + dto.getProductName() + " (SKU: " + dto.getSku() + " | Size: " + dto.getSizeName() + ")");
                System.out.println("Batch ID: " + dto.getBatchId() + " | Hạn sử dụng: " + dto.getExpirationDate());
                System.out.println("SL ghi nhận: " + dto.getRecordedQuantity() + " | SL thực tế: " + dto.getActualQuantity());
                System.out.println("Chênh lệch: " + dto.getDiscrepancy() + " | Chênh lệch giá: " + dto.getDifferencePrice());
                System.out.println("Lý do: " + dto.getReason());
                System.out.println("Nhân viên kho: " + dto.getWarehouseStaff());
                System.out.println("Ghi chú: " + dto.getNotes());
                System.out.println("==========================================\n");
            }
        }}
}
