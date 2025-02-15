/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Images;
import model.ProductVariants;
import model.Products;

/**
 *
 * @author Huy Nam
 */
public class ShopDetails extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet ShopDetails</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopDetails at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//       ProductDAO productDAO = new ProductDAO();
//    String productIdParam = request.getParameter("productId");
//
//    // Kiểm tra xem tham số id có tồn tại không
//    if (productIdParam != null) {
//        try {
//            int productId = Integer.parseInt(productIdParam);
//
//            // In ra id sản phẩm
//            System.out.println("Product ID: " + productId);
//
//            // Lấy chi tiết sản phẩm
//            Products product = productDAO.getDetails(productId);
//            request.setAttribute("product", product);
//            request.getRequestDispatcher("pages/productDetails.jsp").forward(request, response);
//        } catch (NumberFormatException e) {
//            // Xử lý lỗi nếu productId không hợp lệ
//            System.out.println("Invalid product ID.");
//            request.setAttribute("errorMessage", "ID sản phẩm không hợp lệ.");
//            request.getRequestDispatcher("error.jsp").forward(request, response);
//        }
//    } else {
//        // Xử lý khi không có tham số id
//        System.out.println("No product ID found.");
//        request.setAttribute("errorMessage", "Không tìm thấy sản phẩm.");
//        request.getRequestDispatcher("error.jsp").forward(request, response);
//    }
//    } 
protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    ProductDAO productDAO = new ProductDAO();
    String productIdParam = request.getParameter("productId");

    if (productIdParam != null) {
        try {
            int productId = Integer.parseInt(productIdParam);
            System.out.println("🔍 Product ID received: " + productId);

            // Lấy chi tiết sản phẩm
            Products product = productDAO.getDetails(productId);

            // Kiểm tra nếu sản phẩm null
            if (product == null) {
                System.out.println("⚠️ Không tìm thấy sản phẩm với ID: " + productId);
                request.setAttribute("errorMessage", "Không tìm thấy sản phẩm.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // In thông tin sản phẩm ra console để kiểm tra
            System.out.println("✅ Product Name: " + product.getProductName());
            System.out.println("✅ SKU: " + product.getSku());
            System.out.println("✅ Origin: " + product.getOrigin());
            System.out.println("✅ Description: " + product.getDescription());

            // Kiểm tra danh mục sản phẩm
            if (product.getCate() != null) {
                System.out.println("✅ Category: " + product.getCate().getCategory_name());
            } else {
                System.out.println("⚠️ Category is NULL");
            }

            // Kiểm tra thương hiệu sản phẩm
            if (product.getBrand() != null) {
                System.out.println("✅ Brand: " + product.getBrand().getBrand_name());
            } else {
                System.out.println("⚠️ Brand is NULL");
            }

            // Kiểm tra danh sách biến thể sản phẩm (size, giá, tồn kho)
            System.out.println("📦 Product Variants:");
            if (product.getVariants() != null && !product.getVariants().isEmpty()) {
                for (ProductVariants variant : product.getVariants()) {
                    System.out.println("   - Variant ID: " + variant.getVariantId());
                    System.out.println("     Size: " + variant.getSize().getSize_name());
                    System.out.println("     Price: " + variant.getPrice());
                    System.out.println("     Stock: " + variant.getStock());
                }
            } else {
                System.out.println("⚠️ No variants found.");
            }

            // Kiểm tra danh sách ảnh sản phẩm
            System.out.println("🖼️ Product Images:");
            if (product.getImages() != null && !product.getImages().isEmpty()) {
                for (Images img : product.getImages()) {
                    System.out.println("   - Image ID: " + img.getImage_id() + " | URL: " + img.getImage_url());
                }
            } else {
                System.out.println("⚠️ No images found.");
            }

            // Gửi dữ liệu sản phẩm về JSP
            request.setAttribute("product", product);
            request.getRequestDispatcher("pages/productDetails.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            System.out.println("❌ Invalid product ID format.");
            request.setAttribute("errorMessage", "ID sản phẩm không hợp lệ.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    } else {
        System.out.println("❌ No product ID provided.");
        request.setAttribute("errorMessage", "Không tìm thấy sản phẩm.");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
}

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
