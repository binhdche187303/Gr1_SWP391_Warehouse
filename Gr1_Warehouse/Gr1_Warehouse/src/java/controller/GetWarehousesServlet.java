/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dao.SupplierDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Suppliers;

/**
 *
 * @author Dell
 */
@WebServlet(name = "GetWarehousesServlet", urlPatterns = {"/getSuppliers"})
public class GetWarehousesServlet extends HttpServlet {

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
            out.println("<title>Servlet GetWarehousesServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetWarehousesServlet at " + request.getContextPath() + "</h1>");
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
        try {
            SupplierDAO supplierDAO = new SupplierDAO();

            // Thêm tham số để xác định lấy tất cả nhà cung cấp hay chỉ nhà cung cấp Active
            String filter = request.getParameter("filter");
            List<Suppliers> suppliers;

            if ("Active".equals(filter)) {
                // Gọi phương thức mới để lấy chỉ nhà cung cấp Active
                suppliers = supplierDAO.getActiveSuppliers();
            } else {
                // Nếu không có filter hoặc filter khác, lấy tất cả nhà cung cấp
                suppliers = supplierDAO.getAllSuppliers();
            }

            // Kiểm tra nếu không có nhà cung cấp nào
            if (suppliers == null || suppliers.isEmpty()) {
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
                response.getWriter().write("[]"); // Trả về mảng rỗng nếu không có dữ liệu
                return;
            }
            // Chuyển đổi danh sách nhà cung cấp thành mảng JSON
            Gson gson = new Gson();
            String json = gson.toJson(suppliers); // Đây sẽ là một chuỗi JSON của mảng
            // Debug: kiểm tra dữ liệu JSON gửi đi
            System.out.println("Dữ liệu JSON gửi đi: " + json);
            // Đặt các header của response
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            // Trả về mảng JSON
            response.getWriter().write(json);
        } catch (Exception e) {
            // Trả về lỗi nếu gặp ngoại lệ
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"" + e.getMessage() + "\"}");
        }
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