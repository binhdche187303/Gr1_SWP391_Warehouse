package com.vnpay.common;

import com.google.gson.Gson;
import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.OrderDetailDTO;
import model.User;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Logger;

public class ajaxServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(ajaxServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Tạo đối tượng Gson để gửi phản hồi JSON
        Gson gson = new Gson();
        Map<String, Object> responseMap = new HashMap<>();

        // Lấy orderId từ request
        String orderIdParam = req.getParameter("orderId");
        logger.info("Received orderId: " + orderIdParam);

        // Kiểm tra orderId
        if (orderIdParam == null || orderIdParam.isEmpty()) {
            responseMap.put("success", false);
            responseMap.put("message", "Error: Order ID not found!");
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            logger.warning("Order ID not found in request.");
            resp.getWriter().write(gson.toJson(responseMap));
            return;
        }

        // Kiểm tra và xử lý khi orderId không phải là số nguyên
        int orderId;
        try {
            orderId = Integer.parseInt(orderIdParam);
        } catch (NumberFormatException e) {
            responseMap.put("success", false);
            responseMap.put("message", "Error: Invalid Order ID format.");
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            logger.warning("Invalid Order ID format: " + orderIdParam);
            resp.getWriter().write(gson.toJson(responseMap));
            return;
        }

        logger.info("Parsed orderId: " + orderId);

        // Lấy chi tiết đơn hàng từ cơ sở dữ liệu
        OrderDAO orderDAO = new OrderDAO();
        OrderDetailDTO orderDetailDTO = orderDAO.getOrderDetails(orderId);
        if (orderDetailDTO == null || orderDetailDTO.getOrder() == null) {
            responseMap.put("success", false);
            responseMap.put("message", "Error: Order not found!");
            resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
            logger.warning("Order not found in database. OrderId: " + orderId);
            resp.getWriter().write(gson.toJson(responseMap));
            return;
        }

        // Tính số tiền đặt cọc 50%
        BigDecimal totalAmount = orderDetailDTO.getOrder().getTotalAmount();
        BigDecimal depositAmount = totalAmount.multiply(BigDecimal.valueOf(0.5)).setScale(0, RoundingMode.HALF_UP);
        logger.info("Deposit Amount: " + depositAmount);

        // Kiểm tra người dùng từ session
        HttpSession session = req.getSession();
        User acc = (User) session.getAttribute("acc");
        if (acc == null) {
            responseMap.put("success", false);
            responseMap.put("message", "User not logged in. Please log in first.");
            resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            logger.warning("User not logged in.");
            resp.getWriter().write(gson.toJson(responseMap));
            return;
        }

        // Các thông tin thanh toán cho VNPAY
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String vnp_OrderInfo = req.getParameter("vnp_OrderInfo");
        String vnp_OrderType = req.getParameter("vnp_OrderType");

        // Kiểm tra và xử lý khi các giá trị này là null
        if (vnp_OrderInfo == null || vnp_OrderInfo.isEmpty()) {
            vnp_OrderInfo = "Thông tin đơn hàng mặc định"; // Giá trị mặc định
        }
        if (vnp_OrderType == null || vnp_OrderType.isEmpty()) {
            vnp_OrderType = "Mặc định"; // Giá trị mặc định
        }

        try {
            // Mã hóa thông tin để tránh lỗi ký tự đặc biệt
            vnp_OrderInfo = URLEncoder.encode(vnp_OrderInfo, "UTF-8");
            vnp_OrderType = URLEncoder.encode(vnp_OrderType, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            logger.severe("Error encoding payment info: " + e.getMessage());
            responseMap.put("success", false);
            responseMap.put("message", "Error encoding payment info.");
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write(gson.toJson(responseMap));
            return;
        }

        String vnp_TxnRef = String.valueOf(orderId);
        String vnp_Amount = depositAmount.multiply(BigDecimal.valueOf(100)).toBigInteger().toString();
        String vnp_Currency = "VND";

        logger.info("Payment details: OrderInfo: " + vnp_OrderInfo + ", OrderType: " + vnp_OrderType
                + ", TxnRef: " + vnp_TxnRef + ", Amount: " + vnp_Amount);

        // Chuẩn bị thông tin thanh toán cho VNPAY
        String vnp_IpAddr = Config.getIpAddress(req);

        String vnp_TmnCode = Config.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", vnp_Amount);
        vnp_Params.put("vnp_CurrCode", "VND");
        String bankCode = req.getParameter("bankCode");
        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", "ordẻ");

        String locate = req.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
        resp.sendRedirect(paymentUrl);
    }
}