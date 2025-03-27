/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
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
public class ChangePassword extends HttpServlet {

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
            out.println("<title>Servlet ChangePasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    private UserDAO userDAO;

    // Constructor mặc định khởi tạo UserDAO
    public ChangePassword() {
        this.userDAO = new UserDAO();
    }

    // Setter để inject UserDAO trong Unit Test
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }
    
        // Constructor cho testing (cho phép inject mock UserDAO)
    public ChangePassword(UserDAO userDAO) {
        this.userDAO = userDAO; // Sử dụng UserDAO mock
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String currentpassword = request.getParameter("currentpassword");
        String newpassword = request.getParameter("newpassword");
        String confirmpassword = request.getParameter("confirmpassword");

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");
        UserDAO ud = new UserDAO();
        int user_id = u.getUserId();

        String hashedCurrentPassword = MD5Hash.hash(currentpassword);

        // Kiểm tra mật khẩu hiện tại
        if (!hashedCurrentPassword.equals(u.getPassword())) {
            request.setAttribute("error", "Mật khẩu hiện tại không đúng!");
            System.out.println("Error: Mật khẩu hiện tại không đúng!");
            request.getRequestDispatcher("/pages/profileSetting.jsp").forward(request, response);
            return;
        }

        // Kiểm tra mật khẩu mới và mật khẩu xác nhận
        if (!newpassword.equals(confirmpassword)) {
            request.setAttribute("error", "Mật khẩu mới và mật khẩu xác nhận không khớp!");
            System.out.println("Error: Mật khẩu mới và mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("/pages/profileSetting.jsp").forward(request, response);
            return;
        }

        // Kiểm tra độ phức tạp của mật khẩu mới
        String passwordPattern = "^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?\":{}|<>])(?=.*\\d)(?=.*[a-z]).{8,}$";
        if (!newpassword.matches(passwordPattern)) {
            request.setAttribute("error", "Mật khẩu mới phải chứa ít nhất 1 chữ in hoa, 1 ký tự đặc biệt, 1 số và tối thiểu 8 ký tự!");
            System.out.println("Error: Mật khẩu mới phải chứa ít nhất 1 chữ in hoa, 1 ký tự đặc biệt, 1 số và tối thiểu 8 ký tự!");
            request.getRequestDispatcher("/pages/profileSetting.jsp").forward(request, response);
            return;
        }

        String hashedNewPassword = MD5Hash.hash(newpassword);
        userDAO.updatePassword(hashedNewPassword, user_id);

        User newUser = userDAO.getUserById(user_id);
        session.setAttribute("acc", newUser);

//        String hashedNewPassword = MD5Hash.hash(newpassword);
//        ud.updatePassword(hashedNewPassword, user_id);
//        User newUser = ud.getUserById(user_id);
//        session.setAttribute("acc", newUser);

        // Thông báo thành công
        request.setAttribute("success", "Đổi mật khẩu thành công!");
        System.out.println("Đổi mật khẩu thành công!");
        request.getRequestDispatcher("/pages/profileSetting.jsp").forward(request, response);
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
