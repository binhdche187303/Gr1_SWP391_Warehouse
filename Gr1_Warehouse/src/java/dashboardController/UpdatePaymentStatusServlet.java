/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dashboardController;

import dao.OrderServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
public class UpdatePaymentStatusServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdatePaymentStatusServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdatePaymentStatusServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String status = request.getParameter("status");

        OrderServiceDAO orderService = new OrderServiceDAO();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Lấy trạng thái hiện tại của đơn hàng
        String currentStatus = orderService.getOrderStatus(orderId);

        // Kiểm tra nếu trạng thái thanh toán đã là "Thanh toán 50%"
        if ("Thanh toán 50%".equals(currentStatus)) {
            response.getWriter().write("{\"status\": \"error\", \"message\": \"Đơn hàng đã thanh toán 50% rồi.\"}");
            return; // Dừng xử lý nếu trạng thái đã là "Thanh toán 50%"
        }

        if ("Thanh toán 50%".equals(status)) {
            // Cập nhật trạng thái và lưu đặt cọc vào bảng OrderPayments
            boolean isUpdated = orderService.updatePaymentStatus(orderId, status);
            boolean isInserted = orderService.insertOrderDeposit(orderId); // Thêm đặt cọc vào bảng OrderPayments

            if (isUpdated && isInserted) {
                response.getWriter().write("{\"status\": \"success\", \"message\": \"Cập nhật trạng thái và lưu đặt cọc thành công!\"}");
            } else {
                response.getWriter().write("{\"status\": \"error\", \"message\": \"Có lỗi khi cập nhật trạng thái hoặc lưu đặt cọc.\"}");
            }
        } else {
            response.getWriter().write("{\"status\": \"error\", \"message\": \"Trạng thái thanh toán không hợp lệ.\"}");
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
