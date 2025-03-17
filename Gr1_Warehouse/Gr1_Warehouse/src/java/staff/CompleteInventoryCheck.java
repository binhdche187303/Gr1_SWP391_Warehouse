/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package staff;

import dao.InventoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Huy Nam
 */
public class CompleteInventoryCheck extends HttpServlet {

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
            out.println("<title>Servlet CompleteInventoryCheck</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CompleteInventoryCheck at " + request.getContextPath() + "</h1>");
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
    InventoryDAO dao = new InventoryDAO();
    try {
        // Đọc dữ liệu JSON từ request body
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        String requestBody = sb.toString();
        System.out.println("📥 Dữ liệu JSON nhận được: " + requestBody);

        JSONObject jsonData = new JSONObject(requestBody); // Chuyển JSON string thành object

        // Lấy thông tin từ JSON
        int inventoryCheckId = jsonData.getInt("checkId");
        String warehouseStaff = jsonData.getString("warehouseStaff");
        int totalDifferenceUp = jsonData.getInt("totalDifferenceUp");
        int totalDifferenceDown = jsonData.getInt("totalDifferenceDown");
        double totalPriceDifferenceUp = jsonData.getDouble("totalPriceDifferenceUp");
        double totalPriceDifferenceDown = jsonData.getDouble("totalPriceDifferenceDown");
        String notes = jsonData.getString("notes");

        System.out.println("Check ID: " + inventoryCheckId);
        System.out.println("Warehouse Staff: " + warehouseStaff);
        System.out.println("Total Difference Up: " + totalDifferenceUp);
        System.out.println("Total Difference Down: " + totalDifferenceDown);
        System.out.println("Total Price Difference Up: " + totalPriceDifferenceUp);
        System.out.println("Total Price Difference Down: " + totalPriceDifferenceDown);
        System.out.println("Notes: " + notes);

        // Cập nhật bảng InventoryCheck với các thông tin mới
        boolean isUpdated = dao.updateInventoryCheck(
                inventoryCheckId, warehouseStaff, totalDifferenceUp, totalDifferenceDown,
                totalPriceDifferenceUp, totalPriceDifferenceDown, notes
        );

        if (!isUpdated) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"status\": \"error\", \"message\": \"Lỗi khi cập nhật kiểm kho.\"}");
            return;
        }

        // Lấy danh sách sản phẩm kiểm kho
        JSONArray inventoryItems = jsonData.getJSONArray("inventoryItems");

        // Duyệt qua từng sản phẩm để lấy thông tin
        for (int i = 0; i < inventoryItems.length(); i++) {
            JSONObject item = inventoryItems.getJSONObject(i);

            // Lấy dữ liệu từng sản phẩm
            String sku = item.getString("sku");
            int actualQuantity = item.getInt("actualQuantity");
            int recordedQuantity = item.getInt("recordedQuantity");
            double differencePrice = item.getDouble("differencePrice");
            int variantId = item.getInt("variantId");
            int batchId = item.getInt("batch");
            String expirationDate = item.getString("expirationDate");
            String reason = item.getString("reason");

            System.out.println("SKU: " + sku + ", Variant ID: " + variantId + ", actualQuantity: " + actualQuantity
                    + ", recordedQuantity: " + recordedQuantity + ", differencePrice: " + differencePrice + ", expirationDate: " + expirationDate
                    + ", batchId: " + batchId + ", reason: " + reason);

            // Gọi DAO để chèn dữ liệu vào database
            boolean isInserted = dao.insertInventoryDetails(
                    inventoryCheckId, batchId, variantId, sku, recordedQuantity, actualQuantity, differencePrice, expirationDate, reason
            );

            // Kiểm tra nếu có lỗi khi chèn vào DB
            if (!isInserted) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"status\": \"error\", \"message\": \"Lỗi khi thêm chi tiết kiểm kho.\"}");
                return;
            }
        }

        // Cập nhật trạng thái kiểm kho
        boolean isStatusUpdated = dao.updateInventoryCheckStatus(inventoryCheckId);
        if (isStatusUpdated) {
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("{\"status\": \"success\", \"message\": \"Kiểm kho đã hoàn thành!\"}");
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"status\": \"error\", \"message\": \"Lỗi khi cập nhật trạng thái kiểm kho.\"}");
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        response.getWriter().write("{\"status\": \"error\", \"message\": \"Dữ liệu không hợp lệ.\"}");
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