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

/**
 *
 * @author Huy Nam
 */
public class StaffChecklist extends HttpServlet {
   
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
            out.println("<title>Servlet StaffChecklist</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffChecklist at " + request.getContextPath () + "</h1>");
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
    
    InventoryDAO dao = new InventoryDAO();
    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("acc");

    if (user == null) {
        response.sendRedirect("login");
        return;
    }

    int staffId = user.getUserId();
    System.out.println("🔍 staffId nhận được: " + staffId);

    // Gọi hàm lấy danh sách kiểm kho
    List<InventoryCheckDTO> inventoryChecks = dao.getAllInventoryCheckByStaffId(staffId);

    // Kiểm tra danh sách có dữ liệu không
    if (inventoryChecks.isEmpty()) {
        System.out.println("⚠️ Không có dữ liệu kiểm kho nào cho nhân viên ID: " + staffId);
    } else {
        System.out.println("✅ Danh sách kiểm kho của nhân viên ID: " + staffId);
        for (InventoryCheckDTO check : inventoryChecks) {
            System.out.println("------------------------------------");
            System.out.println("Check ID: " + check.getCheckId());
            System.out.println("Kho: " + check.getWarehouseName());
            System.out.println("Trạng thái: " + check.getStatus());
            System.out.println("Ngày kiểm kho: " + check.getCheckDate());
            System.out.println("Ngày hoàn thành: " + check.getCompleteDate());
            System.out.println("Lệch số lượng: " + check.getTotalDiscrepancy());
            System.out.println("Lệch giá trị: " + check.getTotalDiscrepancyValue());
        }
    }

    request.setAttribute("inventoryChecks", inventoryChecks);
    request.getRequestDispatcher("manager/staff_checklist.jsp").forward(request, response);
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
        processRequest(request, response);
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
