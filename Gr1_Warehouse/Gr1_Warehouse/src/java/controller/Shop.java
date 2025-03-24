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
        List<Categories> categories = pdao.getAllCategory();
        request.setAttribute("category", categories);

        List<Categories> cat = pdao.getCategoryProductCounts();
        request.setAttribute("category", cat);
        List<Brands> brand = pdao.getBrandProductCounts();
        request.setAttribute("brand", brand);

        // Lấy tham số từ request
        String[] categoryIdsParam = request.getParameterValues("category_id");
        String[] brandIdsParam = request.getParameterValues("brand_id");
        String minPriceParam = request.getParameter("minPrice");
        String maxPriceParam = request.getParameter("maxPrice");
        String subName = request.getParameter("subName");
        String sortOrder = request.getParameter("sortOrder");

        // Khai báo minPrice và maxPrice
        Double minPrice = null;
        Double maxPrice = null;

        // Xử lý giá trị price_range nếu có
        try {
            if (minPriceParam != null && !minPriceParam.isEmpty()) {
                minPrice = Double.parseDouble(minPriceParam);
            }
            if (maxPriceParam != null && !maxPriceParam.isEmpty()) {
                maxPrice = Double.parseDouble(maxPriceParam);
            }
        } catch (NumberFormatException e) {
            System.out.println("Invalid price format.");
        }
        request.setAttribute("minPrice", minPrice);
        request.setAttribute("maxPrice", maxPrice);

        // Chuyển đổi tham số category_ids và brand_ids từ mảng String[] thành List<Integer>
        List<Integer> categoryIds = categoryIdsParam != null
                ? Arrays.stream(categoryIdsParam).map(Integer::parseInt).collect(Collectors.toList()) : null;

        List<Integer> brandIds = brandIdsParam != null
                ? Arrays.stream(brandIdsParam).map(Integer::parseInt).collect(Collectors.toList()) : null;
        request.setAttribute("selectedCategories", categoryIds);
        request.setAttribute("selectedBrands", brandIds);

        request.setAttribute("selectedCategories", categoryIds);
        request.setAttribute("selectedBrands", brandIds);

// Gọi DAO để lấy danh sách sản phẩm đã lọc
        // Lấy danh sách sản phẩm đã lọc
        List<Products> filteredProducts;
        if (subName != null && !subName.trim().isEmpty()) {
            filteredProducts = pdao.getProductsBySubname(subName);
        } else {
            filteredProducts = pdao.getFilteredProducts(categoryIds, brandIds, minPrice, maxPrice, sortOrder);
        }

// Phân trang
        String page = request.getParameter("page") != null ? request.getParameter("page") : "1";
        int pageSize = 9; // Mỗi trang hiển thị 9 sản phẩm
        int currentPage = Integer.parseInt(page);
        int startProduct = (currentPage - 1) * pageSize;
        int totalProducts = filteredProducts.size();

        int maxPage = (int) Math.ceil((double) totalProducts / pageSize);
        List<Products> paginatedList = pdao.getListProductsPaginated(filteredProducts, startProduct, pageSize);
        List<Integer> paginationPages = new ArrayList<>();
        if (maxPage <= 5) {
            // Nếu tổng số trang <= 5, hiển thị hết
            for (int i = 1; i <= maxPage; i++) {
                paginationPages.add(i);
            }
        } else if (currentPage <= 3) {
            // Nếu đang ở 3 trang đầu, hiển thị từ 1 đến 5, thêm "..." và trang cuối
            for (int i = 1; i <= 5; i++) {
                paginationPages.add(i);
            }
            paginationPages.add(-1); // Dấu "..."
            paginationPages.add(maxPage);
        } else if (currentPage >= maxPage - 2) {
            // Nếu đang ở 3 trang cuối, hiển thị trang đầu, "..." rồi các trang cuối
            paginationPages.add(1);
            paginationPages.add(-1); // Dấu "..."
            for (int i = maxPage - 4; i <= maxPage; i++) {
                paginationPages.add(i);
            }
        } else {
            // Trường hợp còn lại: hiển thị trang đầu, "...", các trang gần currentPage, "..." và trang cuối
            paginationPages.add(1);
            paginationPages.add(-1); // Dấu "..."
            paginationPages.add(currentPage - 1);
            paginationPages.add(currentPage);
            paginationPages.add(currentPage + 1);
            paginationPages.add(-1); // Dấu "..."
            paginationPages.add(maxPage);
        }

        request.setAttribute("paginationPages", paginationPages); // Truyền trang cần hiển thị
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("maxPage", maxPage);

// Đẩy dữ liệu lên JSP
        request.setAttribute("p_list", paginatedList);
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
