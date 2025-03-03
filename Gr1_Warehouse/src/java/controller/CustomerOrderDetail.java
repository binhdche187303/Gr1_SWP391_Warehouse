/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDAO;
import dao.OrderServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;
import model.OrderDetailDTO;
import model.OrderPayment;
import model.User;

/**
 *
 * @author Dell
 */
public class CustomerOrderDetail extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO(); // Đảm bảo bạn có OrderDAO để truy vấn DB

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
            out.println("<title>Servlet CustomerOrderDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerOrderDetail at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        int orderId;
        try {
            orderId = Integer.parseInt(request.getParameter("orderId"));
        } catch (NumberFormatException e) {
            response.sendRedirect("pages/cus_detail.jsp");
            return;
        }

        List<OrderDetailDTO> orders = orderDAO.getOrdersByCustomerId(user.getUserId());

        OrderDetailDTO selectedOrder = null;
        for (OrderDetailDTO order : orders) {
            if (order.getOrder().getOrderId() == orderId) {
                selectedOrder = order;
                break;
            }
        }

        // Nếu không tìm thấy đơn hàng, chuyển hướng
        if (selectedOrder == null) {
            response.sendRedirect("pages/cus_detail.jsp");
            return;
        }

        // 🟢 Lấy thông tin thanh toán từ OrderPayments
        OrderServiceDAO orderServiceDAO = new OrderServiceDAO();
        OrderPayment orderPayment = orderServiceDAO.getOrderPaymentByOrderId(orderId);

        // 🟢 Tính số tiền còn lại sau khi đặt cọc
        BigDecimal remainingAmount = BigDecimal.ZERO;
        if (orderPayment != null) {
            BigDecimal totalAmount = selectedOrder.getOrder().getTotalAmount();
            BigDecimal depositAmount = orderPayment.getDepositAmount() != null ? orderPayment.getDepositAmount() : BigDecimal.ZERO;
            remainingAmount = totalAmount.subtract(depositAmount);
        }

        // 🟢 Đặt thông tin vào request để gửi đến JSP
        request.setAttribute("orderDetail", selectedOrder);
        request.setAttribute("orderPayment", orderPayment);
        request.setAttribute("remainingAmount", remainingAmount);
        request.getRequestDispatcher("pages/cus_detail.jsp").forward(request, response);
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
        processRequest(request, response);
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
