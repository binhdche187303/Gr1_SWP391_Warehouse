package dao;

import java.math.BigDecimal;
import model.Products;
import model.ProductVariants;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import model.Brands;
import model.Categories;
import model.Images;
import model.ProductDTO;
import model.Sizes;

public class ProductDAO extends DBContext {

    public Products getProductByIdAndSizeId(int productId, int sizeId) {
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
                // + "    p.SKU,\n"
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
                + "    p.product_id = ? \n"
                + "    AND pv.size_id = ? \n"
                + "    AND fi.row_num = 1";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ps.setInt(2, sizeId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                product = new Products();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setDescription(rs.getString("description"));
                // product.setSku(rs.getString("SKU"));

                // Thêm thông tin thương hiệu và danh mục
                Brands brand = new Brands();
                brand.setBrand_name(rs.getString("brand_name"));
                product.setBrand(brand);

                Categories category = new Categories();
                category.setCategory_name(rs.getString("category_name"));
                product.setCate(category);

                // Set Image URL cho sản phẩm
                List<Images> images = new ArrayList<>();
                Images firstImage = new Images();
                firstImage.setImage_url(rs.getString("first_image_url"));
                images.add(firstImage);
                product.setImages(images);

                // Thêm thông tin biến thể với size cụ thể
                List<ProductVariants> variants = new ArrayList<>();
                ProductVariants variant = new ProductVariants();
                Sizes size = new Sizes();
                size.setSize_name(rs.getString("size_name"));
                variant.setSize(size);
                variant.setPrice(rs.getBigDecimal("price"));
                variants.add(variant);

                product.setVariants(variants);

                // Debugging logs
                // System.out.println("Product SKU: " + product.getSku());
                System.out.println("Product Size: " + size.getSize_name());
                System.out.println("Product Price: " + variant.getPrice());
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error fetching product with ID " + productId + " and Size ID " + sizeId + ": " + e.getMessage());
        }

        return product;
    }

