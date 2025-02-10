/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.security.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import model.TokenForgetPassword;

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
        String sql = "UPDATE [dbo].[tokenForgetPassword] SET [isUsed] = ? WHERE token = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setBoolean(1, token.isIsUsed());
            st.setString(2, token.getToken());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging instead
        }
    }
}
