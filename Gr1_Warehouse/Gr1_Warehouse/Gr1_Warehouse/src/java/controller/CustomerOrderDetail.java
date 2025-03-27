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
import model.OrderDetailDTO;
import model.OrderPayment;
import model.Payment;
import model.User;

/**
 *
 * @author Dell
 */
public class CustomerOrderDetail extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO(); // Đảm bảo bạn có OrderDAO để truy vấn DB

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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

        // 🟢 Lấy chi tiết đơn hàng theo orderId
        OrderDetailDTO orderDetailDTO = orderDAO.getOrderDetailById(orderId);

        // Nếu không tìm thấy đơn hàng, chuyển hướng về trang chi tiết
        if (orderDetailDTO == null) {
            response.sendRedirect("pages/cus_detail.jsp");
            return;
        }

        // 🟢 Lấy thông tin thanh toán từ OrderPayments
        OrderServiceDAO orderServiceDAO = new OrderServiceDAO();
        OrderPayment orderPayment = orderServiceDAO.getOrderPaymentByOrderId(orderId);
        Payment payment = orderServiceDAO.getPaymentByOrderId(orderId); // Lấy từ Payment

        // 🟢 Tính số tiền còn lại sau khi đặt cọc
        BigDecimal remainingAmount = BigDecimal.ZERO;
        if (orderPayment != null) {
            BigDecimal totalAmount = orderDetailDTO.getOrder().getTotalAmount();
            BigDecimal depositAmount = orderPayment.getDepositAmount() != null ? orderPayment.getDepositAmount() : BigDecimal.ZERO;
            remainingAmount = totalAmount.subtract(depositAmount);
        }
        
        // Status từ bảng Payment thay vì PaymentOrder
        String paymentStatus = (payment != null) ? payment.getPaymentStatus() : "Chưa có trạng thái thanh toán";

        // 🟢 Đặt thông tin vào request để gửi đến JSP
        request.setAttribute("orderDetail", orderDetailDTO);
        request.setAttribute("orderPayment", orderPayment);
        request.setAttribute("remainingAmount", remainingAmount);
        request.setAttribute("paymentStatus", paymentStatus);

        // Chuyển tiếp đến trang JSP
        request.getRequestDispatcher("pages/cus_detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet để hiển thị chi tiết đơn hàng của khách hàng";
    }
}
