/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CartDAO;
import dao.OrderDAO;
import dao.SizeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.OrderDetail;
import model.User;

/**
 *
 * @author HP
 */
public class ConfirmOrderController extends HttpServlet {

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
            out.println("<title>Servlet ConfirmOrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmOrderController at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        int userId = user.getUserId();
        List<Cart> carts = (List<Cart>) session.getAttribute("cart_to_checkout");
        String paymentMethod = request.getParameter("paymentMethod");

        // Lấy thông tin từ form checkout
        String customerName = request.getParameter("customerName").trim();
        String phoneNumber = request.getParameter("phoneNumber").trim();
        String email = request.getParameter("email").trim();
        String shippingAddress = request.getParameter("shippingAddress").trim();
        String notes = request.getParameter("notes").trim();

        // Biến lưu lỗi
        List<String> errors = new ArrayList<>();

        // Kiểm tra dữ liệu nhập
        if (customerName.isEmpty() || customerName.length() < 3) {
            errors.add("Tên khách hàng phải có ít nhất 3 ký tự.");
        }

        if (!phoneNumber.matches("^0\\d{9,11}$")) {
            errors.add("Số điện thoại phải bắt đầu bằng số 0 và có từ 10 đến 12 chữ số.");
        }

        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            errors.add("Email không hợp lệ.");
        }

        if (shippingAddress.isEmpty() || shippingAddress.length() < 10) {
            errors.add("Địa chỉ giao hàng phải có ít nhất 10 ký tự.");
        }

        if (notes.length() > 200) {
            errors.add("Ghi chú không được vượt quá 200 ký tự.");
        }

        if (!paymentMethod.equals("cod") && !paymentMethod.equals("online")) {
            errors.add("Phương thức thanh toán không hợp lệ.");
        }

        // Nếu có lỗi, gửi lại form với thông báo lỗi
        if (!errors.isEmpty()) {
            SizeDAO sizeDAO = new SizeDAO();
            if (user == null) {
                response.sendRedirect("login");
                return;
            }
            request.setAttribute("user", user);
            List<Cart> cartItems = (List<Cart>) session.getAttribute("cart_to_checkout");
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/pages/checkout.jsp").forward(request, response);
            return;
        }

        if (carts == null || carts.isEmpty()) {
            response.sendRedirect("/pages/orderStatus.jsp?status=emptyCart");
            return;
        }

        List<OrderDetail> orderDetails = new ArrayList<>();
        BigDecimal totalAmount = BigDecimal.ZERO;

        for (Cart cart : carts) {
            BigDecimal itemTotal = BigDecimal.valueOf(cart.getPrice()).multiply(BigDecimal.valueOf(cart.getQuantity()));
            totalAmount = totalAmount.add(itemTotal);

            orderDetails.add(new OrderDetail(0, 0, cart.getProductId(), cart.getSizeId(), cart.getQuantity(), BigDecimal.valueOf(cart.getPrice())));
        }

        OrderDAO orderDAO = new OrderDAO();
        boolean success = orderDAO.processCheckoutWithPayment(userId, customerName, phoneNumber, email, shippingAddress, notes, orderDetails, totalAmount, paymentMethod);

        if (success) {

    // Xóa các sản phẩm vừa đặt hàng khỏi giỏ hàng trong database
    CartDAO cartDAO = new CartDAO();
    boolean cartCleared = cartDAO.removeCheckedOutItems(userId, carts);
    // Xóa giỏ hàng thanh toán khỏi session
    session.removeAttribute("cart_to_checkout");

    response.sendRedirect(request.getContextPath() + "/pages/orderStatus.jsp?status=success");
} else {
    response.sendRedirect(request.getContextPath() + "/pages/orderStatus.jsp?status=error");
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