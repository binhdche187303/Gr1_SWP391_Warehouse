/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import model.DiscountProduct;
import model.Products;

/**
 *
 * @author admin
 */
public class DiscountProductDAO extends DBContext {

    public List<DiscountProduct> getAllDiscountsProduct() {

        List<DiscountProduct> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.ProductQuantityDiscounts\n"
                + "JOIN dbo.Products ON Products.product_id = ProductQuantityDiscounts.product_id";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DiscountProduct dp = new DiscountProduct();
                dp.setProduct_discount_id(rs.getInt("product_discount_id"));

                Products p = new Products();
                p.setProductId(rs.getInt("product_id"));
                p.setProductName(rs.getString("product_name"));

                dp.setProduct(p);

                dp.setMin_quantity(rs.getInt("min_quantity"));
                dp.setDiscount_percentage(rs.getDouble("discount_percentage"));
                dp.setCreated_at(rs.getTimestamp("created_at").toLocalDateTime());
                dp.setStatus(rs.getString("status"));
                list.add(dp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public static void main(String[] args) {
        DiscountProductDAO dpd = new DiscountProductDAO();
        List<DiscountProduct> list = dpd.getAllDiscountsProduct();
        for (DiscountProduct discountProduct : list) {
            System.out.println(discountProduct);
        }
    }
}
