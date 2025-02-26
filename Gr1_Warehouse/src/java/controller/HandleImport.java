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
import model.PurchaseOrder;

/**
 *
 * @author Dell
 */
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1 MB
    maxFileSize = 1024 * 1024 * 10,  // 10 MB
    maxRequestSize = 1024 * 1024 * 30 // 30 MB
)
public class HandleImport extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<h1>Servlet HandleImport at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy các tham số từ form
        String supplierId = request.getParameter("supplierId");
        String warehouseId = request.getParameter("warehouseId");
        String warehouseStaffId = request.getParameter("warehouseStaffId");
        String totalAmount = request.getParameter("totalAmount");
        String totalQuantity = request.getParameter("totalQuantity");
        String notes = request.getParameter("notes");

        System.out.println("Supplier ID: " + supplierId);
        System.out.println("Warehouse ID: " + warehouseId);
        System.out.println("Warehouse Staff ID: " + warehouseStaffId);
        System.out.println("Total Amount: " + totalAmount);
        System.out.println("Total Quantity: " + totalQuantity);
        System.out.println("Notes: " + notes);

        // Lấy phần dữ liệu ảnh hóa đơn
        Part billImgPart = request.getPart("billImgUrl");
        String billImgUrl = null;

        if (billImgPart != null && billImgPart.getSize() > 0) {
            String fileName = Path.of(billImgPart.getSubmittedFileName()).getFileName().toString();
            String uniqueFileName = UUID.randomUUID().toString() + "_" + fileName;
            String uploadDir = getServletContext().getRealPath("/uploads");

            File uploadFile = new File(uploadDir);
            if (!uploadFile.exists()) {
                uploadFile.mkdir();
            }

            // Lưu ảnh hóa đơn vào server
            InputStream fileContent = billImgPart.getInputStream();
            FileOutputStream outputStream = new FileOutputStream(new File(uploadDir, uniqueFileName));
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            outputStream.close();

            billImgUrl = uniqueFileName;
        }

        // Kiểm tra thông tin quan trọng
        if (supplierId == null || warehouseId == null || warehouseStaffId == null || totalAmount == null || totalQuantity == null) {
            response.getWriter().write("Lỗi: Thiếu thông tin cần thiết");
            return;
        }

        // Tạo đối tượng PurchaseOrder
        PurchaseOrder purchaseOrder = new PurchaseOrder();
        purchaseOrder.setOrderDate(new Timestamp(System.currentTimeMillis())); // Lấy ngày hiện tại
        purchaseOrder.setSupplierId(Integer.parseInt(supplierId));
        purchaseOrder.setTotalAmount(Double.parseDouble(totalAmount));
        purchaseOrder.setBillImgUrl(billImgUrl);
        purchaseOrder.setStatus("Pending"); // Trạng thái đơn nhập hàng
        purchaseOrder.setNotes(notes);
        purchaseOrder.setWarehouseId(Integer.parseInt(warehouseId));
        purchaseOrder.setUserId(Integer.parseInt(warehouseStaffId)); // Giả sử userId là warehouseStaffId
        purchaseOrder.setReferenceCode(UUID.randomUUID().toString());

        // Lưu đơn nhập hàng vào cơ sở dữ liệu
        PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        boolean success = purchaseOrderDAO.insertPurchaseOrder(purchaseOrder);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/importGood");
        } else {
            response.getWriter().write("Lỗi khi lưu đơn nhập hàng.");
        }
    }


    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}