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
import java.time.LocalDateTime;
import java.util.List;
import model.DiscountProduct;

/**
 *
 * @author admin
 */
public class CreateCouponProduct extends HttpServlet {

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
            out.println("<title>Servlet CreateCouponProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateCouponProduct at " + request.getContextPath() + "</h1>");
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
            request.getRequestDispatcher("/dashboard/create-coupon-product.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        DiscountProductDAO dpd = new DiscountProductDAO();
        String product_id_raw = request.getParameter("product_id");
        String min_quantity_raw = request.getParameter("min_quantity");
        String discount_percentage_raw = request.getParameter("discount_percentage");
        String status = request.getParameter("status");

        // Lưu các giá trị vào request để giữ lại khi có lỗi
        request.setAttribute("product_id", product_id_raw);
        request.setAttribute("min_quantity", min_quantity_raw);
        request.setAttribute("discount_percentage", discount_percentage_raw);
        request.setAttribute("status", status);

        int product_id = Integer.parseInt(product_id_raw);
        List<DiscountProduct> listDiscountProduct = dpd.getAllDiscountsProductById(product_id);
        String product_name = listDiscountProduct.get(0).getProduct().getProductName();
        request.setAttribute("product_id", product_id);
        request.setAttribute("product_name", product_name);
        request.setAttribute("listDiscountProduct", listDiscountProduct);

        try {
            // Validate và parse các giá trị
            int min_quantity = Integer.parseInt(min_quantity_raw);
            double discount_percentage = Double.parseDouble(discount_percentage_raw);

            // Validate giá trị
            if (min_quantity < 0) {
                request.setAttribute("error", "Số lượng tối thiểu không được âm");
                request.getRequestDispatcher("createcouponproduct.jsp").forward(request, response);
                return;
            }

            if (discount_percentage <= 0 || discount_percentage >= 100) {
                request.setAttribute("error", "Phần trăm giảm giá phải từ 0.1 đến 99.9");
                request.getRequestDispatcher("createcouponproduct.jsp").forward(request, response);
                return;
            }

            // Tạo discount mới
            String result = dpd.createDiscountProduct(
                    product_id,
                    discount_percentage,
                    min_quantity,
                    LocalDateTime.now(),
                    status
            );

            // Xử lý kết quả
            if (result.startsWith("Tạo mức giảm giá thành công")) {
                // Thành công - redirect để tránh việc gửi lại form khi refresh
                response.sendRedirect("discountproductdetail?product_id=" + product_id);
            } else {
                // Có lỗi - forward để hiển thị lỗi
                request.setAttribute("error", result);
                request.getRequestDispatcher("/dashboard/create-coupon-product.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            // Lỗi parse số
            request.setAttribute("error", "Dữ liệu không hợp lệ. Vui lòng kiểm tra lại");
            request.getRequestDispatcher("/dashboard/create-coupon-product.jsp").forward(request, response);

        } catch (ServletException | IOException | SQLException e) {
            // Các lỗi khác
            request.setAttribute("error", "Đã xảy ra lỗi: " + e.getMessage());
            request.getRequestDispatcher("/dashboard/create-coupon-product.jsp").forward(request, response);
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