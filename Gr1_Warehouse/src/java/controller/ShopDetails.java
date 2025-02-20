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
protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    ProductDAO productDAO = new ProductDAO();
    String productIdParam = request.getParameter("productId");

    if (productIdParam != null) {
        try {
            int productId = Integer.parseInt(productIdParam);
            Products product = productDAO.getDetails(productId);
            System.out.println("Product ID: " + product.getProductId());
            System.out.println("Product Name: " + product.getProductName());
            System.out.println("Origin: " + product.getOrigin());
            System.out.println("Description: " + product.getDescription());

            // In danh mục
            if (product.getCate() != null) {
                System.out.println("Category: " + product.getCate().getCategory_name());
            }
            
            // In thương hiệu
            if (product.getBrand() != null) {
                System.out.println("Brand: " + product.getBrand().getBrand_name());
            }

            // In các biến thể sản phẩm
            System.out.println("\nProduct Variants:");
            for (ProductVariants variant : product.getVariants()) {
                System.out.println("- Variant ID: " + variant.getVariantId());
                System.out.println("  Size: " + variant.getSize().getSize_name());
                System.out.println("  Price: " + variant.getPrice());
                System.out.println("  SKU: " + variant.getSku());
                System.out.println("  Stock: " + variant.getStock());
            }

            // In hình ảnh sản phẩm
            System.out.println("\nProduct Images:");
            for (Images image : product.getImages()) {
                System.out.println("- Image URL: " + image.getImage_url());
            }
            request.setAttribute("product", product);
            request.getRequestDispatcher("pages/productDetails.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            System.out.println("Invalid product ID format.");
            request.setAttribute("errorMessage", "ID sản phẩm không hợp lệ.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    } else {
        System.out.println("No product ID provided.");
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
