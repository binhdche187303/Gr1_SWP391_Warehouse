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

public boolean addSupplier(Suppliers supplier) {
    String lastCodeQuery = "SELECT MAX(supplier_code) FROM Suppliers";
    String insertQuery = "INSERT INTO Suppliers (supplier_name, supplier_code, phone, email, address) VALUES (?, ?, ?, ?, ?)";

    try (PreparedStatement psLastCode = connection.prepareStatement(lastCodeQuery); 
         ResultSet rs = psLastCode.executeQuery()) {

        String supplierCode = "A"; // Mặc định nếu chưa có mã nào

        if (rs.next() && rs.getString(1) != null) {
            supplierCode = generateNextSupplierCode(rs.getString(1)); // Tạo mã nhà cung cấp tiếp theo
        }

        try (PreparedStatement psInsert = connection.prepareStatement(insertQuery)) {
            psInsert.setString(1, supplier.getSupplierName());
            psInsert.setString(2, supplierCode);
            psInsert.setString(3, supplier.getPhone());
            psInsert.setString(4, supplier.getEmail());
            psInsert.setString(5, supplier.getAddress());

            int rowsAffected = psInsert.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu chèn thành công
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false; // Nếu có lỗi xảy ra, trả về false
}

private String generateNextSupplierCode(String lastCode) {
    int length = lastCode.length();
    char[] chars = lastCode.toCharArray();

    for (int i = length - 1; i >= 0; i--) {
        if (chars[i] < 'Z') {
            chars[i]++;
            return new String(chars);
        }
        chars[i] = 'A'; // Quay lại 'A' nếu đã đến 'Z'
    }
    return "A" + new String(chars); // Thêm 'A' vào nếu hết tất cả các ký tự
}
}
