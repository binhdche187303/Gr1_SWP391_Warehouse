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
import model.Warehouse;

/**
 *
 * @author Dell
 */
public class AddWarehouseServlet extends HttpServlet {

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
            out.println("<title>Servlet AddWarehouseServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddWarehouseServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");

        String warehouseName = request.getParameter("warehouseName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        if (warehouseName == null || warehouseName.isEmpty()
                || phone == null || phone.isEmpty()
                || address == null || address.isEmpty()) {
            response.getWriter().write("invalid_input");
            return;
        }

        Warehouse warehouse = new Warehouse();
        warehouse.setWarehouseName(warehouseName);
        warehouse.setPhone(phone);
        warehouse.setAddress(address);
        warehouse.setStatus("Active");

        WarehouseDAO warehouseDAO = new WarehouseDAO();
        boolean success = warehouseDAO.addWarehouse(warehouse);

        response.getWriter().write(success ? "success" : "db_error");
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
