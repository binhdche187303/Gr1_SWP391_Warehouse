package dao;

import java.math.BigDecimal;
import model.Products;
import model.ProductVariants;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
import model.Brands;
import model.Categories;
import model.Images;
import model.Sizes;

public class ProductDAO extends DBContext {
 public List<Products> getListProductsPaginated(List<Products> listProducts, int startProduct, int pageSize) {

        List<Products> paginatedList = new ArrayList<>();

        int startIndex = startProduct;
        int endIndex = Math.min(startIndex + pageSize, listProducts.size());

        for (int i = startIndex; i < endIndex; i++) {
            paginatedList.add(listProducts.get(i));
        }

        return paginatedList;
    }

    
    public List<Products> getProductsBySubname(String sub_name) {
        List<Products> productsList = new ArrayList<>();
        String query = "WITH ProductMinPrice AS (\n"
                + "    SELECT \n"
                + "        pv.product_id,\n"
                + "        MIN(pv.price) AS min_price\n"
                + "    FROM \n"
                + "        ProductVariants pv\n"
                + "    GROUP BY \n"
                + "        pv.product_id\n"
                + "),\n"
                + "ProductFirstImage AS (\n"
                + "    SELECT \n"
                + "        i.product_id,\n"
                + "        MIN(i.image_id) AS first_image_id\n"
                + "    FROM \n"
                + "        Images i\n"
                + "    GROUP BY \n"
                + "        i.product_id\n"
                + ")\n"
                + "SELECT \n"
                + "    p.product_id,\n"
                + "    p.product_name,\n"
                + "    p.description,\n"
                + "    s.size_name AS size_type,\n"
                + "    pm.min_price AS current_price,\n"
                + "    i.image_url,\n"
                + "    c.category_name,\n"
                + "    c.category_id\n"
                + "FROM \n"
                + "    Products p\n"
                + "JOIN \n"
                + "    Categories c ON p.category_id = c.category_id\n"
                + "JOIN \n"
                + "    ProductMinPrice pm ON p.product_id = pm.product_id\n"
                + "JOIN \n"
                + "    ProductVariants pv ON p.product_id = pv.product_id AND pv.price = pm.min_price\n"
                + "JOIN \n"
                + "    Sizes s ON pv.size_id = s.size_id\n"
                + "JOIN \n"
                + "    ProductFirstImage pi ON p.product_id = pi.product_id\n"
                + "JOIN \n"
                + "    Images i ON pi.first_image_id = i.image_id\n"
                + " WHERE product_name LIKE ?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, "%" + sub_name + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                String description = rs.getString("description");
                String sizeType = rs.getString("size_type");
                double currentPrice = rs.getDouble("current_price");
                String imageUrl = rs.getString("image_url");

                // Create Product object
                Products product = new Products();
                product.setProductId(productId);
                product.setProductName(productName);
                product.setDescription(description);

                Categories cate = new Categories();
                cate.setCategory_id(rs.getInt("category_id"));
                cate.setCategory_name(rs.getString("category_name"));
                product.setCate(cate);

                // Create ProductVariants and Sizes for each product
                ProductVariants variant = new ProductVariants();
                variant.setPrice(BigDecimal.valueOf(currentPrice));
                Sizes size = new Sizes();
                size.setSize_name(sizeType);
                variant.setSize(size);
                product.setVariants(new ArrayList<ProductVariants>());
                product.getVariants().add(variant);

                // Set Image URL for the product
                Images image = new Images();
                image.setImage_url(imageUrl);
                product.setImages(new ArrayList<Images>());
                product.getImages().add(image);

                // Add the product to the list
                productsList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error fetching products: " + e.getMessage());
        }

