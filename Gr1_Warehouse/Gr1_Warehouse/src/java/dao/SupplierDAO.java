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
                supplier.setStatus(rs.getString("status"));
                suppliers.add(supplier);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return suppliers;
    }

    public List<Suppliers> getActiveSuppliers() {
        List<Suppliers> suppliers = new ArrayList<>();
        String sql = "SELECT * FROM Suppliers WHERE status = 'Active'";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Suppliers supplier = new Suppliers();
                supplier.setSupplierId(rs.getInt("supplier_id"));
                supplier.setSupplierName(rs.getString("supplier_name"));
                supplier.setSupplierCode(rs.getString("supplier_code"));
                supplier.setPhone(rs.getString("phone"));
                supplier.setEmail(rs.getString("email"));
                supplier.setAddress(rs.getString("address"));
                supplier.setStatus(rs.getString("status"));
                suppliers.add(supplier);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return suppliers;
    }

    public boolean addSupplierWithBrand(Suppliers supplier, int brandId) {
        System.out.println("Adding supplier " + supplier.getSupplierName() + " with brand ID " + brandId);

        // Kiểm tra xem có nhà cung cấp nào phân phối thương hiệu này chưa
        boolean exists = checkSupplierWithBrand(brandId);
        if (exists) {
            System.out.println("Không thể thêm nhà cung cấp vì thương hiệu này đã có nhà cung cấp phân phối.");
            return false;
        }

        String lastCodeQuery = "SELECT MAX(supplier_code) FROM Suppliers";
        String insertSupplierQuery = "INSERT INTO Suppliers (supplier_name, supplier_code, phone, email, address, status) VALUES (?, ?, ?, ?, ?, ?)";
        String insertSupplierBrandQuery = "INSERT INTO SupplierBrand (supplier_id, brand_id) VALUES (?, ?)";

        try {
            connection.setAutoCommit(false); // Bắt đầu transaction

            // 1️⃣ Lấy mã supplier_code mới
            String supplierCode = "A";
            try (PreparedStatement psLastCode = connection.prepareStatement(lastCodeQuery); ResultSet rs = psLastCode.executeQuery()) {
                if (rs.next() && rs.getString(1) != null) {
                    supplierCode = generateNextSupplierCode(rs.getString(1));
                }
            }

            // 2️⃣ Thêm nhà cung cấp vào bảng Suppliers
            int supplierId = -1;
            try (PreparedStatement psInsert = connection.prepareStatement(insertSupplierQuery, Statement.RETURN_GENERATED_KEYS)) {
                psInsert.setString(1, supplier.getSupplierName());
                psInsert.setString(2, supplierCode);
                psInsert.setString(3, supplier.getPhone());
                psInsert.setString(4, supplier.getEmail());
                psInsert.setString(5, supplier.getAddress());
                psInsert.setString(6, supplier.getStatus() != null ? supplier.getStatus() : "Active");

                int rowsAffected = psInsert.executeUpdate();
                if (rowsAffected == 0) {
                    connection.rollback();
                    return false;
                }

                // 3️⃣ Lấy supplier_id vừa được tạo
                try (ResultSet generatedKeys = psInsert.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        supplierId = generatedKeys.getInt(1);
                    } else {
                        connection.rollback();
                        return false;
                    }
                }
            }

            // 4️⃣ Thêm dữ liệu vào bảng SupplierBrand
            try (PreparedStatement psInsertBrand = connection.prepareStatement(insertSupplierBrandQuery)) {
                psInsertBrand.setInt(1, supplierId);
                psInsertBrand.setInt(2, brandId);

                int brandRowsAffected = psInsertBrand.executeUpdate();
                if (brandRowsAffected == 0) {
                    connection.rollback();
                    return false;
                }
            }

            // ✅ Commit transaction
            connection.commit();
            System.out.println("Supplier added successfully with brand ID " + brandId);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.rollback(); // Rollback nếu có lỗi
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
        } finally {
            try {
                connection.setAutoCommit(true); // Bật lại commit tự động
            } catch (SQLException autoCommitEx) {
                autoCommitEx.printStackTrace();
            }
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

    public boolean checkSupplierWithBrand(int brandId) {
        String checkBrandSql = "SELECT COUNT(*) FROM SupplierBrand WHERE brand_id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(checkBrandSql)) {
            stmt.setInt(1, brandId); // Kiểm tra brand_id có phân phối hay chưa
            ResultSet rs = stmt.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                System.out.println("Có nhà cung cấp phân phối thương hiệu " + brandId);
                return true;  // Đã có nhà cung cấp phân phối thương hiệu này
            } else {
                System.out.println("Chưa có nhà cung cấp phân phối thương hiệu " + brandId);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi kiểm tra nhà cung cấp với thương hiệu: " + e.getMessage());
            e.printStackTrace();
        }
        return false; // Chưa có nhà cung cấp phân phối thương hiệu
    }
}
