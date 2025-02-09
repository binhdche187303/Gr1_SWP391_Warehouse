/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Role;

/**
 *
 * @author Dell
 */
public class UserDAO extends DBContext {

    // Phương thức login
    public User login(String email, String password) {
        User user = null;
        String sql = "SELECT u.user_id, u.username, u.password, u.fullname, u.phone, u.email, u.role_id, u.status, u.address, r.role_name "
                + "FROM Users u "
                + "JOIN Roles r ON u.role_id = r.role_id "
                + "WHERE u.email = ? AND u.password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address")); // Gán giá trị address

                model.Role role = new model.Role();
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

    public boolean register(String username, String password, String fullname, String phone, String email, int roleId, String status) {
        String sql = "INSERT INTO Users (username, password, fullname, phone, email, role_id, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, fullname);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setInt(6, roleId);
            ps.setString(7, status);

            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
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

    public void create(User user) throws SQLException {
        String sql = "INSERT INTO users (username, fullname, email, password, role_id, status, address) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getFullname());
            ps.setString(3, user.getEmail());
            ps.setString(4, "123");  // Đặt mật khẩu mặc định là "123"
            ps.setInt(5, user.getRole().getRoleId());
            ps.setString(6, user.getStatus());

            // Kiểm tra nếu địa chỉ của người dùng là null
            if (user.getAddress() != null) {
                ps.setString(7, user.getAddress()); // Gán địa chỉ nếu có
            } else {
                ps.setNull(7, java.sql.Types.VARCHAR); // Gán null nếu địa chỉ không có
            }

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new user was inserted successfully.");
            } else {
                System.out.println("Failed to insert new user.");
            }
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
        String sql = "UPDATE users SET password = ? WHERE email = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, password);
            ps.setString(2, email);  // Sử dụng email để tìm người dùng
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();  // Kiểm tra nếu có lỗi
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
    public void updateUser(String fullname, String phone, String address, int user_id) {
        String sql = "UPDATE dbo.Users SET fullname=?,  phone=?, address=? WHERE user_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fullname);
            st.setString(2, phone);
            st.setString(3, address);
            st.setInt(4, user_id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    //Change password
        public void updatePassword(String password, int user_id) {
        String sql = "UPDATE dbo.Users SET password=? WHERE user_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setInt(2, user_id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public static void main(String[] args) {
        UserDAO uu = new UserDAO();
        
//        uu.updatePassword("1255", 7);
//        uu.updateUser("HIHI", "11112499999", "DAAAAAAAA", 7);
   User u = uu.getUserById(7);
    System.out.println(u.toString());}
}
