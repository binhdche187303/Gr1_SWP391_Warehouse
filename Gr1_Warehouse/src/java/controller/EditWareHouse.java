/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.WarehouseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Suppliers;
import model.Warehouse;

/**
 *
 * @author Dell
 */
public class EditWareHouse extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private WarehouseDAO warehouseDAO = new WarehouseDAO();

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
            out.println("<title>Servlet EditWareHouse</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditWareHouse at " + request.getContextPath() + "</h1>");
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
        String warehouseIdStr = request.getParameter("warehouse_id");

        if (warehouseIdStr == null || warehouseIdStr.isEmpty()) {
            response.sendRedirect("manager/archive.jsp");
            return;
        }
        try {
            int warehouseId = Integer.parseInt(warehouseIdStr);
            Warehouse warehouse = warehouseDAO.getWarehouseById(warehouseId);

            if (warehouse == null) {
                response.sendRedirect("manager/archive.jsp");
                return;
            }
            // Gửi thông tin kho tới trang edit
            request.setAttribute("warehouse", warehouse);
            request.getRequestDispatcher("manager/edit_archive.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("manager/archive.jsp");
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
        try {
            int warehouseId = Integer.parseInt(request.getParameter("warehouse_id"));
            String warehouseName = request.getParameter("warehouse_name");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String status = request.getParameter("status");

            // Kiểm tra xem dữ liệu có hợp lệ không
            if (warehouseName == null || warehouseName.isEmpty() || phone == null || phone.isEmpty() || address == null || address.isEmpty()) {
                request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin!");
                Warehouse warehouse = new Warehouse(warehouseId, warehouseName, phone, address, status);
                request.setAttribute("warehouse", warehouse);
                request.getRequestDispatcher("manager/edit_archive.jsp").forward(request, response);
                return;
            }

            Warehouse warehouse = new Warehouse(warehouseId, warehouseName, phone, address, status);
            boolean updated = warehouseDAO.updateWarehouse(warehouse);

// Ghi log kiểm tra thông tin warehouse
            System.out.println("Cập nhật kho với thông tin: ");
            System.out.println("Warehouse ID: " + warehouseId);
            System.out.println("Warehouse Name: " + warehouseName);
            System.out.println("Phone: " + phone);
            System.out.println("Address: " + address);
            System.out.println("Status: " + status);

// Kiểm tra kết quả cập nhật
            if (updated) {
                System.out.println("Cập nhật thành công!");
                response.sendRedirect("/Gr1_Warehouse/archive"); // Chuyển hướng đến trang archive
            } else {
                System.out.println("Cập nhật thất bại!");
                request.setAttribute("errorMessage", "Cập nhật thất bại!");
                request.setAttribute("warehouse", warehouse);
                request.getRequestDispatcher("manager/edit_archive.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            // Ghi log khi có lỗi
            System.out.println("Lỗi số liệu không hợp lệ: " + e.getMessage());
            request.setAttribute("errorMessage", "Dữ liệu không hợp lệ!");
            request.getRequestDispatcher("manager/edit_archive.jsp").forward(request, response);
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
