/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import model.Brands;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class BrandDAO extends DBContext {

    public List<Brands> getAllBrands() {

        List<Brands> list = new ArrayList<>();
        String sql = "SELECT * FROM Brands";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brands brand = new Brands();
                brand.setBrand_id(rs.getInt("brand_id"));
                brand.setBrand_name(rs.getString("brand_name"));
                list.add(brand);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public static void main(String[] args) {
        BrandDAO bd = new BrandDAO();
        List<Brands> l = bd.getAllBrands();
        for (Brands brands : l) {
            System.out.println(brands.getBrand_name());
        }
    }
}
