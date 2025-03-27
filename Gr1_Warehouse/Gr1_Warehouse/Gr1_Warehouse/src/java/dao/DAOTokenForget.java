package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import model.TokenForgetPassword;
import ulti.MD5Hash;

/**
 *
 * @author Dell
 */
public class DAOTokenForget extends DBContext {

    public boolean insertTokenForget(TokenForgetPassword tokenForget) {
        String sql = "INSERT INTO TokenForgetPassword (token, expireTime, isUsed, user_id) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, tokenForget.getToken());
            ps.setTimestamp(2, java.sql.Timestamp.valueOf(tokenForget.getExpireTime())); // Use LocalDateTime directly
            ps.setBoolean(3, tokenForget.isIsUsed());
            ps.setInt(4, tokenForget.getUser_id());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public TokenForgetPassword getTokenPassword(String token) {
        String sql = "SELECT * FROM TokenForgetPassword WHERE token = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, token);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                System.out.println("Đã tìm thấy token trong cơ sở dữ liệu: " + token);
                return new TokenForgetPassword(
                        rs.getInt("user_id"),
                        rs.getBoolean("isUsed"),
                        rs.getString("token"),
                        rs.getTimestamp("expireTime").toLocalDateTime()
                );
            } else {
                System.out.println("Không tìm thấy token trong cơ sở dữ liệu: " + token);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateStatus(TokenForgetPassword token) {
        String sql = "UPDATE TokenForgetPassword SET isUsed = ? WHERE token = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setBoolean(1, token.isIsUsed());
            st.setString(2, token.getToken());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging instead
        }
    }

    public void updatePassword(String email, String password) {
        String sql = "UPDATE users SET password = ? WHERE email = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, MD5Hash.hash(password));  // Gọi hàm hash từ ulti
            ps.setString(2, email);  
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();  
        }
    }
}
