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
    String query = "SELECT pv.variant_id, s.size_id, s.size_name, pv.price, " +
                   "COALESCE(SUM(ib.quantity), 0) AS stock " +
                   "FROM ProductVariants pv " +
                   "JOIN Sizes s ON pv.size_id = s.size_id " +
                   "LEFT JOIN InventoryBatches ib ON pv.variant_id = ib.variant_id " +
                   "AND ib.status = 'In Stock' " +
                   "WHERE pv.product_id = ? " +
                   "GROUP BY pv.variant_id, s.size_id, s.size_name, pv.price";

    try (PreparedStatement stmt = connection.prepareStatement(query)) {
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
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return variants;
}
    
        public List<Sizes> getAllSizes() {

        List<Sizes> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Sizes";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Sizes size = new Sizes();
                size.setSize_id(rs.getInt("size_id"));
                size.setSize_name(rs.getString("size_name"));
                list.add(size);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static void main(String[] args) {
       SizeDAO sd = new SizeDAO();
        List<Sizes> l = sd.getAllSizes();
        for (Sizes size : l) {
            System.out.println(size.getSize_name());
        }
    }
    

}
