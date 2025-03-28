/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.util.List;
import model.Role;

/**
 *
 * @author admin
 */
public class RoleDAO extends DBContext {

    public List<Role> getAllRole() {

        List<Role> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Roles";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role role = new Role();
                role.setRoleId(rs.getInt("role_id"));
                role.setRoleName(rs.getString("role_name"));
                list.add(role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public void updateRole(String roleName, int roleId) {
        String sql = "UPDATE dbo.Roles SET role_name=? WHERE role_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, roleName);
            st.setInt(2, roleId);

            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Role> getAllRoleStaff() {

        List<Role> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Roles\n"
                + "WHERE role_id NOT IN (1,2)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role role = new Role();
                role.setRoleId(rs.getInt("role_id"));
                role.setRoleName(rs.getString("role_name"));
                list.add(role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static void main(String[] args) {
        RoleDAO rd = new RoleDAO();
        rd.updateRole("Cuss", 2);
        List<Role> list = rd.getAllRole();
        for (Role role : list) {
            System.out.println(role);
        }

    }
}
