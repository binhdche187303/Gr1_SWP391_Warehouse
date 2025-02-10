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
            // Lấy dữ liệu từ form
            String discountCode = request.getParameter("discount_code");
            String discountPercentageStr = request.getParameter("discount_percentage");
            String startDateStr = request.getParameter("start_date");
            String endDateStr = request.getParameter("end_date");
            String maxUsesStr = request.getParameter("max_uses");
            String status = request.getParameter("status");

            // Gán lại dữ liệu để hiển thị nếu có lỗi
            request.setAttribute("discount_code", discountCode);
            request.setAttribute("discount_percentage", discountPercentageStr);
            request.setAttribute("start_date", startDateStr);
            request.setAttribute("end_date", endDateStr);
            request.setAttribute("max_uses", maxUsesStr);
            request.setAttribute("status", status);

            // Kiểm tra mã giảm giá đã tồn tại chưa
            DiscountDAO discountDAO = new DiscountDAO();
            if (discountDAO.isDiscountCodeExists(discountCode)) {
                request.setAttribute("message", "Discount code already exists! Please use another code.");
                request.getRequestDispatcher("/dashboard/create-coupon.jsp").forward(request, response);
                return;
            }

            // Chuyển đổi dữ liệu
            double discountPercentage = Double.parseDouble(discountPercentageStr);
            LocalDateTime startDate = (startDateStr != null && !startDateStr.isEmpty())
                    ? LocalDateTime.parse(startDateStr + "T00:00:00")
                    : LocalDateTime.now();
            LocalDateTime endDate = (endDateStr != null && !endDateStr.isEmpty())
                    ? LocalDateTime.parse(endDateStr + "T00:00:00")
                    : null;
            Integer maxUses = (maxUsesStr != null && !maxUsesStr.isEmpty())
                    ? Integer.parseInt(maxUsesStr)
                    : null;

            // Kiểm tra ngày start và end
            if (endDate != null && startDate.isAfter(endDate)) {
                request.setAttribute("message", "Start date cannot be after end date.");
                request.getRequestDispatcher("/dashboard/create-coupon.jsp").forward(request, response);
                return;
            }

            // Tạo mới mã giảm giá
            Discounts newDiscount = discountDAO.createDiscount(
                    discountCode, discountPercentage, startDate, endDate, maxUses, LocalDateTime.now(), status, 1
            );

            if (newDiscount != null) {
                response.sendRedirect("/Gr1_Warehouse/couponlist");
            } else {
                request.setAttribute("message", "Failed to create discount.");
                request.getRequestDispatcher("/dashboard/create-coupon.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
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
