/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Suppliers;
import model.Warehouse;

/**
 *
 * @author Dell
 */
public class WarehouseDAO extends DBContext {

    public List<Warehouse> getAllWarehouse() {
        List<Warehouse> warehouses = new ArrayList<>();
        String sql = "SELECT warehouse_id, warehouse_name, phone, address, status FROM Warehouses";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Warehouse warehouse = new Warehouse();
                warehouse.setWarehouseId(rs.getInt("warehouse_id"));
                warehouse.setWarehouseName(rs.getString("warehouse_name"));
                warehouse.setPhone(rs.getString("phone"));
                warehouse.setAddress(rs.getString("address"));
                warehouse.setStatus(rs.getString("status"));
                warehouses.add(warehouse);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return warehouses;
    }

    public List<Warehouse> getActiveWarehouses() {
        List<Warehouse> warehouses = new ArrayList<>();
        String sql = "SELECT * FROM Warehouses WHERE status = 'Active'";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Warehouse warehouse = new Warehouse();
                warehouse.setWarehouseId(rs.getInt("warehouse_id"));
                warehouse.setWarehouseName(rs.getString("warehouse_name"));
                warehouse.setPhone(rs.getString("phone"));
                warehouse.setAddress(rs.getString("address"));
                warehouse.setStatus(rs.getString("status"));
                warehouses.add(warehouse);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return warehouses;
    }

    public void updateWarehouseStatus(int warehouseId, String status) {
        String sql = "UPDATE Warehouses SET status = ? WHERE warehouse_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, warehouseId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean addWarehouse(Warehouse warehouse) {
        String sql = "INSERT INTO Warehouses (warehouse_name, phone, address, status) VALUES (?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            System.out.println("[DEBUG] Thông tin kho nhận vào:");
            System.out.println("Warehouse Name: " + warehouse.getWarehouseName());
            System.out.println("Phone: " + warehouse.getPhone());
            System.out.println(" Address: " + warehouse.getAddress());

            ps.setString(1, warehouse.getWarehouseName());
            ps.setString(2, warehouse.getPhone());
            ps.setString(3, warehouse.getAddress());
            ps.setString(4, "Active");

            int rowsInserted = ps.executeUpdate();
            System.out.println("Thêm kho thành công!");

            return rowsInserted > 0;
        } catch (SQLException e) {
            System.out.println("Lỗi SQL khi thêm kho: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public Warehouse getWarehouseById(int warehouseId) {
        String sql = "SELECT warehouse_id, warehouse_name, phone, address, status FROM Warehouses WHERE warehouse_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, warehouseId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Warehouse warehouse = new Warehouse();
                    warehouse = new Warehouse();
                    warehouse.setWarehouseId(rs.getInt("warehouse_id"));
                    warehouse.setWarehouseName(rs.getString("warehouse_name"));
                    warehouse.setPhone(rs.getString("phone"));
                    warehouse.setAddress(rs.getString("address"));
                    warehouse.setStatus(rs.getString("status"));
                    return warehouse;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateWarehouse(Warehouse warehouse) {
        String sql = "UPDATE Warehouses SET warehouse_name = ?, phone = ?, address = ?, status = ? WHERE warehouse_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, warehouse.getWarehouseName());
            ps.setString(2, warehouse.getPhone());
            ps.setString(3, warehouse.getAddress());
            ps.setString(4, warehouse.getStatus());
            ps.setInt(5, warehouse.getWarehouseId());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.out.println("Lỗi SQL khi cập nhật kho: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

}
