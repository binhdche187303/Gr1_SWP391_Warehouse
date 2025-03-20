/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dashboardController;

import dao.InventoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.InventoryCheck;
import model.InventoryCheckDetailDTO;

/**
 *
 * @author Dell
 */
public class ExportInventoryCheck extends HttpServlet {

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
            out.println("<title>Servlet ExportInventoryCheck</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExportInventoryCheck at " + request.getContextPath() + "</h1>");
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

        System.out.println("=== Bắt đầu xử lý doGet trong InventoryCheckServlet ===");

        InventoryDAO dao = new InventoryDAO();
        String checkIdParam = request.getParameter("checkId");

        // Kiểm tra checkId có hợp lệ không
        if (checkIdParam == null || !checkIdParam.matches("\\d+")) {
            System.out.println("[LỖI] Mã phiếu kiểm không hợp lệ: " + checkIdParam);
            request.setAttribute("error", "Mã phiếu kiểm không hợp lệ.");
            request.getRequestDispatcher("/manager/export_inventory_check.jsp").forward(request, response);
            return;
        }

        try {
            int checkId = Integer.parseInt(checkIdParam);
            System.out.println("[INFO] Đã nhận được checkId: " + checkId);

            List<InventoryCheckDetailDTO> list = dao.getInventoryCheckDetail(checkId);
            InventoryCheck check = dao.getInventoryCheckDetails(checkId);

            // Log dữ liệu truy vấn được
            System.out.println("[INFO] Dữ liệu InventoryCheckDetailDTO:");
            for (InventoryCheckDetailDTO detail : list) {
                System.out.println("  - " + detail.toString());
            }

            System.out.println("[INFO] Dữ liệu InventoryCheck:");
            System.out.println("  - " + check.toString());

            request.setAttribute("idlist", list);
            request.setAttribute("check", check);
            System.out.println("[INFO] Chuyển hướng đến export_inventory_check.jsp");
            request.getRequestDispatcher("/manager/export_inventory_check.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            System.out.println("[LỖI] Lỗi khi chuyển đổi checkId: " + checkIdParam);
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("[LỖI] Xảy ra ngoại lệ không mong muốn:");
            e.printStackTrace();
        }

        System.out.println("=== Kết thúc xử lý doGet ===");
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
