/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDAO;
import dao.SaleDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.List;
import model.Order;
import model.OrderDetail;
import model.OrderDetailDTO;
import model.Payment;
import model.ProductVariants;
import model.Products;
import model.Sale;
import model.Sizes;
import model.User;

/**
 *
 * @author Dell
 */
public class OrderDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet OrderDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetailServlet at " + request.getContextPath() + "</h1>");
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
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8"); // Đảm bảo request nhận UTF-8

    // 🟢 Lấy orderId từ request
    int orderId;
    try {
        orderId = Integer.parseInt(request.getParameter("orderId"));
    } catch (NumberFormatException e) {
        System.out.println("🔴 Lỗi: orderId không hợp lệ!");
        response.getWriter().println("Lỗi: orderId không hợp lệ!");
        return;
    }

    // 🟢 Lấy thông tin đơn hàng từ DB
    OrderDAO orderDAO = new OrderDAO();
    OrderDetailDTO orderDetailDTO = orderDAO.getOrderDetails(orderId);

    if (orderDetailDTO == null || orderDetailDTO.getOrder() == null) {
        System.out.println("🔴 Lỗi: Không tìm thấy đơn hàng với ID " + orderId);
        response.getWriter().println("Lỗi: Không tìm thấy đơn hàng!");
        return;
    }

    // 🟢 Lấy danh sách dữ liệu từ DTO
    Order order = orderDetailDTO.getOrder();
    User user = orderDetailDTO.getUser();
    Payment payment = orderDetailDTO.getPayment();
    List<OrderDetail> orderDetails = orderDetailDTO.getOrderDetails();
    List<Products> products = orderDetailDTO.getProducts();
    List<ProductVariants> productVariants = orderDetailDTO.getProductVariants();
    List<Sizes> sizes = orderDetailDTO.getSizes(); // Sửa từ getSizeList() thành getSizes()

    // 🟢 In ra thông tin đơn hàng
    System.out.println("📌 Thông tin đơn hàng:");
    System.out.println("🔹 Order ID: " + order.getOrderId());
    System.out.println("🔹 Ngày đặt hàng: " + order.getOrderDate());
    System.out.println("🔹 Trạng thái đơn hàng: " + order.getStatus());
    System.out.println("🔹 Trạng thái thanh toán: " + (payment != null ? payment.getPaymentStatus() : "Không có thông tin"));

    // 🟢 Tính tổng tiền đơn hàng
    BigDecimal totalAmount = BigDecimal.ZERO;
    for (int i = 0; i < orderDetails.size(); i++) {
        OrderDetail detail = orderDetails.get(i);
        
        // Tìm sản phẩm dựa trên productId
        int productId = detail.getProductId();
        Products product = products.stream()
                .filter(p -> p.getProductId() == productId)
                .findFirst()
                .orElse(null);
        
        // Tìm biến thể và size dựa trên index
        ProductVariants variant = (i < productVariants.size()) ? productVariants.get(i) : null;
        Sizes size = (i < sizes.size()) ? sizes.get(i) : null;

        // Kiểm tra và lấy giá trị
        String productName = (product != null) ? product.getProductName() : "Không có thông tin";
        String sku = (variant != null) ? variant.getSku() : "Không có thông tin";
        String sizeName = (size != null) ? size.getSize_name() : "Không có thông tin";
        BigDecimal unitPrice = detail.getUnitPrice();
        BigDecimal quantity = BigDecimal.valueOf(detail.getQuantity());

        // Tính tổng tiền
        totalAmount = totalAmount.add(unitPrice.multiply(quantity));

        // 🟢 In thông tin sản phẩm - luôn hiển thị tên sản phẩm và size cho mỗi biến thể
        System.out.println("🔸 Sản phẩm #" + (i + 1) + ":");
        System.out.println("   - Tên sản phẩm: " + productName);
        System.out.println("   - SKU: " + sku);
        System.out.println("   - Size: " + sizeName);
        System.out.println("   - Số lượng: " + quantity);
        System.out.println("   - Đơn giá: " + unitPrice);
        System.out.println("   - Thành tiền: " + unitPrice.multiply(quantity));
    }

    // 🟢 In tổng tiền
    System.out.println("💰 Tổng tiền đơn hàng: " + totalAmount);

    // 🟢 Chuyển dữ liệu sang JSP
    SaleDAO sd = new SaleDAO();
    Sale s = sd.getSaleByOrderId(orderId);
    request.setAttribute("sale", s);
    request.setAttribute("totalAmount", totalAmount);
    request.setAttribute("orderDetailDTO", orderDetailDTO);
    request.getRequestDispatcher("/manager/export_good.jsp").forward(request, response);
    
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
