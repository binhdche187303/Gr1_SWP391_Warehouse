/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Statement;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Role;
import model.WholesaleCustomer;
import ulti.MD5Hash;

/**
 *
 * @author Dell
 */
public class UserDAO extends DBContext {

    // Phương thức login
    public User login(String identifier, String password) {
        String sql = "SELECT u.user_id, u.username, u.password, u.fullname, u.phone, u.email, "
                + "u.role_id, r.role_name, u.address, u.status AS user_status, "
                + "w.status AS wholesale_status "
                + "FROM Users u "
                + "LEFT JOIN Roles r ON u.role_id = r.role_id "
                + "LEFT JOIN WholesaleCustomers w ON u.user_id = w.user_id "
                + "WHERE (u.username = ? OR u.email = ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, identifier);
            ps.setString(2, identifier);
            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {
                System.out.println("❌ Sai tài khoản hoặc mật khẩu: " + identifier);
                return null;
            }

            String storedHashedPassword = rs.getString("password");
            String hashedInputPassword = MD5Hash.hash(password);
            String userStatus = rs.getString("user_status");
            String storeStatus = rs.getString("wholesale_status");

            // Kiểm tra tài khoản bị vô hiệu hóa
            if (userStatus == null || !"Active".equalsIgnoreCase(userStatus)) {
                System.out.println("⚠️ Tài khoản bị vô hiệu hóa: " + identifier);
                return createErrorUser("Tài khoản của bạn đã bị vô hiệu hóa. Vui lòng liên hệ quản trị viên.");
            }

            // Kiểm tra tài khoản bán buôn đang chờ duyệt
            if ("Chờ duyệt".equalsIgnoreCase(storeStatus)) {
                System.out.println("⏳ Tài khoản bán buôn đang chờ duyệt: " + identifier);
                return createErrorUser("Tài khoản bán buôn của bạn đang chờ duyệt. Vui lòng liên hệ quản trị viên.");
            }

            // Kiểm tra mật khẩu
            if (!hashedInputPassword.equals(storedHashedPassword)) {
                System.out.println("🔴 Sai tài khoản hoặc mật khẩu: " + identifier);
                return null;
            }

            User user = new User();
            user.setUserId(rs.getInt("user_id"));
            user.setUsername(rs.getString("username"));
            user.setPassword(storedHashedPassword);
            user.setFullname(rs.getString("fullname"));
            user.setPhone(rs.getString("phone"));
            user.setEmail(rs.getString("email"));
            user.setAddress(rs.getString("address"));

            Role role = new Role();
            role.setRoleId(rs.getInt("role_id"));
            role.setRoleName(rs.getString("role_name"));
            user.setRole(role);
            user.setStatus(userStatus);

            System.out.println("🟢 Đăng nhập thành công: " + identifier + " | Role: " + role.getRoleName());
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    private User createErrorUser(String errorMessage) {
        User errorUser = new User();
        errorUser.setStatus(errorMessage);
        return errorUser;
    }

    public String getWholesaleStatus(int userId) {
        String sql = "SELECT status FROM WholesaleCustomers WHERE user_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("status");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Không có tài khoản bán buôn
    }

    public User getUserByUsername(String identifier) {
        User user = null;
        String sql = "SELECT user_id, username, password, fullname, phone, email, role_id, status "
                + "FROM Users WHERE username = ? OR email = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, identifier);
            stmt.setString(2, identifier);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password")); // Lưu mật khẩu hash
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setRole(new Role(rs.getInt("role_id")));
                user.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // Kiểm tra email đã tồn tại chưa
    public boolean isEmailExist(String email) {
        String sql = "SELECT COUNT(*) FROM Users WHERE email = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean register(String username, String password, String fullname, String phone, String email, String storeName, String storeAddress, String taxCode, String businessLicense) {
        String hashedPassword = MD5Hash.hash(password);
        if (hashedPassword == null) {
            System.out.println("Lỗi khi hash mật khẩu!");
            return false;
        }

        String sql = "INSERT INTO Users (username, password, fullname, phone, email, role_id, address, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, username);
            ps.setString(2, hashedPassword);
            ps.setString(3, fullname);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setInt(6, 2); // Mặc định role_id là 2 (Customer)
            ps.setString(7, storeAddress); // ✅ Gán storeAddress vào address
            ps.setString(8, "Active");

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int userId = rs.getInt(1);

                    // ✅ Tạo đối tượng WholesaleCustomer
                    WholesaleCustomer customer = new WholesaleCustomer(userId, storeName, storeAddress, taxCode, businessLicense, "Chờ duyệt");

                    return addWholesaleCustomer(customer);
                }
            }
            return false;
        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean addWholesaleCustomer(WholesaleCustomer customer) {
        String sql = "INSERT INTO WholesaleCustomers (user_id, storeName, storeAddress, taxCode, businessLicense, status) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, customer.getUserId());
            ps.setString(2, customer.getStoreName());
            ps.setString(3, customer.getStoreAddress());
            ps.setString(4, customer.getTaxCode());
            ps.setString(5, customer.getBusinessLicense());
            ps.setString(6, customer.getStatus());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateStatus(int userId, String newStatus) {
        String sql = "UPDATE WholesaleCustomers SET status = ? WHERE user_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, newStatus);
            ps.setInt(2, userId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0; // Trả về true nếu cập nhật thành công
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<WholesaleCustomer> getAllWholesaleCustomers() {
        List<WholesaleCustomer> customers = new ArrayList<>();
        String sql = "SELECT user_id, storeName, storeAddress, taxCode, businessLicense, status FROM WholesaleCustomers";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                WholesaleCustomer customer = new WholesaleCustomer(
                        rs.getInt("user_id"),
                        rs.getString("storeName"),
                        rs.getString("storeAddress"),
                        rs.getString("taxCode"),
                        rs.getString("businessLicense"),
                        rs.getString("status")
                );
                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    public User findByEmail(String email) {
        String sql = "SELECT user_id, username, fullname, email, password, phone, role_id, status, address FROM users WHERE email = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setUserId(rs.getInt("user_id"));
                    user.setUsername(rs.getString("username"));
                    user.setFullname(rs.getString("fullname"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setStatus(rs.getString("status"));
                    user.setAddress(rs.getString("address"));  // Lấy giá trị address từ DB
                    user.setPhone(rs.getString("phone"));
                    // Lấy Role từ database
                    Role role = new Role();
                    role.setRoleId(rs.getInt("role_id"));
                    user.setRole(role);

                    return user;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean create(User user) throws SQLException {
        // Kiểm tra nếu email hoặc username đã tồn tại
        if (isEmailExist(user.getEmail()) || isUserNameExist(user.getUsername())) {
            return false; // Trả về false nếu tài khoản đã tồn tại
        }

        String sql = "INSERT INTO users (username, fullname, email, password, role_id, status, address) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getFullname());
            ps.setString(3, user.getEmail());
            ps.setString(4, MD5Hash.hash("123"));  // Mã hóa mật khẩu mặc định "123"
            ps.setInt(5, user.getRole().getRoleId());
            ps.setString(6, user.getStatus());

            // Kiểm tra nếu địa chỉ của người dùng là null
            if (user.getAddress() != null) {
                ps.setString(7, user.getAddress()); // Gán địa chỉ nếu có
            } else {
                ps.setNull(7, java.sql.Types.VARCHAR); // Gán null nếu địa chỉ không có
            }

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0; // Trả về true nếu thêm thành công, false nếu thất bại
        }
    }

    // Check if the email exists
    public User getUserByEmail(String email) {
        User user = null;
        String sql = "SELECT u.user_id, u.username, u.password, u.fullname, u.phone, u.email, u.role_id, u.status, r.role_name "
                + "FROM Users u "
                + "JOIN Roles r ON u.role_id = r.role_id "
                + "WHERE u.email = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));

                Role role = new Role();
                role.setRoleId(rs.getInt("role_id"));
                role.setRoleName(rs.getString("role_name"));
                user.setRole(role);

                user.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    public void updatePassword(String email, String password) {
        String hashedPassword = MD5Hash.hash(password);

        String sql = "UPDATE users SET password = ? WHERE email = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, hashedPassword);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User getUserById(int userId) {
        User user = null;
        String sql = "SELECT u.user_id, u.username, u.password, u.fullname, u.phone, u.email, u.role_id, u.address, u.status, r.role_name "
                + "FROM Users u "
                + "JOIN Roles r ON u.role_id = r.role_id "
                + "WHERE u.user_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);  // Thay vì email, ta sử dụng userId
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                Role role = new Role();
                role.setRoleId(rs.getInt("role_id"));
                role.setRoleName(rs.getString("role_name"));
                user.setRole(role);

                user.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    //Change profile
    public boolean updateUser(String fullname, String phone, String address, int user_id) {
        String sql = "UPDATE dbo.Users SET fullname=?,  phone=?, address=? WHERE user_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fullname);
            st.setString(2, phone);
            st.setString(3, address);
            st.setInt(4, user_id);
            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0; // Trả về true nếu có dòng được cập nhật
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Trả về false nếu có lỗi xảy ra
        }
    }

    public void updatePassword(String hashedPassword, int user_id) {
        String sql = "UPDATE dbo.Users SET password=? WHERE user_id=?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, hashedPassword);
            st.setInt(2, user_id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //Get all users
    public List<User> getAllUser() {

        List<User> list = new ArrayList<>();
        String sql = "SELECT u.user_id, u.username, u.password,u.fullname,u.phone,u.email,u.address,r.role_id,u.status, r.role_name FROM dbo.Users u JOIN dbo.Roles r\n"
                + "ON r.role_id = u.role_id\n"
                + "WHERE r.role_name = N'Customer'";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                Role role = new Role();
                role.setRoleId(rs.getInt("role_id"));
                role.setRoleName(rs.getString("role_name"));
                user.setRole(role);
                user.setStatus(rs.getString("status"));
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    //Get all staff
    public List<User> getAllStaff() {

        List<User> list = new ArrayList<>();
        String sql = "SELECT u.user_id,u.username, u.password,u.fullname,u.phone,u.email,u.address,u.role_id,r.role_name,u.status FROM dbo.Users u\n"
                + "JOIN dbo.Roles r ON r.role_id = u.role_id\n"
                + "WHERE r.role_name NOT IN (N'Customer', N'Admin System');";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                Role role = new Role();
                role.setRoleId(rs.getInt("role_id"));
                role.setRoleName(rs.getString("role_name"));
                user.setRole(role);
                user.setStatus(rs.getString("status"));
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    //Update user status
    public void updateStatus(String status, int user_id) {
        String sql = "UPDATE dbo.Users SET status = ? WHERE user_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, user_id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    //Update user staff
    public void updateStaff(String status, int roleId, int user_id) {
        String sql = "UPDATE dbo.Users SET status = ?, role_id = ? WHERE user_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, roleId);
            st.setInt(3, user_id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public int addUsers(List<User> userList) throws SQLException {
        String sql = "INSERT INTO Users (username, password, fullname, email, role_id) VALUES (?, ?, ?, ?, ?)";
        int addedCount = 0;
        PreparedStatement stmt = null;
        boolean originalAutoCommit = false;

        try {

            originalAutoCommit = connection.getAutoCommit();
            connection.setAutoCommit(false);  // Start transaction

            stmt = connection.prepareStatement(sql);

            // Clear any existing batch
            stmt.clearBatch();

            for (User user : userList) {
                stmt.setString(1, user.getUsername());
                stmt.setString(2, user.getPassword());
                stmt.setString(3, user.getFullname());
                stmt.setString(4, user.getEmail());
                stmt.setInt(5, user.getRole().getRoleId());
                stmt.addBatch();

                // Print debug information
                System.out.println("Adding to batch: " + user.getUsername());
            }

            System.out.println("Executing batch for " + userList.size() + " users");

            // Execute batch and get results
            int[] results = stmt.executeBatch();

            // Print batch results
            System.out.println("Batch execution results:");
            for (int i = 0; i < results.length; i++) {
                System.out.println("Result for user " + userList.get(i).getUsername() + ": " + results[i]);
                if (results[i] >= 0) {  // Check for successful insertion
                    addedCount++;
                }
            }

            // Commit the transaction
            connection.commit();
            System.out.println("Successfully committed " + addedCount + " users to database");

        } catch (SQLException e) {
            System.err.println("SQL Error occurred: " + e.getMessage());
            if (connection != null) {
                connection.rollback();
                System.out.println("Transaction rolled back");
            }
        } catch (Exception e) {
            System.err.println("General error: " + e.getMessage());
        } finally {
            try {
                // Reset auto-commit to original state
                if (connection != null) {
                    connection.setAutoCommit(originalAutoCommit);
                }
                // Close resources
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
                System.err.println("Error in cleanup: " + e.getMessage());
            }
        }

        return addedCount;
    }

    public List<User> getStaffByRole(int roleId) {
        List<User> staffList = new ArrayList<>();
        String sql = "SELECT user_id, fullname FROM Users WHERE role_id = ? AND status = 'Active'";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, roleId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setFullname(rs.getString("fullname"));
                staffList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffList;
    }

    public List<User> getStaffByRole2(int roleId) {
        List<User> staffList = new ArrayList<>();
        String sql = "SELECT user_id, username, fullname, password, phone, email, address, status FROM Users WHERE role_id = ? AND status = 'Active'";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, roleId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setFullname(rs.getString("fullname"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setStatus(rs.getString("status"));

                staffList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffList;
    }

    public int getAllStaffDashboard() {
        int numberOfStaff = 0;
        String sql = "SELECT COUNT(*)AS numberOfStaff FROM dbo.Users\n"
                + "WHERE role_id NOT IN (1,2) AND status =N'Active'";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                numberOfStaff = rs.getInt("numberOfStaff");

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return numberOfStaff;
    }

    public int getAllCusDashboard() {
        int numberOfCus = 0;
        String sql = "SELECT COUNT(*)AS numberOfCus FROM dbo.Users\n"
                + "WHERE role_id = 2 AND status =N'Active'";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                numberOfCus = rs.getInt("numberOfCus");

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return numberOfCus;
    }

    // Kiểm tra ussername đã tồn tại chưa
    public boolean isUserNameExist(String username) {
        String sql = "SELECT COUNT(*) FROM Users WHERE username = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isPhoneExist(String phone) throws Exception {
        String query = "SELECT COUNT(*) FROM Users WHERE phone = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, phone);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    public boolean isTaxCodeExist(String taxCode) throws Exception {
        String query = "SELECT COUNT(*) FROM WholesaleCustomers WHERE taxCode = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, taxCode);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    // Phương thức trong UserDAO để xác thực người dùng qua email hoặc username (với mã hóa MD5)
    public boolean validateUser(String identifier, String password) {
        try {
            // Mã hóa mật khẩu trước khi so sánh
            String hashedPassword = MD5Hash.hash(password);

            String sql = "SELECT * FROM Users WHERE (username = ? OR email = ?) AND password = ? AND status = 'Active'";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, identifier);
            st.setString(2, identifier);
            st.setString(3, hashedPassword);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("validateUser error: " + e.getMessage());
        }
        return false;
    }

// Phương thức trong UserDAO để cập nhật mật khẩu (với mã hóa MD5)
    public boolean changePassword(String identifier, String newPassword) {
        try {
            // Mã hóa mật khẩu mới trước khi lưu vào cơ sở dữ liệu
            String hashedPassword = MD5Hash.hash(newPassword);

            String sql = "UPDATE Users SET password = ? WHERE username = ? OR email = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, hashedPassword);
            st.setString(2, identifier);
            st.setString(3, identifier);
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("changePassword error: " + e.getMessage());
            return false;
        }
    }
}
