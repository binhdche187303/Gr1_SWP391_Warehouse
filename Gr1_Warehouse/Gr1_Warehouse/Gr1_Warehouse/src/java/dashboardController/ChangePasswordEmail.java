/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dashboardController;

import dao.UserDAO;
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
public class ChangePasswordEmail extends HttpServlet {

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
            out.println("<title>Servlet ChangePasswordEmail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordEmail at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/pages/changePassword.jsp").forward(request, response);
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
        String identifier = request.getParameter("identifier");
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String confirmpass = request.getParameter("confirmpass");

        // Kiểm tra các trường nhập liệu
        if (identifier == null || identifier.trim().isEmpty()
                || oldpass == null || oldpass.trim().isEmpty()
                || newpass == null || newpass.trim().isEmpty()
                || confirmpass == null || confirmpass.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng điền đầy đủ thông tin!");
            request.getRequestDispatcher("/pages/changePassword.jsp").forward(request, response);
            return;
        }

        // Kiểm tra mật khẩu mới và mật khẩu xác nhận có khớp không
        if (!newpass.equals(confirmpass)) {
            request.setAttribute("identifier", identifier);
            request.setAttribute("error", "Mật khẩu xác nhận không khớp với mật khẩu mới!");
            request.getRequestDispatcher("/pages/changePassword.jsp").forward(request, response);
            return;
        }

        // Kiểm tra mật khẩu cũ có đúng không
        boolean isValidUser = ud.validateUser(identifier, oldpass);
        if (!isValidUser) {
            request.setAttribute("identifier", identifier);
            request.setAttribute("error", "Email/tên đăng nhập hoặc mật khẩu không đúng!");
            request.getRequestDispatcher("/pages/changePassword.jsp").forward(request, response);
            return;
        }

        if (!newpass.matches("^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&]).{8,}$")) {
            request.setAttribute("identifier", identifier);
            request.setAttribute("error", "Mật khẩu không đủ mạnh");
            request.getRequestDispatcher("/pages/changePassword.jsp").forward(request, response);
            return;
        }

        // Kiểm tra mật khẩu mới có giống mật khẩu cũ không
        if (oldpass.equals(newpass)) {
            request.setAttribute("identifier", identifier);
            request.setAttribute("error", "Mật khẩu mới không được trùng với mật khẩu cũ!");
            request.getRequestDispatcher("/pages/changePassword.jsp").forward(request, response);
            return;
        }

        // Thực hiện thay đổi mật khẩu
        boolean changeSuccess = ud.changePassword(identifier, newpass);
        if (changeSuccess) {
            request.getSession().setAttribute("success", "Thay đổi mật khẩu thành công. Vui lòng đăng nhập.");
            response.sendRedirect("login");
        } else {
            request.setAttribute("error", "Đã xảy ra lỗi khi cập nhật mật khẩu!");
            request.getRequestDispatcher("/pages/changePassword.jsp").forward(request, response);
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
