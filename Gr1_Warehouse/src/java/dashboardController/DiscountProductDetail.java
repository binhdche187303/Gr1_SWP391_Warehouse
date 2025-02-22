/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dashboardController;

import dao.DiscountProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DiscountProduct;
import model.DiscountProductHistory;

/**
 *
 * @author admin
 */
public class DiscountProductDetail extends HttpServlet {

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
            out.println("<title>Servlet DiscountProductDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DiscountProductDetail at " + request.getContextPath() + "</h1>");
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
        DiscountProductDAO dpd = new DiscountProductDAO();
        String product_id_raw = request.getParameter("product_id");
        try {
            int product_id = Integer.parseInt(product_id_raw);
            List<DiscountProduct> listDiscountProduct = dpd.getAllDiscountsProductById(product_id);
            String product_name = listDiscountProduct.get(0).getProduct().getProductName();
            request.setAttribute("product_id", product_id);
            request.setAttribute("product_name", product_name);
            request.setAttribute("listDiscountProduct", listDiscountProduct);
            request.getRequestDispatcher("/dashboard/coupon-product-detail.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String productDiscountId_raw = request.getParameter("product_discount_id");
        DiscountProductDAO dpd = new DiscountProductDAO();
        String product_id_raw = request.getParameter("product_id");

        if ("view".equals(action)) {
            // Xử lý view history
            try {
                int product_id = Integer.parseInt(product_id_raw);
                List<DiscountProduct> listDiscountProduct = dpd.getAllDiscountsProductById(product_id);
                int product_discount_id = Integer.parseInt(productDiscountId_raw);
                String product_name = listDiscountProduct.get(0).getProduct().getProductName();
                request.setAttribute("product_name", product_name);
                request.setAttribute("listDiscountProduct", listDiscountProduct);

                List<DiscountProductHistory> listDiscountProductHistory = dpd.getAllDiscountsHistoryById(product_discount_id);
                request.setAttribute("listDiscountProductHistory", listDiscountProductHistory);
                request.getRequestDispatcher("/dashboard/coupon-product-detail.jsp").forward(request, response);
            } catch (ServletException | IOException | NumberFormatException e) {
                System.out.println(e);
            }
        } else if ("edit".equals(action)) {
            try {
                // Parse and validate input parameters
                int productDiscountId = Integer.parseInt(productDiscountId_raw);
                int product_id = Integer.parseInt(product_id_raw);
                double discountPercentage = Double.parseDouble(request.getParameter("discount_percentage"));
                int minQuantity = Integer.parseInt(request.getParameter("min_quantity"));
                String status = request.getParameter("status");

                // Update the discount product
                String result = dpd.updateDiscountProduct(productDiscountId, discountPercentage, minQuantity, status);

                if ("SUCCESS".equals(result)) {
                    request.setAttribute("message", "Cập nhật thành công");
                    request.setAttribute("messageType", "success");
                } else {
                    request.setAttribute("message", result);
                    request.setAttribute("messageType", "error");
                }

                // Fetch fresh data after the update
                List<DiscountProduct> listDiscountProduct = dpd.getAllDiscountsProductById(product_id);
                String product_name = listDiscountProduct.get(0).getProduct().getProductName();

                // Fetch updated history for the specific discount
                List<DiscountProductHistory> listDiscountProductHistory = dpd.getAllDiscountsHistoryById(productDiscountId);

                // Set fresh data to request attributes
                request.setAttribute("product_name", product_name);
                request.setAttribute("listDiscountProduct", listDiscountProduct);
                request.setAttribute("listDiscountProductHistory", listDiscountProductHistory);

                // Forward to JSP
                request.getRequestDispatcher("/dashboard/coupon-product-detail.jsp").forward(request, response);

            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid input format");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("/dashboard/coupon-product-detail.jsp").forward(request, response);
            } catch (SQLException e) {
                request.setAttribute("message", "Database error: " + e.getMessage());
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("/dashboard/coupon-product-detail.jsp").forward(request, response);
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
