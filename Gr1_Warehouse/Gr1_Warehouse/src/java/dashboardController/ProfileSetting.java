/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dashboardController;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import ulti.MD5Hash;

/**
 *
 * @author admin
 */
@WebServlet(name = "ProfileSetting", urlPatterns = {"/profilesettingadmin"})
public class ProfileSetting extends HttpServlet {

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
            out.println("<title>Servlet ProfileSetting</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileSetting at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/dashboard/profile-setting.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");

        UserDAO ud = new UserDAO();

        String action = request.getParameter("action");
        String userID = request.getParameter("userId");

        //Change profile
        if (Integer.parseInt(action) == 0) {
            String fullname = request.getParameter("fullname");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            ud.updateUser(fullname, phone, address, Integer.parseInt(userID));

            request.setAttribute("successprofile", "Change profile successfully");
        } else //Change password
        {
            String currentpassword = request.getParameter("currentpassword");
            String newpassword = request.getParameter("newpassword");
            String confirmpassword = request.getParameter("confirmpassword");

            String hashedCurrentPassword = MD5Hash.hash(currentpassword);

            if (!hashedCurrentPassword.equals(u.getPassword())) {
                request.setAttribute("error", "Current password is incorrect!");
                request.getRequestDispatcher("/dashboard/profile-setting.jsp").forward(request, response);
                return;
            }

            if (!newpassword.equals(confirmpassword)) {
                request.setAttribute("error", "New password and confirm password do not match!");
                request.getRequestDispatcher("/dashboard/profile-setting.jsp").forward(request, response);
                return;
            }
            String hashedNewPassword = MD5Hash.hash(newpassword);
            ud.updatePassword(hashedNewPassword, userID);
            
            request.setAttribute("success", "Change password successfully");
        }
        User nuser = ud.getUserById(u.getUserId());
        session.setAttribute("acc", nuser);
        request.getRequestDispatcher("/dashboard/profile-setting.jsp").forward(request, response);

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
