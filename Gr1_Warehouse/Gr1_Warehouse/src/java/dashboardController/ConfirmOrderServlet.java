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
public class ConfirmOrderServlet extends HttpServlet {

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
            out.println("<title>Servlet ConfirmOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmOrderServlet at " + request.getContextPath() + "</h1>");
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
        // Lấy orderId từ yêu cầu
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        // Gọi phương thức xác nhận đơn hàng
        OrderServiceDAO orderService = new OrderServiceDAO();
        boolean isConfirmed = orderService.confirmOrder(orderId);

        // Thiết lập Content-Type là application/json
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Trả về JSON
        if (isConfirmed) {
            try {
                String notificationMessage = orderService.sendDepositNotification(orderId);
                // Trả về thông báo dưới dạng JSON, không cần trả về QR code hay link MoMo
                response.getWriter().write("{\"status\": \"success\", \"message\": \"" + notificationMessage + "\"}");
            } catch (Exception e) {
                // Log lỗi và trả về thông báo lỗi chi tiết
                e.printStackTrace();  // Bạn có thể thay bằng log hệ thống nếu cần
                response.getWriter().write("{\"status\": \"error\", \"message\": \"Lỗi khi gửi thông báo. Vui lòng thử lại sau.\"}");
            }
        } else {
            response.getWriter().write("{\"status\": \"error\", \"message\": \"Không thể xác nhận đơn hàng.\"}");
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
