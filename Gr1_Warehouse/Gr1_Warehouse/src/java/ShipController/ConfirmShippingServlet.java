/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package ShipController;

import dao.ShippingDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class ConfirmShippingServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ConfirmShippingServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmShippingServlet at " + request.getContextPath () + "</h1>");
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
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         ShippingDetailDAO sdd = new ShippingDetailDAO();
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            String orderIdStr = request.getParameter("orderId");
            System.out.println("📋 Mã đơn hàng nhận được từ request: " + orderIdStr);

            // Kiểm tra mã đơn hàng có hợp lệ không
            if (orderIdStr == null || orderIdStr.isEmpty()) {
                out.print("{\"success\": false, \"message\": \"Thiếu mã đơn hàng.\"}");
                return;
            }

            int orderId = Integer.parseInt(orderIdStr);

            // Gọi phương thức DAO để xác nhận đóng gói và cập nhật trạng thái đơn hàng
            boolean isConfirmed = sdd.confirmShippingAndPaying(orderId);

            if (isConfirmed) {
                out.print("{\"success\": true, \"message\": \"Xác nhận đơn hàng thành công.\"}");
            } else {
                out.print("{\"success\": false, \"message\": \"Không thể cập nhật trạng thái đơn hàng.\"}");
            }
        } catch (NumberFormatException e) {
            System.out.println("❌ Lỗi: Mã đơn hàng không hợp lệ.");
            out.print("{\"success\": false, \"message\": \"Mã đơn hàng không hợp lệ.\"}");
        } catch (Exception e) {
            e.printStackTrace();
            out.print("{\"success\": false, \"message\": \"Lỗi hệ thống.\"}");
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