    public int getStockByProductIdAndSize(int productId, int sizeId) {
        String query = "SELECT COALESCE(SUM(ib.quantity), 0) AS stock "
                + "FROM ProductVariants pv "
                + "LEFT JOIN InventoryBatches ib ON pv.variant_id = ib.variant_id "
                + "AND ib.status = 'In Stock' "
                + "WHERE pv.product_id = ? AND pv.size_id = ? "
                + "GROUP BY pv.product_id, pv.size_id";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ps.setInt(2, sizeId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("stock");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public Products getDetails(int productId) {
        Products product = null;
        String sqlProduct = "SELECT p.*, c.category_name, b.brand_name "
                + "FROM Products p "
                + "JOIN Categories c ON p.category_id = c.category_id "
                + "JOIN Brands b ON p.brand_id = b.brand_id "
                + "WHERE p.product_id = ?";

        String sqlVariants = "SELECT pv.*, s.size_name, "
                + "COALESCE(SUM(ib.quantity), 0) AS stock "
                + "FROM ProductVariants pv "
                + "JOIN Sizes s ON pv.size_id = s.size_id "
                + "LEFT JOIN InventoryBatches ib ON pv.variant_id = ib.variant_id "
                + "AND ib.status = 'In Stock' "
                + "WHERE pv.product_id = ? "
                + "GROUP BY pv.variant_id, pv.product_id, pv.size_id, pv.price, pv.sku, s.size_name";

        String sqlImages = "SELECT * FROM Images WHERE product_id = ?";

        try (PreparedStatement pStmtProduct = connection.prepareStatement(sqlProduct); PreparedStatement pStmtVariants = connection.prepareStatement(sqlVariants); PreparedStatement pStmtImages = connection.prepareStatement(sqlImages)) {

            // Lấy thông tin sản phẩm
            pStmtProduct.setInt(1, productId);
            try (ResultSet rsProduct = pStmtProduct.executeQuery()) {
                if (rsProduct.next()) {
                    product = new Products();
                    product.setProductId(rsProduct.getInt("product_id"));
                    product.setProductName(rsProduct.getString("product_name"));
                    product.setOrigin(rsProduct.getString("origin"));
                    product.setDescription(rsProduct.getString("description"));

                    // Gán danh mục sản phẩm
                    Categories category = new Categories();
                    category.setCategory_id(rsProduct.getInt("category_id"));
                    category.setCategory_name(rsProduct.getString("category_name"));
                    product.setCate(category);

                    // Gán thương hiệu sản phẩm
                    Brands brand = new Brands();
                    brand.setBrand_id(rsProduct.getInt("brand_id"));
                    brand.setBrand_name(rsProduct.getString("brand_name"));
                    product.setBrand(brand);
                }
            }

            // Lấy danh sách các biến thể sản phẩm (size, giá, tồn kho)
            pStmtVariants.setInt(1, productId);
            List<ProductVariants> variantList = new ArrayList<>();
            try (ResultSet rsVariants = pStmtVariants.executeQuery()) {
                while (rsVariants.next()) {
                    ProductVariants variant = new ProductVariants();
                    variant.setVariantId(rsVariants.getInt("variant_id"));
                    variant.setProductId(rsVariants.getInt("product_id"));
                    variant.setSizeId(rsVariants.getInt("size_id"));
                    variant.setPrice(rsVariants.getBigDecimal("price"));
                    variant.setSku(rsVariants.getString("sku"));
                    variant.setStock(rsVariants.getInt("stock")); // Tổng số hàng trong kho cho biến thể này

                    // Lấy thông tin kích thước
                    Sizes size = new Sizes();
                    size.setSize_id(rsVariants.getInt("size_id"));
                    size.setSize_name(rsVariants.getString("size_name"));
                    variant.setSize(size);

                    variantList.add(variant);
                }
            }
            product.setVariants(variantList);

            // Lấy danh sách hình ảnh sản phẩm
            pStmtImages.setInt(1, productId);
            List<Images> imageList = new ArrayList<>();
            try (ResultSet rsImages = pStmtImages.executeQuery()) {
                while (rsImages.next()) {
                    Images img = new Images();
                    img.setImage_id(rsImages.getInt("image_id"));
                    img.setImage_url(rsImages.getString("image_url"));
                    imageList.add(img);
                }
            }
            product.setImages(imageList);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return product;
    }

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

    public List<ProductDTO> getProductsBySupplier(String supplierCode) {
        List<ProductDTO> products = new ArrayList<>();
        String sql = "SELECT p.product_name, pv.sku, pv.variant_id, sz.size_name " // Add size_name to the select statement
                + "FROM Products p "
                + "JOIN ProductVariants pv ON p.product_id = pv.product_id "
                + "JOIN Brands b ON p.brand_id = b.brand_id "
                + "JOIN SupplierBrand sb ON b.brand_id = sb.brand_id "
                + "JOIN Suppliers s ON sb.supplier_id = s.supplier_id "
                + "JOIN Sizes sz ON pv.size_id = sz.size_id " // Join Sizes table to get size_name
                + "WHERE s.supplier_code = ? "
                + "GROUP BY p.product_id, p.product_name, pv.sku, pv.variant_id, sz.size_name";  // Include size_name in GROUP BY

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, supplierCode);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                // Modify ProductDTO to accept size_name
                ProductDTO product = new ProductDTO(
                        rs.getString("product_name"),
                        rs.getString("sku"),
                        rs.getString("variant_id"),
                        rs.getString("size_name") // Pass size_name to the DTO constructor
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    //Get product by subName--Tuan
    public List<Products> getProductsByName(String sub_name) {
        List<Products> list = new ArrayList<>();
        String query = "SELECT * FROM dbo.Products\n"
                + "WHERE product_name LIKE ?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, "%" + sub_name + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Products p = new Products();
                p.setProductId(rs.getInt("product_id"));
                p.setProductName(rs.getString("product_name"));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error fetching products: " + e.getMessage());
        }

        return list;
    }

    public List<Products> getAllProductsManager() {
        List<Products> products = new ArrayList<>();
        String sql = """
            SELECT 
                p.product_id, 
                p.product_name, 
                p.origin, 
                p.description,
                c.category_id, c.category_name,
                b.brand_id, b.brand_name,
                i.image_id, i.image_url,
                s.size_id, s.size_name, pv.price, pv.sku
            FROM Products p
            JOIN Categories c ON p.category_id = c.category_id
            JOIN Brands b ON p.brand_id = b.brand_id
            LEFT JOIN Images i ON p.product_id = i.product_id
            LEFT JOIN ProductVariants pv ON p.product_id = pv.product_id
            LEFT JOIN Sizes s ON pv.size_id = s.size_id
            ORDER BY p.product_id
        """;

        try (
                PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            Map<Integer, Products> productMap = new HashMap<>();

            while (rs.next()) {
                int productId = rs.getInt("product_id");

                Products product = productMap.get(productId);
                if (product == null) {
                    product = new Products();
                    product.setProductId(productId);
                    product.setProductName(rs.getString("product_name"));
                    product.setOrigin(rs.getString("origin"));
                    product.setDescription(rs.getString("description"));

                    Categories category = new Categories();
                    category.setCategory_id(rs.getInt("category_id"));
                    category.setCategory_name(rs.getString("category_name"));
                    product.setCate(category);

                    Brands brand = new Brands();
                    brand.setBrand_id(rs.getInt("brand_id"));
                    brand.setBrand_name(rs.getString("brand_name"));
                    product.setBrand(brand);

                    product.setImages(new ArrayList<>());
                    product.setVariants(new ArrayList<>());

                    productMap.put(productId, product);
                }

                if (rs.getString("image_url") != null) {
                    Images image = new Images();
                    image.setImage_id(rs.getInt("image_id"));
                    image.setImage_url(rs.getString("image_url"));
                    product.getImages().add(image);
                }

                if (rs.getInt("size_id") != 0) {
                    ProductVariants variant = new ProductVariants();
                    variant.setSize(new Sizes(rs.getInt("size_id"), rs.getString("size_name")));
                    variant.setPrice(rs.getBigDecimal("price"));
                    variant.setSku(rs.getString("sku"));
                    product.getVariants().add(variant);
                }
            }

            products.addAll(productMap.values());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public boolean updateProduct(int productId, String productName, String description, String origin, int brandId, int categoryId) {
        PreparedStatement stmt = null;
        boolean success = false;

        try {
            // SQL để cập nhật sản phẩm
            String sql = "UPDATE Products SET product_name = ?, description = ?, origin = ?, brand_id = ?, category_id = ? WHERE product_id = ?";

            // Chuẩn bị câu lệnh
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, productName);
            stmt.setString(2, description);
            stmt.setString(3, origin);
            stmt.setInt(4, brandId);
            stmt.setInt(5, categoryId);
            stmt.setInt(6, productId);

            // Thực thi câu lệnh
            int rowsAffected = stmt.executeUpdate();

            // Kiểm tra xem có bản ghi nào được cập nhật không
            if (rowsAffected > 0) {
                success = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Ghi log lỗi
        } finally {
            // Đóng các tài nguyên
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return success;
    }

    public boolean updatePrice(int variantId, BigDecimal price) {
        // SQL statement to update the price of a specific product variant
        String sql = "UPDATE ProductVariants SET price = ? WHERE variant_id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            // Set parameters for the SQL statement
            stmt.setBigDecimal(1, price);
            stmt.setInt(2, variantId);

            // Execute the update
            int rowsAffected = stmt.executeUpdate();

            // Return true if the update was successful (at least one row was affected)
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getProductIdFromVariant(int variantId) {
        String sql = "SELECT product_id FROM ProductVariants WHERE variant_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, variantId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("product_id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Fallback nếu không tìm thấy
        return -1;
    }

    public boolean addProductVariant(int product_id, int size_id, BigDecimal price, String sku) {
        if (isSkuExists(sku)) {
            return false; // Không thêm nếu SKU đã tồn tại
        }

        String sql = "INSERT INTO dbo.ProductVariants\n"
                + "(product_id,size_id, price,sku)\n"
                + "VALUES\n"
                + "(?,?,?,?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, product_id);
            ps.setInt(2, size_id);
            ps.setBigDecimal(3, price);
            ps.setString(4, sku);

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Hàm kiểm tra SKU đã tồn tại hay chưa
    public boolean isSkuExists(String sku) {
        String sql = "SELECT COUNT(*) FROM ProductVariants WHERE sku = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, sku);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Trả về true nếu có ít nhất 1 SKU trùng
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateProductImages(List<Images> images, int productId) {
        boolean success = false;

        PreparedStatement psDelete = null;
        PreparedStatement psInsert = null;

        try {

            connection.setAutoCommit(false); // Bắt đầu transaction

            // 1. Xóa tất cả ảnh cũ của sản phẩm
            String deleteQuery = "DELETE FROM Images WHERE product_id = ?";
            psDelete = connection.prepareStatement(deleteQuery);
            psDelete.setInt(1, productId);
            psDelete.executeUpdate();

            // 2. Chèn các ảnh mới vào bảng
            if (images != null && !images.isEmpty()) {
                String insertQuery = "INSERT INTO Images (product_id, image_url) VALUES (?, ?)";
                psInsert = connection.prepareStatement(insertQuery);

                for (Images image : images) {
                    psInsert.setInt(1, productId);
                    psInsert.setString(2, image.getImage_url());
                    psInsert.addBatch(); // Thêm vào batch để thực hiện cùng lúc
                }

                psInsert.executeBatch(); // Thực hiện insert tất cả ảnh
            }

            // Commit transaction nếu không có lỗi
            connection.commit();
            success = true;

        } catch (SQLException e) {
            // Xử lý ngoại lệ và rollback transaction nếu có lỗi
            try {
                if (connection != null) {
                    connection.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            // Đóng tài nguyên
            try {
                if (psInsert != null) {
                    psInsert.close();
                }
                if (psDelete != null) {
                    psDelete.close();
                }
                if (connection != null) {
                    connection.setAutoCommit(true); // Đặt lại auto commit
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return success;
    }

    // Hàm kiểm tra Product Name đã tồn tại hay chưa
    public boolean isProductNameExists(String product_name) {
        String sql = "SELECT COUNT(*) FROM Products WHERE product_name = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, product_name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addNewProduct(Products product) {
        PreparedStatement stmtProduct = null;
        PreparedStatement stmtImage = null;
        PreparedStatement stmtVariant = null;
        ResultSet rs = null;
        boolean success = false;

        try {

            // Tắt auto-commit để xử lý transaction
            connection.setAutoCommit(false);

            // 1. Thêm vào bảng Products
            String sqlProduct = "INSERT INTO Products (product_name, brand_id, origin, category_id, description) "
                    + "VALUES (?, ?, ?, ?, ?)";

            stmtProduct = connection.prepareStatement(sqlProduct, Statement.RETURN_GENERATED_KEYS);
            stmtProduct.setString(1, product.getProductName());
            stmtProduct.setInt(2, product.getBrand().getBrand_id());
            stmtProduct.setString(3, product.getOrigin());
            stmtProduct.setInt(4, product.getCate().getCategory_id());
            stmtProduct.setString(5, product.getDescription());

            int affectedRows = stmtProduct.executeUpdate();

            if (affectedRows > 0) {
                // Lấy product_id được tạo tự động
                rs = stmtProduct.getGeneratedKeys();
                if (rs.next()) {
                    int productId = rs.getInt(1);
                    product.setProductId(productId);

                    // 2. Thêm hình ảnh sản phẩm
                    List<Images> imageUrls = product.getImages();
                    String sqlImage = "INSERT INTO Images (product_id, image_url) VALUES (?, ?)";
                    stmtImage = connection.prepareStatement(sqlImage);

                    for (Images imageUrl : imageUrls) {
                        stmtImage.setInt(1, productId);
                        stmtImage.setString(2, imageUrl.getImage_url());
                        stmtImage.addBatch();
                    }
                    stmtImage.executeBatch();

                    // 3. Thêm biến thể sản phẩm
                    List<ProductVariants> variants = product.getVariants();
                    String sqlVariant = "INSERT INTO ProductVariants (product_id, size_id, price, sku) "
                            + "VALUES (?, ?, ?, ?)";
                    stmtVariant = connection.prepareStatement(sqlVariant);

                    for (ProductVariants variant : variants) {
                        stmtVariant.setInt(1, productId);
                        stmtVariant.setInt(2, variant.getSize().getSize_id());
                        stmtVariant.setBigDecimal(3, variant.getPrice());
                        stmtVariant.setString(4, variant.getSku());
                        stmtVariant.addBatch();
                    }
                    stmtVariant.executeBatch();
                }

                // Hoàn tất transaction
                connection.commit();
                success = true;
            }

        } catch (SQLException e) {
            // Nếu có lỗi, rollback transaction
            try {
                if (connection != null) {
                    connection.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            // Đóng tất cả các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmtProduct != null) {
                    stmtProduct.close();
                }
                if (stmtImage != null) {
                    stmtImage.close();
                }
                if (stmtVariant != null) {
                    stmtVariant.close();
                }
                if (connection != null) {
                    connection.setAutoCommit(true);
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return success;
    }

    public int getAllProductDashboard() {
        int numberOfProduct = 0;
        String sql = "SELECT COUNT(*)AS numberOfproduct FROM dbo.Products";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                numberOfProduct = rs.getInt("numberOfproduct");

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return numberOfProduct;
    }

     public List<Products> getProductsByCategoryOrBrand(Integer categoryId) {
    List<Products> productsList = new ArrayList<>();
    
    // Câu truy vấn SQL với điều kiện lọc theo category_id hoặc brand_id nếu được truyền vào
    String query = "WITH ProductMinPrice AS ( "
                 + "    SELECT pv.product_id, MIN(pv.price) AS min_price "
                 + "    FROM ProductVariants pv "
                 + "    GROUP BY pv.product_id "
                 + "), "
                 + "ProductFirstImage AS ( "
                 + "    SELECT i.product_id, MIN(i.image_id) AS first_image_id "
                 + "    FROM Images i "
                 + "    GROUP BY i.product_id "
                 + ") "
                 + "SELECT p.product_id, p.product_name, p.description, "
                 + "       s.size_name AS size_type, pm.min_price AS current_price, "
                 + "       i.image_url, c.category_name, c.category_id, "
                 + "       b.brand_id, b.brand_name "
                 + "FROM Products p "
                 + "JOIN Categories c ON p.category_id = c.category_id "
                 + "JOIN Brands b ON p.brand_id = b.brand_id "
                 + "JOIN ProductMinPrice pm ON p.product_id = pm.product_id "
                 + "JOIN ProductVariants pv ON p.product_id = pv.product_id AND pv.price = pm.min_price "
                 + "JOIN Sizes s ON pv.size_id = s.size_id "
                 + "JOIN ProductFirstImage pi ON p.product_id = pi.product_id "
                 + "JOIN Images i ON pi.first_image_id = i.image_id ";

    // Thêm điều kiện lọc nếu có categoryId hoặc brandId
    List<Integer> params = new ArrayList<>();
    if (categoryId != null && categoryId > 0) {
        query += "WHERE c.category_id = ? ";
        params.add(categoryId);
    }
    
    try {
        PreparedStatement ps = connection.prepareStatement(query);
        for (int i = 0; i < params.size(); i++) {
            ps.setInt(i + 1, params.get(i));
        }
        
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            int productId = rs.getInt("product_id");
            String productName = rs.getString("product_name");
            String description = rs.getString("description");
            String sizeType = rs.getString("size_type");
            double currentPrice = rs.getDouble("current_price");
            String imageUrl = rs.getString("image_url");

            // Tạo đối tượng Product
            Products product = new Products();
            product.setProductId(productId);
            product.setProductName(productName);
            product.setDescription(description);

            // Gán thông tin category
            Categories cate = new Categories();
            cate.setCategory_id(rs.getInt("category_id"));
            cate.setCategory_name(rs.getString("category_name"));
            product.setCate(cate);

            // Gán thông tin thương hiệu
            Brands brand = new Brands();
            brand.setBrand_id(rs.getInt("brand_id"));
            brand.setBrand_name(rs.getString("brand_name"));
            product.setBrand(brand);

            // Gán thông tin size và giá
            ProductVariants variant = new ProductVariants();
            variant.setPrice(BigDecimal.valueOf(currentPrice));
            Sizes size = new Sizes();
            size.setSize_name(sizeType);
            variant.setSize(size);
            product.setVariants(new ArrayList<>());
            product.getVariants().add(variant);

            // Gán hình ảnh
            Images image = new Images();
            image.setImage_url(imageUrl);
            product.setImages(new ArrayList<>());
            product.getImages().add(image);

            productsList.add(product);
        }
    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println("Error fetching products: " + e.getMessage());
    }

    return productsList;
}

    
    public List<Categories> getAllCategory() {
        List<Categories> categories  = new ArrayList<>();
        String sql = "SELECT * FROM Categories";

        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                categories.add(new Categories(rs.getInt("category_id"), rs.getString("category_name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    
    public static void main(String[] args) {
        ProductDAO pd = new ProductDAO();
        Products p = new Products();

        int i = pd.getAllProductDashboard();
        System.out.println(i);
//        p.setProductName("abc");
//        Brands brands = new Brands();
//        brands.setBrand_id(1);
//        p.setBrand(brands);
//        p.setOrigin("bcd");
//        Categories c = new Categories();
//        c.setCategory_id(1);
//        p.setCate(c);
//        p.setDescription("mns");
//        
//        List<Images> li = new ArrayList<>();
//        Images i1 = new Images("123");
//        Images i2 = new Images("456");
//        li.add(i1);
//        li.add(i2);
//        p.setImages(li);
//        
//        List<ProductVariants> lpv = new ArrayList<>();
//        ProductVariants pv = new ProductVariants();
//        
//        pv.setSku("1111111");
//        Sizes size = new Sizes();
//        size.setSize_id(1);
//        pv.setSize(size);
//        pv.setPrice(BigDecimal.ONE);
//        lpv.add(pv);
//        p.setVariants(lpv);
//        boolean success = pd.addNewProduct(p);
//        System.out.println(success);
//        pd.updatePrice(154, BigDecimal.valueOf(123));
    }
}
