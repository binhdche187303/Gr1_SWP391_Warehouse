/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.PurchaseOrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.PurchaseOrderDetailDTO;

/**
 *
 * @author Dell
 */
public class ImportGoodDetail extends HttpServlet {

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
            out.println("<title>Servlet ImportGoodDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ImportGoodDetail at " + request.getContextPath() + "</h1>");
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
            // Lấy tham số order_id từ URL
            int orderId = Integer.parseInt(request.getParameter("order_id"));
            PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();

            // Lấy chi tiết đơn hàng từ PurchaseOrderDAO
            PurchaseOrderDetailDTO orderDetail = purchaseOrderDAO.getOrderDetail(orderId);

            if (orderDetail == null) {
                // Nếu không tìm thấy đơn hàng, trả về lỗi 404
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Order not found.");
                return;
            }

            // Đưa các đối tượng vào request để truyền vào JSP
            request.setAttribute("orderDetail", orderDetail);
            request.setAttribute("orderId", orderId);

            // Chuyển hướng tới JSP để hiển thị thông tin chi tiết đơn hàng
            request.getRequestDispatcher("/manager/import_good_detail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            // Ghi thông tin lỗi ra console
            System.out.println("Error: Invalid order ID format.");
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid order ID.");
        } catch (Exception e) {
            // Ghi thông tin lỗi ra console
            System.out.println("An unexpected error occurred.");
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
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
