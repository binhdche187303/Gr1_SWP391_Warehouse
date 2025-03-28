/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dashboardController;

import com.google.gson.Gson;
import dao.RoleDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Role;
import model.User;

/**
 *
 * @author admin
 */
@WebServlet(name = "AllStaff", urlPatterns = {"/allstaff"})
public class AllStaff extends HttpServlet {

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
            out.println("<title>Servlet AllStaff</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AllStaff at " + request.getContextPath() + "</h1>");
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
        UserDAO ud = new UserDAO();
        RoleDAO r = new RoleDAO();

        String roleParam = request.getParameter("role"); // Lấy role từ request

        List<User> listStaff;
        if (roleParam != null) {
            try {
                int roleId = Integer.parseInt(roleParam); // Chuyển roleParam thành role_id
                listStaff = ud.getStaffByRole2(roleId); // Lấy danh sách nhân viên theo role_id
            } catch (NumberFormatException e) {
                listStaff = ud.getAllStaff(); // Nếu roleParam không phải số, lấy tất cả nhân viên
            }
        } else {
            listStaff = ud.getAllStaff(); // Nếu không có roleParam, lấy tất cả nhân viên
        }

        List<Role> listRole = r.getAllRole();

        request.setAttribute("listStaff", listStaff);
        request.setAttribute("listRole", listRole);

        if ("4".equals(roleParam)) { // Nếu role_id là 4, trả JSON cho dropdown
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            Gson gson = new Gson();
            response.getWriter().write(gson.toJson(listStaff));
        } else { // Nếu không phải role_id = 4, chuyển hướng sang trang all-staff.jsp
            request.getRequestDispatcher("/dashboard/all-staff.jsp").forward(request, response);
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
        UserDAO ud = new UserDAO();
        RoleDAO r = new RoleDAO();
        String status = request.getParameter("status");
        String user_id = request.getParameter("user_id");
        String roleId = request.getParameter("rolename");
        ud.updateStaff(status, Integer.parseInt(roleId), Integer.parseInt(user_id));
        List<User> listStaff = ud.getAllStaff();
        List<Role> listRole = r.getAllRole();
        request.setAttribute("listStaff", listStaff);
        request.setAttribute("listRole", listRole);
        request.getRequestDispatcher("/dashboard/all-staff.jsp").forward(request, response);
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
