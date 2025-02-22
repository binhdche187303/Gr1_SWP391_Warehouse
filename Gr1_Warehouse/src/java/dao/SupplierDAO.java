package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Suppliers;

public class SupplierDAO extends DBContext {

    public List<Suppliers> getAllSuppliers() {
        List<Suppliers> suppliers = new ArrayList<>();
        String sql = "SELECT supplier_id, supplier_name, supplier_code, phone, email, address, status FROM Suppliers";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Suppliers supplier = new Suppliers();
                supplier.setSupplierId(rs.getInt("supplier_id"));
                supplier.setSupplierName(rs.getString("supplier_name"));
                supplier.setSupplierCode(rs.getString("supplier_code"));
                supplier.setPhone(rs.getString("phone"));
                supplier.setEmail(rs.getString("email"));
                supplier.setAddress(rs.getString("address"));
                supplier.setStatus(rs.getString("status"));  // Lấy giá trị status
                suppliers.add(supplier);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return suppliers;
    }

    public boolean addSupplier(Suppliers supplier) {
        String lastCodeQuery = "SELECT MAX(supplier_code) FROM Suppliers";
        String insertQuery = "INSERT INTO Suppliers (supplier_name, supplier_code, phone, email, address, status) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement psLastCode = connection.prepareStatement(lastCodeQuery); ResultSet rs = psLastCode.executeQuery()) {

            String supplierCode = "A";

            if (rs.next() && rs.getString(1) != null) {
                supplierCode = generateNextSupplierCode(rs.getString(1));
            }

            try (PreparedStatement psInsert = connection.prepareStatement(insertQuery)) {
                psInsert.setString(1, supplier.getSupplierName());
                psInsert.setString(2, supplierCode);
                psInsert.setString(3, supplier.getPhone());
                psInsert.setString(4, supplier.getEmail());
                psInsert.setString(5, supplier.getAddress());
                psInsert.setString(6, supplier.getStatus() != null ? supplier.getStatus() : "Active"); // Set giá trị status

                int rowsAffected = psInsert.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private String generateNextSupplierCode(String lastCode) {
        int length = lastCode.length();
        char[] chars = lastCode.toCharArray();

        for (int i = length - 1; i >= 0; i--) {
            if (chars[i] < 'Z') {
                chars[i]++;
                return new String(chars);
            }
            chars[i] = 'A';
        }
        return "A" + new String(chars);
    }

    public boolean editSupplier(Suppliers supplier) {
        String updateQuery = "UPDATE Suppliers SET supplier_name = ?, supplier_code = ?, phone = ?, email = ?, address = ?, status = ? WHERE supplier_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(updateQuery)) {
            ps.setString(1, supplier.getSupplierName());
            ps.setString(2, supplier.getSupplierCode());
            ps.setString(3, supplier.getPhone());
            ps.setString(4, supplier.getEmail());
            ps.setString(5, supplier.getAddress());
            ps.setString(6, supplier.getStatus());
            ps.setInt(7, supplier.getSupplierId());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void updateSupplierStatus(int supplierId, String status) {
        String sql = "UPDATE Suppliers SET status = ? WHERE supplier_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, supplierId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Suppliers getSupplierById(int supplierId) {
        String sql = "SELECT supplier_id, supplier_name, supplier_code, phone, email, address, status FROM Suppliers WHERE supplier_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, supplierId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Suppliers supplier = new Suppliers();
                    supplier.setSupplierId(rs.getInt("supplier_id"));
                    supplier.setSupplierName(rs.getString("supplier_name"));
                    supplier.setSupplierCode(rs.getString("supplier_code"));
                    supplier.setPhone(rs.getString("phone"));
                    supplier.setEmail(rs.getString("email"));
                    supplier.setAddress(rs.getString("address"));
                    supplier.setStatus(rs.getString("status"));
                    return supplier;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Suppliers getSupplierByCode(String supplierCode) {
        String sql = "SELECT * FROM Suppliers WHERE supplier_code = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, supplierCode);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Suppliers supplier = new Suppliers();
                supplier.setSupplierId(rs.getInt("supplier_id"));
                supplier.setSupplierName(rs.getString("supplier_name"));
                supplier.setSupplierCode(rs.getString("supplier_code"));
                supplier.setPhone(rs.getString("phone"));
                supplier.setEmail(rs.getString("email"));
                supplier.setAddress(rs.getString("address"));
                supplier.setStatus(rs.getString("status"));
                return supplier;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
