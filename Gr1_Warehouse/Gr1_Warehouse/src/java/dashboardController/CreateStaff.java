/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dashboardController;

import dao.RoleDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import model.Role;
import model.User;

/**
 *
 * @author admin
 */
public class CreateStaff extends HttpServlet {

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
            out.println("<title>Servlet CreateStaff</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateStaff at " + request.getContextPath() + "</h1>");
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
        RoleDAO rd = new RoleDAO();
        List<Role> listRoles = rd.getAllRoleStaff();
        request.setAttribute("listRoles", listRoles);
        request.getRequestDispatcher("/dashboard/create-staff.jsp").forward(request, response);
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
        User u = new User();
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String roleId_raw = request.getParameter("roleId");
        
        System.out.println(username);
        try {
            int roleId = Integer.parseInt(roleId_raw);
            u.setUsername(username.trim());
            u.setEmail(email);
            u.setRole(new Role(roleId));
            u.setRole(new Role(roleId));
            u.setStatus("Active");

            if (ud.create(u)) {
                request.getSession().setAttribute("message", "Nhân viên đã được tạo thành công!");
                response.sendRedirect("/Gr1_Warehouse/allstaff");
            } else {
                RoleDAO rd = new RoleDAO();
                List<Role> listRoles = rd.getAllRoleStaff();
                request.setAttribute("listRoles", listRoles);
                request.setAttribute("username", username);
                request.setAttribute("email", email);
                request.setAttribute("roleId", roleId);
                request.setAttribute("message", "Tên tài khoản hoặc email đã tồn tại!");
                request.getRequestDispatcher("/dashboard/create-staff.jsp").forward(request, response);
            }
        } catch (NumberFormatException | SQLException e) {
            request.setAttribute("message", "Lỗi khi tạo người dùng: " + e.getMessage());
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
