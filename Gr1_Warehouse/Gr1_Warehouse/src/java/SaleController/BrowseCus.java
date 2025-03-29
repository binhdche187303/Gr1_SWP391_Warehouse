/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SaleController;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.WholesaleCustomer;

/**
 *
 * @author Dell
 */
public class BrowseCus extends HttpServlet {

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
            out.println("<title>Servlet BrowseCus</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BrowseCus at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");

        // Nếu không có action, chỉ hiển thị danh sách khách hàng sỉ
        if (action == null) {
            UserDAO userDAO = new UserDAO();
            List<WholesaleCustomer> customers = userDAO.getAllWholesaleCustomers();
            request.setAttribute("customers", customers);
            request.getRequestDispatcher("/sale/browse-cus.jsp").forward(request, response);
            return;
        }

        int userId;
        try {
            userId = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {
            response.sendRedirect("/Gr1_Warehouse/browse-cus?error=invalid_id");
            return;
        }

        if (!action.equals("approve") && !action.equals("reject")) {
            response.sendRedirect("/Gr1_Warehouse/browse-cus?error=invalid_action");
            return;
        }

        UserDAO userDAO = new UserDAO();
        // Xác định giá trị `status` cần cập nhật
        String userStatus = action.equals("approve") ? "Active" : "Reject";
        String customerStatus = action.equals("approve") ? "Hoạt động" : "Bị từ chối";

        // Cập nhật `status` trong cả hai bảng
        boolean success = userDAO.updateStatusBothTables(userId, userStatus, customerStatus);
        if (success) {
            response.sendRedirect("/Gr1_Warehouse/browse-cus?status=success");
        } else {
            response.sendRedirect("/Gr1_Warehouse/browse-cus?status=error");
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
        String action = request.getParameter("action");
        int userId = Integer.parseInt(request.getParameter("id"));

        if (action == null || (!action.equals("approve") && !action.equals("reject"))) {
            response.sendRedirect("/Gr1_Warehouse/browse-cus?error=invalid_action");
            return;
        }

        // Xác định trạng thái cho cả hai bảng
        String userStatus = action.equals("approve") ? "Active" : "Reject";
        String customerStatus = action.equals("approve") ? "Hoạt động" : "Bị từ chối";

        UserDAO userDAO = new UserDAO();
        boolean success = userDAO.updateStatusBothTables(userId, userStatus, customerStatus);

        if (success) {
            response.sendRedirect("/Gr1_Warehouse/browse-cus?success=" + action);
        } else {
            response.sendRedirect("/Gr1_Warehouse/browse-cus?error=update_failed");
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
