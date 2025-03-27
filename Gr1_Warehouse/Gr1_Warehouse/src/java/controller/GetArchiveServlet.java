/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dao.WarehouseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Warehouse;

/**
 *
 * @author Dell
 */
public class GetArchiveServlet extends HttpServlet {

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
            out.println("<title>Servlet GetArchiveServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetArchiveServlet at " + request.getContextPath() + "</h1>");
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
        try {
            WarehouseDAO warehouseDAO = new WarehouseDAO();

            // Thêm tham số để xác định lấy tất cả kho hay chỉ kho Active
            String filter = request.getParameter("filter");
            List<Warehouse> warehouse;

            if ("Active".equals(filter)) {
                // Thêm phương thức mới để lấy chỉ kho Active
                warehouse = warehouseDAO.getActiveWarehouses();
            } else {
                // Nếu không có filter hoặc filter khác, lấy tất cả kho
                warehouse = warehouseDAO.getAllWarehouse();
            }

            if (warehouse.isEmpty()) {
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
                response.getWriter().write("[]"); // Trả về JSON rỗng để tránh lỗi JS
                return;
            }

            Gson gson = new Gson();
            String json = gson.toJson(warehouse);
            System.out.println("Dữ liệu JSON gửi đi: " + json); // Debug

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8"); // Đảm bảo không lỗi font
            response.getWriter().write(json);
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"" + e.getMessage() + "\"}");
            e.printStackTrace(); // In lỗi trong server log
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