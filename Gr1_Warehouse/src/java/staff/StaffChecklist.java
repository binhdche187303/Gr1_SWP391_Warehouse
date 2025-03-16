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
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.InventoryCheckDTO;
import model.User;
import model.Warehouse;

/**
 *
 * @author Huy Nam
 */
public class StaffChecklist extends HttpServlet {

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
            out.println("<title>Servlet StaffChecklist</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffChecklist at " + request.getContextPath() + "</h1>");
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
        String warehouseFilter = request.getParameter("warehouseFilter");
        String statusFilter = request.getParameter("statusFilter");
        InventoryDAO dao = new InventoryDAO();

        // Giải mã giá trị từ URL
        warehouseFilter = warehouseFilter != null ? java.net.URLDecoder.decode(warehouseFilter, "UTF-8").trim() : "";
        statusFilter = statusFilter != null ? java.net.URLDecoder.decode(statusFilter, "UTF-8").trim() : "";

        System.out.println("Warehouse Filter: " + warehouseFilter);
        System.out.println("Status Filter: " + statusFilter);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        int staffId = user.getUserId();
        System.out.println("🔍 staffId nhận được: " + staffId);

      
        List<InventoryCheckDTO> inventoryChecks = dao.getFilteredInventoryCheckByStaffId(staffId, warehouseFilter, statusFilter);
        List<Warehouse> warehouseList = dao.getListWarehouse();
        request.setAttribute("warehouseList", warehouseList);
        request.setAttribute("inventoryChecks", inventoryChecks);
        request.getRequestDispatcher("manager/staff_checklist.jsp").forward(request, response);
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
