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
            double discountPercentage = Double.parseDouble(request.getParameter("discount_percentage"));
            String startDateStr = request.getParameter("start_date");
            String endDateStr = request.getParameter("end_date");
            String maxUsesStr = request.getParameter("max_uses");
            String status = request.getParameter("status");

            // Chuyển đổi dữ liệu
            LocalDateTime startDate = (startDateStr != null && !startDateStr.isEmpty())
                    ? LocalDateTime.parse(startDateStr + "T00:00:00")
                    : LocalDateTime.now(); // Nếu không nhập, dùng ngày hiện tại

            LocalDateTime endDate = (endDateStr != null && !endDateStr.isEmpty())
                    ? LocalDateTime.parse(endDateStr + "T00:00:00")
                    : null;

            // Kiểm tra ngày start và end
            if (endDate != null && startDate.isAfter(endDate)) {
                request.setAttribute("message", "Start date cannot be after end date.");
                request.getRequestDispatcher("/dashboard/create-coupon.jsp").forward(request, response);
                return;
            }

            Integer maxUses = (maxUsesStr != null && !maxUsesStr.isEmpty())
                    ? Integer.parseInt(maxUsesStr)
                    : null;

            // Gọi DAO để tạo mới mã giảm giá
            DiscountDAO discountDAO = new DiscountDAO();
            
                    // ? Kiểm tra mã giảm giá đã tồn tại chưa
        if (discountDAO.isDiscountCodeExists(discountCode)) {
            request.setAttribute("message", "Discount code already exists! Please use another code.");
            request.getRequestDispatcher("/dashboard/create-coupon.jsp").forward(request, response);
            return;
        }
            Discounts newDiscount = discountDAO.createDiscount(
                    discountCode, discountPercentage, startDate, endDate, maxUses, LocalDateTime.now(), status, 1 // userId giả định là 1
            );

            if (newDiscount != null) {
                response.sendRedirect("/Gr1_Warehouse/couponlist");

            } else {
                System.out.println("Failed to create discount. Code may already exist.");
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
