/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dashboardController;

import dao.DiscountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;
import model.Discounts;

/**
 *
 * @author admin
 */
@WebServlet(name = "CreateCoupon", urlPatterns = {"/createcoupon"})
public class CreateCoupon extends HttpServlet {

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
            out.println("<title>Servlet CreateCoupon</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateCoupon at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/dashboard/create-coupon.jsp").forward(request, response);
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
        try {
            // Get form data
            String discountCode = request.getParameter("discount_code");
            String discountPercentageStr = request.getParameter("discount_percentage");
            String minQuantityStr = request.getParameter("min_quantity");
            String minOrderValueStr = request.getParameter("min_order_value");
            String startDateStr = request.getParameter("start_date");
            String endDateStr = request.getParameter("end_date");
            String maxUsesStr = request.getParameter("max_uses");
            String status = request.getParameter("status");

            // Preserve form data for redisplay if needed
            request.setAttribute("discount_code", discountCode);
            request.setAttribute("discount_percentage", discountPercentageStr);
            request.setAttribute("min_quantity", minQuantityStr);
            request.setAttribute("min_order_value", minOrderValueStr);
            request.setAttribute("start_date", startDateStr);
            request.setAttribute("end_date", endDateStr);
            request.setAttribute("max_uses", maxUsesStr);
            request.setAttribute("status", status);

            // Validate required fields
            if (discountCode == null || discountCode.trim().isEmpty()
                    || discountPercentageStr == null || discountPercentageStr.trim().isEmpty()
                    || startDateStr == null || startDateStr.trim().isEmpty()) {
                request.setAttribute("message", "Required fields cannot be empty.");
                request.getRequestDispatcher("/dashboard/create-coupon.jsp").forward(request, response);
                return;
            }

            // Check if discount code exists
            DiscountDAO discountDAO = new DiscountDAO();
            if (discountDAO.isDiscountCodeExists(discountCode)) {
                request.setAttribute("message", "Mã giảm giá đã tồn tại! Vui lòng tạo mã khác.");
                request.getRequestDispatcher("/dashboard/create-coupon.jsp").forward(request, response);
                return;
            }

            // Parse and validate numeric values
            double discountPercentage = Double.parseDouble(discountPercentageStr);
            Integer minQuantity = (minQuantityStr != null && !minQuantityStr.trim().isEmpty())
                    ? Integer.parseInt(minQuantityStr) : null;
            Integer minOrderValue = (minOrderValueStr != null && !minOrderValueStr.trim().isEmpty())
                    ? Integer.parseInt(minOrderValueStr) : null;
            Integer maxUses = (maxUsesStr != null && !maxUsesStr.trim().isEmpty())
                    ? Integer.parseInt(maxUsesStr) : null;

            // Validate discount percentage range
            if (discountPercentage <= 0 || discountPercentage >= 100) {
                request.setAttribute("message", "% giảm giá phải nằm trong khoảng từ 0 đến 100.");
                request.getRequestDispatcher("/dashboard/create-coupon.jsp").forward(request, response);
                return;
            }

            // Parse dates
            LocalDateTime startDate = LocalDateTime.parse(startDateStr + "T00:00:00");
            LocalDateTime endDate = (endDateStr != null && !endDateStr.trim().isEmpty())
                    ? LocalDateTime.parse(endDateStr + "T00:00:00")
                    : null;

            // Validate date range
            if (endDate != null && startDate.isAfter(endDate)) {
                request.setAttribute("message", "Ngày bắt đầu không được sau ngày kết thúc.");
                request.getRequestDispatcher("/dashboard/create-coupon.jsp").forward(request, response);
                return;
            }

            // Create new discount
            Discounts newDiscount = discountDAO.createDiscount(
                    discountCode,
                    discountPercentage,
                    minQuantity,
                    minOrderValue,
                    startDate,
                    endDate,
                    maxUses,
                    LocalDateTime.now(),
                    status,
                    1 // userId
            );

            if (newDiscount != null) {
                response.sendRedirect("/Gr1_Warehouse/couponlist");
            } else {
                request.setAttribute("message", "Failed to create discount.");
                request.getRequestDispatcher("/dashboard/create-coupon.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid number format. Please check your input.");
            request.getRequestDispatcher("/dashboard/create-coupon.jsp").forward(request, response);
        } catch (DateTimeParseException e) {
            request.setAttribute("message", "Invalid date format. Please use the correct date format.");
            request.getRequestDispatcher("/dashboard/create-coupon.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("/dashboard/create-coupon.jsp").forward(request, response);
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
