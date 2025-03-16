/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dashboardController;

import dao.DiscountDAO;
import dao.OrderDAO;
import dao.OrderDiscountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Enumeration;
import java.util.List;
import model.Discounts;
import model.OrderDiscount;

/**
 *
 * @author Dell
 */
public class ApplyDiscountServlet extends HttpServlet {

    OrderDiscountDAO orderDiscountDAO = new OrderDiscountDAO();

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
            out.println("<title>Servlet ApplyDiscountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApplyDiscountServlet at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(request.getParameter("order_id"));

//            List<OrderDiscount> orderDiscounts = orderDiscountDAO.getDiscountsByOrderId(orderId);
//
//            request.setAttribute("orderDiscounts", orderDiscounts);
            request.getRequestDispatcher("/manager/export_good.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manager/export_good.jsp?error=true");
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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {
            System.out.println("🛠️ [DEBUG] Bắt đầu ApplyDiscountServlet doPost");

            // Lấy order_id từ request
            String orderIdParam = request.getParameter("order_id");
            if (orderIdParam == null || orderIdParam.trim().isEmpty()) {
                out.write("{\"error\": \"order_id không hợp lệ!\"}");
                return;
            }

            int orderId;
            try {
                orderId = Integer.parseInt(orderIdParam.trim());
            } catch (NumberFormatException e) {
                out.write("{\"error\": \"Định dạng order_id không hợp lệ!\"}");
                return;
            }

            // Kiểm tra nếu đơn hàng đã có mã giảm giá
            if (orderDiscountDAO.isDiscountApplied(orderId)) {
                out.write("{\"error\": \"Đơn hàng đã áp dụng mã giảm giá trước đó!\"}");
                return;
            }

            // Lấy phần trăm giảm giá từ request và kiểm tra tính hợp lệ
            String discountPercentageParam = request.getParameter("discount_percentage");
            if (discountPercentageParam == null || discountPercentageParam.trim().isEmpty()) {
                out.write("{\"error\": \"Vui lòng nhập phần trăm giảm giá!\"}");
                return;
            }

            BigDecimal discountPercentage;
            try {
                discountPercentage = new BigDecimal(discountPercentageParam.trim());
                if (discountPercentage.compareTo(BigDecimal.ZERO) <= 0 || discountPercentage.compareTo(new BigDecimal("100")) > 0) {
                    out.write("{\"error\": \"Phần trăm giảm giá phải từ 0% đến 100%!\"}");
                    return;
                }
            } catch (NumberFormatException e) {
                out.write("{\"error\": \"Định dạng phần trăm giảm giá không hợp lệ!\"}");
                return;
            }

            System.out.println("🛠️ [DEBUG] order_id: " + orderId + ", discount_percentage: " + discountPercentage);

            // Lấy tổng tiền trước giảm giá
            BigDecimal totalBeforeDiscount = orderDiscountDAO.getTotalAmount(orderId);
            if (totalBeforeDiscount.compareTo(BigDecimal.ZERO) <= 0) {
                out.write("{\"error\": \"Tổng tiền đơn hàng không hợp lệ!\"}");
                return;
            }

            // Áp dụng quy tắc giảm giá theo giá trị đơn hàng
            BigDecimal appliedAmount = totalBeforeDiscount.multiply(discountPercentage.divide(new BigDecimal("100")));

// Kiểm tra quy tắc giảm giá theo giá trị đơn hàng
            if (totalBeforeDiscount.compareTo(new BigDecimal("10000000")) < 0) {  // Đơn hàng dưới 10 triệu
                // Kiểm tra phần trăm giảm giá, nếu vượt quá 5% thì yêu cầu nhập lại
                if (discountPercentage.compareTo(new BigDecimal("5")) > 0) {
                    out.write("{\"error\": \"Giảm giá tối đa cho đơn hàng dưới 10 triệu là 5%. Vui lòng nhập lại phần trăm giảm giá!\"}");
                    return;
                }
                discountPercentage = discountPercentage.min(new BigDecimal("5"));
            } else if (totalBeforeDiscount.compareTo(new BigDecimal("10000000")) >= 0 && totalBeforeDiscount.compareTo(new BigDecimal("50000000")) <= 0) {  // Đơn hàng từ 10-50 triệu
                // Kiểm tra phần trăm giảm giá, nếu vượt quá 15% thì yêu cầu nhập lại
                if (discountPercentage.compareTo(new BigDecimal("15")) > 0) {
                    out.write("{\"error\": \"Giảm giá tối đa cho đơn hàng từ 10-50 triệu là 15%. Vui lòng nhập lại phần trăm giảm giá!\"}");
                    return;
                }
                discountPercentage = discountPercentage.min(new BigDecimal("15"));
            } else if (totalBeforeDiscount.compareTo(new BigDecimal("50000000")) > 0) {  // Đơn hàng trên 50 triệu
                // Kiểm tra phần trăm giảm giá, nếu vượt quá 20% thì yêu cầu nhập lại
                if (discountPercentage.compareTo(new BigDecimal("20")) > 0) {
                    out.write("{\"error\": \"Giảm giá tối đa cho đơn hàng trên 50 triệu là 20%. Vui lòng nhập lại phần trăm giảm giá!\"}");
                    return;
                }
                discountPercentage = discountPercentage.min(new BigDecimal("20"));
            }

            // Tính lại số tiền giảm giá sau khi áp dụng giới hạn phần trăm
            appliedAmount = totalBeforeDiscount.multiply(discountPercentage.divide(new BigDecimal("100")));
            System.out.println("🛠️ [DEBUG] Số tiền giảm giá áp dụng: " + appliedAmount);

            // Kiểm tra số tiền giảm giá tối đa (Ví dụ: không vượt quá 5 triệu cho đơn hàng 100 triệu)
            if (totalBeforeDiscount.compareTo(new BigDecimal("100000000")) >= 0 && appliedAmount.compareTo(new BigDecimal("5000000")) > 0) {
                appliedAmount = new BigDecimal("5000000");
                System.out.println("🛠️ [DEBUG] Đơn hàng trên 100 triệu, giảm giá tối đa 5 triệu");
            }

            // Lưu thông tin giảm giá vào đơn hàng
            OrderDiscount orderDiscount = new OrderDiscount();
            orderDiscount.setOrderId(orderId);
            orderDiscount.setAppliedDiscountPercentage(discountPercentage.doubleValue());
            orderDiscount.setAppliedAmount(appliedAmount);
            orderDiscount.setAppliedDate(LocalDateTime.now());

            orderDiscountDAO.insertOrderDiscount(orderDiscount);
            System.out.println("✅ Discount đã được lưu vào database");

            // Cập nhật tổng tiền sau giảm giá
            orderDiscountDAO.updateTotalAfterDiscount(orderId);
            BigDecimal newTotal = orderDiscountDAO.getTotalAmount(orderId); // Thay thế double bằng BigDecimal
            System.out.println("✅ Cập nhật tổng tiền sau giảm giá thành công: " + newTotal);

            // Trả về tổng tiền mới sau khi giảm giá
            out.write("{\"success\": \"Áp dụng giảm giá thành công! Tổng tiền mới: " + newTotal + "\"}");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("❌ Lỗi xảy ra: " + e.getMessage());
            response.getWriter().write("{\"error\": \"Có lỗi xảy ra khi áp dụng giảm giá!\"}");
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
