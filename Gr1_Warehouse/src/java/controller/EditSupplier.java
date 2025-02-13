/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SupplierDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Suppliers;

/**
 *
 * @author Dell
 */
public class EditSupplier extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private SupplierDAO supplierDAO = new SupplierDAO();

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
            out.println("<title>Servlet EditSupplier</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditSupplier at " + request.getContextPath() + "</h1>");
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
        String supplierIdStr = request.getParameter("supplier_id");

        if (supplierIdStr == null || supplierIdStr.isEmpty()) {
            response.sendRedirect("manager/suppliers.jsp");
            return;
        }
        try {
            int supplierId = Integer.parseInt(supplierIdStr);
            Suppliers supplier = supplierDAO.getSupplierById(supplierId);

            if (supplier == null) {
                response.sendRedirect("manager/suppliers.jsp");
                return;
            }
            request.setAttribute("supplier", supplier);
            request.getRequestDispatcher("manager/edit_supplier.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("manager/suppliers.jsp");
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
            int supplierId = Integer.parseInt(request.getParameter("supplier_id"));
            String supplierName = request.getParameter("supplier_name");  
            String supplierCode = request.getParameter("supplier_code");  
            String phone = request.getParameter("phone");  
            String email = request.getParameter("email");  
            String address = request.getParameter("address");  
            String status = request.getParameter("status");  

            if (supplierName == null || supplierName.isEmpty() || phone == null || phone.isEmpty()) {
                request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin!");
                request.getRequestDispatcher("manager/edit_supplier.jsp").forward(request, response);
                return;
            }

            Suppliers supplier = new Suppliers(supplierId, supplierName, supplierCode, phone, email, address, status);

            boolean updated = supplierDAO.editSupplier(supplier);

            if (updated) {
            response.sendRedirect("/Gr1_Warehouse/supplier");
            } else {
                request.setAttribute("errorMessage", "Cập nhật thất bại!");
                request.setAttribute("supplier", supplier);
                request.getRequestDispatcher("manager/edit_supplier.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Dữ liệu không hợp lệ!");
            request.getRequestDispatcher("manager/edit_supplier.jsp").forward(request, response);
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
