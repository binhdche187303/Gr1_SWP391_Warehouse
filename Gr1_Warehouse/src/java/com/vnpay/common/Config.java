package com.vnpay.common;

import jakarta.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

public class Config {

    public static String vnp_PayUrl = "http://sandbox.vnpayment.vn/paymentv2/vpcpay.html";

    public static String getReturnUrl(String orderId) {
        return "http://localhost:8080/Gr1_Warehouse/customerOrderDetail?orderId=" + orderId;
    }
    public static String vnp_TmnCode = "J13JLMYF";
    public static String vnp_HashSecret = "XNZHMQCCYLBNOSUUVUBWVVLALPMEIJXF";
    public static String vnp_apiUrl = "http://sandbox.vnpayment.vn/merchant_webapi/merchant.html";

    public static String createQueryUrl(Map<String, String> vnp_Params, String hashSecret) {
        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        
        for (String fieldName : fieldNames) {
            String fieldValue = vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                try {
                    query.append(URLEncoder.encode(fieldName, StandardCharsets.UTF_8.toString()))
                         .append("=")
                         .append(URLEncoder.encode(fieldValue, StandardCharsets.UTF_8.toString()))
                         .append("&");
                    hashData.append(fieldName).append("=").append(fieldValue).append("&");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }
        }
        String queryUrl = query.toString().substring(0, query.length() - 1);
        String secureHash = hmacSHA512(hashSecret, hashData.toString().substring(0, hashData.length() - 1));
        return queryUrl + "&vnp_SecureHash=" + secureHash;
    }

    public static String hmacSHA512(String key, String data) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            byte[] hash = md.digest((key + data).getBytes(StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
