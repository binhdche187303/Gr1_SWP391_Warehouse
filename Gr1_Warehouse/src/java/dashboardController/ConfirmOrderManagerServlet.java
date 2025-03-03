/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
public class ConfirmOrderManagerServlet extends HttpServlet {

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
            out.println("<title>Servlet ConfirmOrderManagerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmOrderManagerServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        System.out.println("🛠️ [DEBUG] doPost() được gọi!");

        try {
            String orderIdStr = request.getParameter("orderId");
            if (orderIdStr == null || orderIdStr.trim().isEmpty()) {
                out.write("{\"status\": \"error\", \"message\": \"Thiếu mã đơn hàng!\"}");
                return;
            }

            int orderId;
            try {
                orderId = Integer.parseInt(orderIdStr);
            } catch (NumberFormatException e) {
                out.write("{\"status\": \"error\", \"message\": \"Mã đơn hàng không hợp lệ!\"}");
                return;
            }

            System.out.println("🛠️ [DEBUG] Đang xác nhận đơn hàng ID: " + orderId);

            OrderServiceDAO orderService = new OrderServiceDAO();
            boolean isUpdated = orderService.confirmOrder(orderId);

            if (isUpdated) {
                System.out.println("✅ Xác nhận đơn hàng thành công!");
                out.write("{\"status\": \"success\", \"message\": \"Đơn hàng đã được xác nhận!\"}");
            } else {
                System.out.println("❌ Không thể xác nhận đơn hàng!");
                out.write("{\"status\": \"error\", \"message\": \"Không thể xác nhận đơn hàng.\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.write("{\"status\": \"error\", \"message\": \"Đã xảy ra lỗi: " + e.getMessage() + "\"}");
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
