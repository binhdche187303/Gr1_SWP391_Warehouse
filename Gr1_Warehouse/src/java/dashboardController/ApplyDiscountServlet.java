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

            List<OrderDiscount> orderDiscounts = orderDiscountDAO.getDiscountsByOrderId(orderId);

            request.setAttribute("orderDiscounts", orderDiscounts);
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
        PrintWriter out = response.getWriter();

        try {
            System.out.println("? Bắt đầu ApplyDiscountServlet doPost");

            // Debug toàn bộ request parameters
            System.out.println("? Debug request parameters:");
            Enumeration<String> parameterNames = request.getParameterNames();
            while (parameterNames.hasMoreElements()) {
                String paramName = parameterNames.nextElement();
                System.out.println("   ? " + paramName + " = '" + request.getParameter(paramName) + "'");
            }

            // Lấy order_id từ request
            String orderIdParam = request.getParameter("order_id");
            if (orderIdParam == null || orderIdParam.trim().isEmpty()) {
                System.out.println("? Lỗi: order_id bị null hoặc rỗng");
                out.write("{\"error\": \"order_id không hợp lệ!\"}");
                return;
            }

            int orderId;
            try {
                orderId = Integer.parseInt(orderIdParam.trim());
            } catch (NumberFormatException e) {
                System.out.println("? Lỗi: order_id không hợp lệ - " + e.getMessage());
                out.write("{\"error\": \"Định dạng order_id không hợp lệ!\"}");
                return;
            }

            System.out.println("? order_id (converted): " + orderId);

            // Lấy mã giảm giá từ request
            String discountCode = request.getParameter("discount_code");
            if (discountCode == null || discountCode.trim().isEmpty()) {
                System.out.println("? Lỗi: Mã giảm giá bị null hoặc rỗng");
                out.write("{\"error\": \"Vui lòng nhập mã giảm giá!\"}");
                return;
            }
            discountCode = discountCode.trim();
            System.out.println("? discountCode: " + discountCode);

            // Kiểm tra mã giảm giá có tồn tại và đang active
            Discounts discount = orderDiscountDAO.getDiscountByCode(discountCode);
            if (discount == null) {
                System.out.println("?? Mã giảm giá không tồn tại!");
                out.write("{\"error\": \"Mã giảm giá không hợp lệ!\"}");
                return;
            }

            // Kiểm tra trạng thái của mã giảm giá, chỉ áp dụng nếu nó đang active
            if (!discount.getStatus().equals("Active")) {
                System.out.println("?? Mã giảm giá không active!");
                out.write("{\"error\": \"Mã giảm giá không active!\"}");
                return;
            }

            // Kiểm tra mã giảm giá đã được áp dụng chưa
            boolean isApplied = orderDiscountDAO.isDiscountApplied(orderId, discount.getDiscount_id());
            if (isApplied) {
                System.out.println("?? Mã giảm giá đã được áp dụng trước đó!");
                out.write("{\"error\": \"Mã giảm giá đã áp dụng!\"}");
                return;
            }

            // Kiểm tra mỗi đơn hàng chỉ được giảm giá một lần
            OrderDiscount existingOrderDiscount = orderDiscountDAO.getExistingOrderDiscount(orderId);
            if (existingOrderDiscount != null) {
                System.out.println("?? Mỗi đơn hàng chỉ được giảm giá một lần!");
                out.write("{\"error\": \"Mỗi đơn hàng chỉ được giảm giá một lần!\"}");
                return;
            }

            // Lấy tổng tiền trước giảm giá
            BigDecimal totalBeforeDiscount = orderDiscountDAO.getTotalAmount(orderId);
            if (totalBeforeDiscount.compareTo(BigDecimal.ZERO) <= 0) {
                System.out.println("?? Tổng tiền đơn hàng không hợp lệ!");
                out.write("{\"error\": \"Tổng tiền đơn hàng không hợp lệ!\"}");
                return;
            }

            // Tính số tiền giảm giá
            BigDecimal discountPercentage = new BigDecimal(discount.getDiscount_percentage()).divide(new BigDecimal("100"));
            BigDecimal appliedAmount = totalBeforeDiscount.multiply(discountPercentage);
            System.out.println("? appliedAmount: " + appliedAmount);

            // Tạo bản ghi giảm giá trong đơn hàng
            OrderDiscount orderDiscount = new OrderDiscount();
            orderDiscount.setOrderId(orderId);
            orderDiscount.setDiscountId(discount.getDiscount_id());
            orderDiscount.setAppliedDiscountPercentage(discount.getDiscount_percentage());
            orderDiscount.setAppliedAmount(appliedAmount);
            orderDiscount.setAppliedDate(LocalDateTime.now());

            orderDiscountDAO.insertOrderDiscount(orderDiscount);
            System.out.println("? Discount đã được lưu vào database");

            // Cập nhật tổng tiền sau giảm giá
            orderDiscountDAO.updateTotalAfterDiscount(orderId);
            BigDecimal newTotal = orderDiscountDAO.getTotalAmount(orderId); // Thay thế double bằng BigDecimal
            System.out.println("? Cập nhật tổng tiền sau giảm giá thành công: " + newTotal);

            // Thành công, trả về tổng tiền mới
            out.write("{\"success\": \"Áp dụng mã giảm giá thành công! Tổng tiền mới: " + newTotal + "\"}");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("? Lỗi xảy ra: " + e.getMessage());
            out.write("{\"error\": \"Có lỗi xảy ra khi áp dụng mã giảm giá!\"}");
        } finally {
            out.flush();
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