        return productsList;
    }
    
    public List<Brands> getBrandProductCounts() {
        List<Brands> brandCounts = new ArrayList<>();
        String sql = "SELECT c.brand_id, c.brand_name, COUNT(p.product_id) AS total_products \n"
                + "                 FROM Brands c LEFT JOIN Products p ON c.brand_id = p.brand_id\n"
                + "                 GROUP BY c.brand_id, c.brand_name";

        try (PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Brands brand = new Brands();
                brand.setBrand_id(rs.getInt("brand_id"));
                brand.setBrand_name(rs.getString("brand_name"));
                brand.setTotalProducts(rs.getInt("total_products"));
                brandCounts.add(brand);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return brandCounts;
    }
    public List<Products> getFilteredProducts(List<Integer> categoryIds, List<Integer> brandIds, Double minPrice, Double maxPrice, String sortOrder) {
    List<Products> productsList = new ArrayList<>();

    String query = "WITH ProductMinPrice AS (\n"
            + "    SELECT pv.product_id, MIN(pv.price) AS min_price\n"
            + "    FROM ProductVariants pv\n"
            + "    GROUP BY pv.product_id\n"
            + "),\n"
            + "ProductFirstImage AS (\n"
            + "    SELECT i.product_id, MIN(i.image_id) AS first_image_id\n"
            + "    FROM Images i\n"
            + "    GROUP BY i.product_id\n"
            + ")\n"
            + "SELECT p.product_id, p.product_name, p.description,\n"
            + "       s.size_name AS size_type, pm.min_price AS current_price,\n"
            + "       i.image_url, c.category_name, c.category_id\n"
            + "FROM Products p\n"
            + "JOIN Categories c ON p.category_id = c.category_id\n"
            + "JOIN ProductMinPrice pm ON p.product_id = pm.product_id\n"
            + "JOIN ProductVariants pv ON p.product_id = pv.product_id AND pv.price = pm.min_price\n"
            + "JOIN Sizes s ON pv.size_id = s.size_id\n"
            + "JOIN ProductFirstImage pi ON p.product_id = pi.product_id\n"
            + "JOIN Images i ON pi.first_image_id = i.image_id\n"
            + "WHERE 1=1";

    // Thêm điều kiện lọc
    if (categoryIds != null && !categoryIds.isEmpty()) {
        query += " AND p.category_id IN (" + categoryIds.stream().map(id -> "?").collect(Collectors.joining(",")) + ")";
    }
    if (brandIds != null && !brandIds.isEmpty()) {
        query += " AND p.brand_id IN (" + brandIds.stream().map(id -> "?").collect(Collectors.joining(",")) + ")";
    }
    if (minPrice != null) {
        query += " AND pm.min_price >= ?";
    }
    if (maxPrice != null) {
        query += " AND pm.min_price <= ?";
    }

    // Điều kiện sắp xếp (giá tăng/giảm dần)
    if (sortOrder != null && (sortOrder.equalsIgnoreCase("asc") || sortOrder.equalsIgnoreCase("desc"))) {
        query += " ORDER BY pm.min_price " + sortOrder;
    }
    try {
        PreparedStatement ps = connection.prepareStatement(query);

        int index = 1;
        if (categoryIds != null) {
            for (Integer catId : categoryIds) {
                ps.setInt(index++, catId);
            }
        }
        if (brandIds != null) {
            for (Integer brandId : brandIds) {
                ps.setInt(index++, brandId);
            }
        }
        if (minPrice != null) {
            ps.setDouble(index++, minPrice);
        }
        if (maxPrice != null) {
            ps.setDouble(index++, maxPrice);
        }

        System.out.println("Executing Query: " + ps.toString()); // Debug SQL
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Products product = new Products();
            product.setProductId(rs.getInt("product_id"));
            product.setProductName(rs.getString("product_name"));
            product.setDescription(rs.getString("description"));

            // Set danh mục
            Categories cate = new Categories();
            cate.setCategory_id(rs.getInt("category_id"));
            cate.setCategory_name(rs.getString("category_name"));
            product.setCate(cate);

            // Tạo biến thể sản phẩm
            ProductVariants variant = new ProductVariants();
            variant.setPrice(BigDecimal.valueOf(rs.getDouble("current_price")));
            Sizes size = new Sizes();
            size.setSize_name(rs.getString("size_type"));
            variant.setSize(size);
            product.setVariants(new ArrayList<>());
            product.getVariants().add(variant);

            // Thêm ảnh sản phẩm
            Images image = new Images();
            image.setImage_url(rs.getString("image_url"));
            product.setImages(new ArrayList<>());
            product.getImages().add(image);

            productsList.add(product);
        }
    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println("Error fetching filtered products: " + e.getMessage());
    }

    return productsList;
}

    public List<Categories> getCategoryProductCounts() {
        List<Categories> categoryCounts = new ArrayList<>();
        String sql = "SELECT c.category_id, c.category_name, COUNT(p.product_id) AS total_products \n"
                + "                 FROM Categories c LEFT JOIN Products p ON c.category_id = p.category_id\n"
                + "                 GROUP BY c.category_id, c.category_name";

        try (PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Categories cat = new Categories();
                cat.setCategory_id(rs.getInt("category_id"));
                cat.setCategory_name(rs.getString("category_name"));
                cat.setTotalProducts(rs.getInt("total_products"));
                categoryCounts.add(cat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categoryCounts;
    }
    public List<Products> getAllProducts() {
        List<Products> productsList = new ArrayList<>();
        String query = "WITH ProductMinPrice AS (\n"
                + "    SELECT \n"
                + "        pv.product_id,\n"
                + "        MIN(pv.price) AS min_price\n"
                + "    FROM \n"
                + "        ProductVariants pv\n"
                + "    GROUP BY \n"
                + "        pv.product_id\n"
                + "),\n"
                + "ProductFirstImage AS (\n"
                + "    SELECT \n"
                + "        i.product_id,\n"
                + "        MIN(i.image_id) AS first_image_id\n"
                + "    FROM \n"
                + "        Images i\n"
                + "    GROUP BY \n"
                + "        i.product_id\n"
                + ")\n"
                + "SELECT \n"
                + "    p.product_id,\n"
                + "    p.product_name,\n"
                + "    p.description,\n"
                + "    s.size_name AS size_type,\n"
                + "    pm.min_price AS current_price,\n"
                + "    i.image_url,\n"
                + "    c.category_name,\n"
                + "    c.category_id\n"
                + "FROM \n"
                + "    Products p\n"
                + "JOIN \n"
                + "    Categories c ON p.category_id = c.category_id\n"
                + "JOIN \n"
                + "    ProductMinPrice pm ON p.product_id = pm.product_id\n"
                + "JOIN \n"
                + "    ProductVariants pv ON p.product_id = pv.product_id AND pv.price = pm.min_price\n"
                + "JOIN \n"
                + "    Sizes s ON pv.size_id = s.size_id\n"
                + "JOIN \n"
                + "    ProductFirstImage pi ON p.product_id = pi.product_id\n"
                + "JOIN \n"
                + "    Images i ON pi.first_image_id = i.image_id;";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                String description = rs.getString("description");
                String sizeType = rs.getString("size_type");
                double currentPrice = rs.getDouble("current_price");
                String imageUrl = rs.getString("image_url");

                // Create Product object
                Products product = new Products();
                product.setProductId(productId);
                product.setProductName(productName);
                product.setDescription(description);

                Categories cate = new Categories();
                cate.setCategory_id(rs.getInt("category_id"));
                cate.setCategory_name(rs.getString("category_name"));
                product.setCate(cate);

                // Create ProductVariants and Sizes for each product
                ProductVariants variant = new ProductVariants();
                variant.setPrice(BigDecimal.valueOf(currentPrice));
                Sizes size = new Sizes();
                size.setSize_name(sizeType);
                variant.setSize(size);
                product.setVariants(new ArrayList<ProductVariants>());
                product.getVariants().add(variant);

                // Set Image URL for the product
                Images image = new Images();
                image.setImage_url(imageUrl);
                product.setImages(new ArrayList<Images>());
                product.getImages().add(image);

                // Add the product to the list
                productsList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error fetching products: " + e.getMessage());
        }

        return productsList;
    }

    public Products getProductById(int productId) {
        Products product = null;
        String query = "WITH FirstImage AS (\n"
                + "    SELECT \n"
                + "        p.product_id,\n"
                + "        i.image_url,\n"
                + "        ROW_NUMBER() OVER (PARTITION BY p.product_id ORDER BY i.image_id ASC) AS row_num\n"
                + "    FROM \n"
                + "        Products p\n"
                + "    JOIN \n"
                + "        Images i ON p.product_id = i.product_id\n"
                + ")\n"
                + "SELECT \n"
                + "    p.product_id,\n"
                + "    p.product_name,\n"
                + "    p.description,\n"
                + "    p.SKU,\n"
                + "    b.brand_name,\n"
                + "    c.category_name,\n"
                + "    fi.image_url AS first_image_url,\n"
                + "    s.size_name,\n"
                + "    pv.price\n"
                + "FROM \n"
                + "    Products p\n"
                + "JOIN \n"
                + "    ProductVariants pv ON p.product_id = pv.product_id\n"
                + "JOIN \n"
                + "    Sizes s ON pv.size_id = s.size_id\n"
                + "JOIN \n"
                + "    Categories c ON p.category_id = c.category_id\n"
                + "JOIN \n"
                + "    Brands b ON p.brand_id = b.brand_id\n"
                + "JOIN \n"
                + "    FirstImage fi ON p.product_id = fi.product_id\n"
                + "WHERE \n"
                + "    p.product_id = ? AND fi.row_num = 1";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);  // Thêm productId vào câu lệnh
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                product = new Products();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setDescription(rs.getString("description"));
                product.setSku(rs.getString("SKU"));

                // Thêm thông tin thương hiệu và danh mục
                Brands brand = new Brands();
                brand.setBrand_name(rs.getString("brand_name"));
                product.setBrand(brand);

                Categories category = new Categories();
                category.setCategory_name(rs.getString("category_name"));
                product.setCate(category);

                // Set Image URL for the product
                List<Images> images = new ArrayList<>();
                Images firstImage = new Images();
                firstImage.setImage_url(rs.getString("first_image_url"));
                images.add(firstImage);
                product.setImages(images);

                // Lấy tất cả các kích thước và giá
                List<ProductVariants> variants = new ArrayList<>();
                do {
                    ProductVariants variant = new ProductVariants();
                    Sizes size = new Sizes();
                    size.setSize_name(rs.getString("size_name"));
                    variant.setSize(size);
                    variant.setPrice(rs.getBigDecimal("price"));
                    variants.add(variant);
                } while (rs.next());

                product.setVariants(variants);  // Gán danh sách biến thể cho sản phẩm

                // Debugging logs
                System.out.println("Product SKU: " + product.getSku());
                if (product.getBrand() != null) {
                    System.out.println("Product Brand: " + product.getBrand().getBrand_name());
                } else {
                    System.out.println("Product Brand: No brand found");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error fetching product with ID " + productId + ": " + e.getMessage());
        }

        return product;
    }

}
