/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.PurchaseOrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Path;
import java.sql.Timestamp;
import java.util.UUID;
import model.PurchaseDetails;
import model.PurchaseOrder;

/**
 *
 * @author Dell
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 30 // 30 MB
)
public class HandleImport extends HttpServlet {

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
            out.println("<title>Servlet HandleImport</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HandleImport at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/manager/handle_import.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            System.out.println("=== Bắt đầu xử lý đơn nhập hàng ===");

            // Lấy thông tin đơn hàng từ request
            String supplierId = request.getParameter("supplierId");
            String warehouseId = request.getParameter("warehouseId");
            String warehouseStaffId = request.getParameter("warehouseStaffId");
            String totalAmount = request.getParameter("totalAmount");
            String notes = request.getParameter("notes");

            System.out.println("Supplier ID: " + supplierId);
            System.out.println("Warehouse ID: " + warehouseId);
            System.out.println("Warehouse Staff ID: " + warehouseStaffId);
            System.out.println("Total Amount: " + totalAmount);
            System.out.println("Notes: " + notes);

            // Lấy danh sách sản phẩm
            String[] variantIds = request.getParameterValues("variantIds");
            String[] quantities = request.getParameterValues("quantities");
            String[] unitPrices = request.getParameterValues("unitPrices");
            String[] expirationDates = request.getParameterValues("expirationDates");

            if (variantIds == null || quantities == null || unitPrices == null) {
                System.err.println("Lỗi: Thiếu dữ liệu sản phẩm");
                response.getWriter().write("Lỗi: Thiếu dữ liệu sản phẩm");
                return;
            }

            System.out.println("Số lượng sản phẩm: " + variantIds.length);

            // Tạo đơn hàng mới
            PurchaseOrder purchaseOrder = new PurchaseOrder();
            purchaseOrder.setOrderDate(new Timestamp(System.currentTimeMillis()));
            purchaseOrder.setSupplierId(Integer.parseInt(supplierId));
            purchaseOrder.setTotalAmount(Double.parseDouble(totalAmount));
            purchaseOrder.setStatus("Confirmed");
            purchaseOrder.setNotes(notes);
            purchaseOrder.setWarehouseId(Integer.parseInt(warehouseId));
            purchaseOrder.setUserId(Integer.parseInt(warehouseStaffId));
            purchaseOrder.setReferenceCode(UUID.randomUUID().toString());

            PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
            int orderId = purchaseOrderDAO.insertPurchaseOrder(purchaseOrder);

            if (orderId <= 0) {
                System.err.println("Lỗi khi lưu đơn nhập hàng.");
                response.getWriter().write("Lỗi khi lưu đơn nhập hàng.");
                return;
            }

            System.out.println("Đã tạo đơn hàng với Order ID: " + orderId);

            for (int i = 0; i < variantIds.length; i++) {
                int variantId = Integer.parseInt(variantIds[i]);
                int quantity = Integer.parseInt(quantities[i]);
                double unitPrice = Double.parseDouble(unitPrices[i]);
                String expirationDate = (expirationDates != null && expirationDates[i] != null) ? expirationDates[i] : null;

                System.out.println("Sản phẩm " + (i + 1) + ":");
                System.out.println("  Variant ID: " + variantId);
                System.out.println("  Số lượng: " + quantity);
                System.out.println("  Giá: " + unitPrice);
                System.out.println("  Hạn sử dụng: " + (expirationDate != null ? expirationDate : "Không có"));

                // Kiểm tra lô hàng dựa trên variantId
                int existingBatchId = purchaseOrderDAO.findExistingBatchByVariantId(variantId, expirationDate, Integer.parseInt(warehouseId));

                int batchId;
                if (existingBatchId > 0) {
                    System.out.println("Lô hàng tồn tại (Batch ID: " + existingBatchId + "), cập nhật số lượng...");
                    purchaseOrderDAO.updateBatchQuantity(existingBatchId, quantity);
                    batchId = existingBatchId;
                } else {
                    System.out.println("Không tìm thấy lô hàng cũ, tạo lô hàng mới...");
                    batchId = purchaseOrderDAO.insertNewBatchByVariantId(variantId, quantity, unitPrice, expirationDate, Integer.parseInt(warehouseId));
                }

                // Chèn vào PurchaseDetails
                Timestamp expDate = (expirationDate != null && !expirationDate.isEmpty())
                        ? Timestamp.valueOf(expirationDate + " 00:00:00")
                        : null;

                PurchaseDetails purchaseDetails = new PurchaseDetails(
                        orderId, variantId, null, quantity, unitPrice, expDate, batchId, Integer.parseInt(warehouseId)
                );

                System.out.println("Chèn vào PurchaseDetails: " + purchaseDetails);
                purchaseOrderDAO.insertPurchaseDetailsByVariantId(purchaseDetails);
            }

            System.out.println("=== Xử lý đơn nhập hàng hoàn tất ===");
            response.sendRedirect(request.getContextPath() + "/importGood");

        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Lỗi trong quá trình xử lý đơn nhập hàng: " + e.getMessage());
            response.getWriter().write("Lỗi xử lý đơn nhập hàng: " + e.getMessage());
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
