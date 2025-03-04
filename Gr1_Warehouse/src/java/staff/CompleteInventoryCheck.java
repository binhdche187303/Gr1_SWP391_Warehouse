/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package staff;

import dao.InventoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Huy Nam
 */
public class CompleteInventoryCheck extends HttpServlet {
   
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
            out.println("<title>Servlet CompleteInventoryCheck</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CompleteInventoryCheck at " + request.getContextPath () + "</h1>");
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
        InventoryDAO dao = new InventoryDAO();
        try {
            // Lấy inventoryCheckId từ request
            int inventoryCheckId = Integer.parseInt(request.getParameter("inventoryCheckId"));
            
            // Lấy các chi tiết kiểm kho
            int productId = Integer.parseInt(request.getParameter("productId"));
            double differenceUp = Double.parseDouble(request.getParameter("differenceUp"));
            double differenceDown = Double.parseDouble(request.getParameter("differenceDown"));
            double priceDifferenceUp = Double.parseDouble(request.getParameter("priceDifferenceUp"));
            double priceDifferenceDown = Double.parseDouble(request.getParameter("priceDifferenceDown"));
            String notes = request.getParameter("notes");

            // Cập nhật trạng thái và thời gian hoàn thành kiểm kho
            boolean isUpdated = dao.updateInventoryCheckStatus(inventoryCheckId);
            if (isUpdated) {
                // Thêm chi tiết vào InventoryDetails
                boolean isInserted = dao.insertInventoryDetails(inventoryCheckId, productId, differenceUp, differenceDown, priceDifferenceUp, priceDifferenceDown, notes);
                if (isInserted) {
                    response.setStatus(HttpServletResponse.SC_OK);
                    response.getWriter().write("{\"status\": \"success\", \"message\": \"Kiểm kho đã hoàn thành và chi tiết đã được lưu!\"}");
                } else {
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    response.getWriter().write("{\"status\": \"error\", \"message\": \"Lỗi khi thêm chi tiết kiểm kho.\"}");
                }
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"status\": \"error\", \"message\": \"Lỗi khi cập nhật trạng thái kiểm kho.\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"status\": \"error\", \"message\": \"Dữ liệu không hợp lệ.\"}");
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
