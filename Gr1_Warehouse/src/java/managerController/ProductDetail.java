/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package managerController;

import dao.BrandDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.List;
import model.Brands;
import model.Categories;
import model.Products;

/**
 *
 * @author admin
 */
public class ProductDetail extends HttpServlet {

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
            out.println("<title>Servlet ProductDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetail at " + request.getContextPath() + "</h1>");
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
        ProductDAO pd = new ProductDAO();
        BrandDAO bd = new BrandDAO();
        CategoryDAO cd = new CategoryDAO();
        String product_id_raw = request.getParameter("product_id");
        try {
            int product_id = Integer.parseInt(product_id_raw);
            Products p = pd.getDetails(product_id);
            List<Brands> listBrands = bd.getAllBrands();
            List<Categories> listCategories = cd.getAllCategories();
            request.setAttribute("product", p);
            request.setAttribute("listBrands", listBrands);
            request.setAttribute("listCategories", listCategories);
            request.getRequestDispatcher("/manager/product_detail.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
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
        String action = request.getParameter("action");
        ProductDAO pd = new ProductDAO();
        BrandDAO bd = new BrandDAO();
        CategoryDAO cd = new CategoryDAO();
        if ("edit".equals(action)) {
            try {
                String productId_raw = request.getParameter("productId");
                int productId = Integer.parseInt(productId_raw);
                String productName = request.getParameter("productname");
                String description = request.getParameter("description");
                String origin = request.getParameter("origin");
                String brandId_raw = request.getParameter("brand");
                int brandId = Integer.parseInt(brandId_raw);
                String categoryId_raw = request.getParameter("category");
                int categoryId = Integer.parseInt(categoryId_raw);

                boolean isUpdated = pd.updateProduct(productId, productName, description, origin, brandId, categoryId);

                if (isUpdated) {
                    request.getSession().setAttribute("success", "Cập nhật thành công");
                    response.sendRedirect("productdetail?product_id=" + productId);
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        } else if ("editprice".equals(action)) {
            try {
                // Lấy thông tin từ form
                int variantId = Integer.parseInt(request.getParameter("variant_id"));
                BigDecimal price = new BigDecimal(request.getParameter("price"));

                // Validate dữ liệu
                if (price.compareTo(BigDecimal.ZERO) <= 0) {
                    // Giá không hợp lệ
                    request.setAttribute("errorMessage", "Giá phải lớn hơn 0");
                }

                // Sử dụng hàm updatePrice đã có
                boolean success = pd.updatePrice(variantId, price);
                int productId = pd.getProductIdFromVariant(variantId);
                if (success) {
                    request.getSession().setAttribute("success", "Cập nhật thành công");
                    response.sendRedirect("productdetail?product_id=" + productId);
                }

            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        }
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
