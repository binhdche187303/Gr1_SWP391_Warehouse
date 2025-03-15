package com.vnpay.common;

import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * Handle the response from VNPAY.
 */
public class VnpayReturn extends HttpServlet {

    private final OrderDAO orderDAO = new OrderDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }

        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }
        // Generate the signature by concatenating all fields (except SecureHash and SecureHashType)
        String signValue = Config.hashAllFields(fields);

        // Compare generated signature with VNPAY's signature
        if (!signValue.equals(vnp_SecureHash)) {
            response.getWriter().println("Error: Invalid signature!");
            return;
        }

        // Extract orderId and update payment status
        int orderId = Integer.parseInt(request.getParameter("vnp_TxnRef"));
        String vnp_TransactionStatus = request.getParameter("vnp_TransactionStatus");
        boolean isSuccess = "00".equals(vnp_TransactionStatus);

        // Update order status in database
        String paymentStatus = isSuccess ? "Thanh toán 50%" : "Payment Failed";
        boolean updated = orderDAO.updatePaymentStatus(orderId, paymentStatus);
        boolean isInserted = orderDAO.insertOrderDeposit(orderId); // Thêm đặt cọc vào bảng OrderPayments

//        if (!updated) {
//            response.getWriter().println("Error: Could not update payment status!");
//            return;
//        }

        // Forward to order details page with success status
        request.setAttribute("isSuccess", isSuccess);
        response.sendRedirect("profileSetting");
//        request.getRequestDispatcher("pages/cus_detail.jsp").forward(request, response);//dieu huong ve noi ban can
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handle response from VNPAY";
    }
}
