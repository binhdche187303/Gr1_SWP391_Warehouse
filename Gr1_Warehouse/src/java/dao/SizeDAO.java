/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import model.ProductVariants;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Sizes;

/**
 *
 * @author HP
 */
public class SizeDAO extends DBContext {
    
    public List<ProductVariants> getSizesByProductId(int productId) {
        List<ProductVariants> variants = new ArrayList<>();
        try {
            String query = "SELECT pv.variant_id, s.size_id, s.size_name, pv.price, pv.stock "
                    + "FROM ProductVariants pv "
                    + "JOIN Sizes s ON pv.size_id = s.size_id "
                    + "WHERE pv.product_id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                ProductVariants variant = new ProductVariants();
                int varId = rs.getInt("variant_id");
                int sizeId = rs.getInt("size_id");
                String sizeName = rs.getString("size_name");
                BigDecimal price = rs.getBigDecimal("price");
                int stock = rs.getInt("stock");
                Sizes size = new Sizes(sizeId, sizeName);
                variant.setVariantId(varId);
                variant.setStock(stock);
                variant.setPrice(price);
                variant.setSize(size);
                variants.add(variant);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return variants;
    }
}
