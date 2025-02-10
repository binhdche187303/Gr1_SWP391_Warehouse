package controller;

import dao.ProductDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import model.Brands;
import model.Categories;
import model.Products;

/**
 *
 * @author Huy Nam
 */
public class Shop extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Shop</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Shop at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    ProductDAO pdao = new ProductDAO();
    List<Categories> cat = pdao.getCategoryProductCounts();
    request.setAttribute("category", cat); 
    List<Brands> brand = pdao.getBrandProductCounts();
    request.setAttribute("brand", brand);

    // Lấy tham số từ request
    String[] categoryIdsParam = request.getParameterValues("category_id");
    String[] brandIdsParam = request.getParameterValues("brand_id");
    String priceRange = request.getParameter("price_range");

    // Khai báo minPrice và maxPrice
    Double minPrice = null;
    Double maxPrice = null;

    // Xử lý giá trị price_range nếu có
    if (priceRange != null && !priceRange.isEmpty()) {
        // Giả sử giá trị price_range có dạng "min_price-max_price"
        String[] prices = priceRange.split(";");
        if (prices.length == 2) {
            try {
                minPrice = Double.parseDouble(prices[0]);
                maxPrice = Double.parseDouble(prices[1]);
            } catch (NumberFormatException e) {
                // Nếu xảy ra lỗi khi chuyển đổi, có thể gán minPrice và maxPrice về null
                System.out.println("Invalid price range format.");
            }
        }
    }

    // Chuyển đổi tham số category_ids và brand_ids từ mảng String[] thành List<Integer>
    List<Integer> categoryIds = categoryIdsParam != null ? Arrays.asList(categoryIdsParam).stream().map(Integer::parseInt).collect(Collectors.toList()) : null;
    List<Integer> brandIds = brandIdsParam != null ? Arrays.asList(brandIdsParam).stream().map(Integer::parseInt).collect(Collectors.toList()) : null;

    // In ra thông tin các tham số đã nhận
    System.out.println("Received Params - category_ids: " + categoryIds 
            + ", brand_ids: " + brandIds 
            + ", min_price: " + minPrice 
            + ", max_price: " + maxPrice);

    // Gọi DAO để lấy danh sách sản phẩm đã lọc
    List<Products> filteredProducts = pdao.getFilteredProducts(categoryIds, brandIds, minPrice, maxPrice);
    System.out.println("Số lượng sản phẩm lọc được: " + filteredProducts.size());

    // Đẩy dữ liệu lên JSP
    request.setAttribute("p_list", filteredProducts);
    String productIdParam = request.getParameter("productId");
    if (productIdParam != null && !productIdParam.trim().isEmpty()) {
        try {
            int productId = Integer.parseInt(productIdParam);
            Products product = pdao.getProductById(productId);

            if (product != null) {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print("{");
                out.print("\"productId\": " + product.getProductId() + ",");
                out.print("\"productName\": \"" + product.getProductName() + "\",");
                out.print("\"brandName\": \"" + (product.getBrand() != null ? product.getBrand().getBrand_name() : "NULL") + "\",");
                out.print("\"sku\": \"" + (product.getSku() != null ? product.getSku() : "NULL") + "\",");
                out.print("\"description\": \"" + product.getDescription() + "\",");
                out.print("\"origin\": \"" + product.getOrigin() + "\",");
                out.print("\"firstImageUrl\": \"" + product.getImages().get(0).getImage_url() + "\",");

                // Include Category (cate) in JSON response
                out.print("\"category\": \"" + (product.getCate() != null && product.getCate().getCategory_name() != null ? product.getCate().getCategory_name() : "NULL") + "\",");

                out.print("\"variants\": [");
                for (int i = 0; i < product.getVariants().size(); i++) {
                    if (i > 0) {
                        out.print(",");
                    }
                    out.print("{\"sizeId\": " + product.getVariants().get(i).getSize().getSize_id()
                            + ", \"sizeName\": \"" + product.getVariants().get(i).getSize().getSize_name() + "\""
                            + ", \"price\": " + product.getVariants().get(i).getPrice() + "}");
                }
                out.print("],");

                // List images
                out.print("\"images\": [");
                for (int i = 0; i < product.getImages().size(); i++) {
                    if (i > 0) {
                        out.print(",");
                    }
                    out.print("{\"imageUrl\": \"" + product.getImages().get(i).getImage_url() + "\"}");
                }
                out.print("]");

                out.print("}");
                out.flush();
                return;
            }
        } catch (NumberFormatException e) {
            System.out.println("Invalid productId format: " + productIdParam);
        }
    }

    RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/shop.jsp");
    dispatcher.forward(request, response);
}




    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
