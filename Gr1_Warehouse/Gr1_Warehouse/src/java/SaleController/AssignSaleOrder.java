/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SaleController;

import dao.SaleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author admin
 */
public class AssignSaleOrder extends HttpServlet {

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
            out.println("<title>Servlet AssignSaleOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AssignSaleOrder12 at " + request.getContextPath() + "</h1>");
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
        System.out.println("HIH");
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
        SaleDAO sd = new SaleDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        // Kiểm tra nếu user có quyền đóng gói
        if (user == null || user.getRole().getRoleId() != 7) {
            request.setAttribute("message", "Bạn không có quyền nhận đơn!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        int staffId = user.getUserId();
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        boolean success = sd.assignSaleOrder(orderId, staffId);

        if (success) {
            request.getSession().setAttribute("message", "Nhận đơn thành công!");
        } else {
            request.getSession().setAttribute("message", "Không thể nhận đơn. Hãy kiểm tra lại.");
        }

        // Chuyển hướng về danh sách đơn cần đóng gói
        response.sendRedirect("sale-orders");
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
