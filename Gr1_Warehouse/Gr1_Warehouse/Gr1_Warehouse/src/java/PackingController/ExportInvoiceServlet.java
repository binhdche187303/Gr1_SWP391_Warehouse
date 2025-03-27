/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package PackingController;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import dao.DBContext;
import dao.PackingDetailDAO;
import java.io.IOException;
import java.io.OutputStream;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;

/**
 *
 * @author Dell
 */
public class ExportInvoiceServlet extends HttpServlet {

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
            out.println("<title>Servlet ExportInvoiceServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExportInvoiceServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        PackingDetailDAO packingDetailDAO = new PackingDetailDAO();
        String orderIdParam = request.getParameter("order_id");

        // Kiểm tra order_id có hợp lệ không
        if (orderIdParam == null || !orderIdParam.matches("\\d+")) {
            request.setAttribute("error", "Mã đơn hàng không hợp lệ.");
            request.getRequestDispatcher("/exportInvoice.jsp").forward(request, response);
            return;
        }

        int orderId = Integer.parseInt(orderIdParam);
        Map<String, Object> orderDetail = packingDetailDAO.getOrderDetailById(orderId);

        // Kiểm tra nếu không tìm thấy đơn hàng
        if (orderDetail == null || orderDetail.isEmpty()) {
            request.setAttribute("error", "Không tìm thấy thông tin đơn hàng.");
            request.getRequestDispatcher("/exportInvoice.jsp").forward(request, response);
            return;
        }

        // Lấy danh sách sản phẩm
        List<Map<String, Object>> products = (orderDetail.get("products") instanceof List)
                ? (List<Map<String, Object>>) orderDetail.get("products")
                : new ArrayList<>();

        if (products.isEmpty()) {
            request.setAttribute("error", "Không có sản phẩm nào trong đơn hàng.");
            request.getRequestDispatcher("/exportInvoice.jsp").forward(request, response);
            return;
        }

        // Gửi dữ liệu sang JSP
        request.setAttribute("orderDetail", orderDetail);
        request.getRequestDispatcher("packing_staff/exportInvoice.jsp").forward(request, response);
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
