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
import java.util.List;
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
    
    // Lấy các category_id được chọn từ checkbox
        String[] selectedCategories = request.getParameterValues("category_id");
        request.setAttribute("selectedCategories", selectedCategories);
        List<Products> filteredProducts = new ArrayList<>();

        if (selectedCategories != null && selectedCategories.length > 0) {
            // Nếu có danh mục được chọn, lọc sản phẩm theo các category_id
            filteredProducts = pdao.getAllProductsByCategories(selectedCategories);
        } else {
            // Nếu không có gì được chọn, lấy tất cả sản phẩm
            filteredProducts = pdao.getAllProducts();
        }
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
