package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Suppliers;

public class SupplierDAO extends DBContext {

    public List<Suppliers> getAllSuppliers() {
        List<Suppliers> suppliers = new ArrayList<>();
        String sql = "SELECT supplier_id, supplier_name, supplier_code, phone, email, address FROM Suppliers";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Suppliers supplier = new Suppliers();
                supplier.setSupplierId(rs.getInt("supplier_id"));
                supplier.setSupplierName(rs.getString("supplier_name"));
                supplier.setSupplierCode(rs.getString("supplier_code"));
                supplier.setPhone(rs.getString("phone"));
                supplier.setEmail(rs.getString("email"));
                supplier.setAddress(rs.getString("address"));
                suppliers.add(supplier);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return suppliers;
    }

    public void deleteSupplier(int supplierId) {
        String sql = "DELETE FROM suppliers WHERE supplier_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, supplierId);  
            ps.executeUpdate();  
        } catch (SQLException e) {
            e.printStackTrace();  
        }
    }

}
