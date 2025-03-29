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
@WebServlet(name = "ProfileSetting", urlPatterns = {"/profilesetting"})
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
        HttpSession session = request.getSession();
        UserDAO udao = new UserDAO();

// Kiểm tra user trong session
        User user = (User) session.getAttribute("acc");
        System.out.println("User trong session (acc): " + (user != null ? user.getUserId() : "null"));

        if (user == null) {
            response.sendRedirect("login");
            return;
        } else {
            // Lấy thông tin user từ database
            User userLogedIn = udao.getUserById(user.getUserId());
            System.out.println("User lấy từ DB: " + (userLogedIn != null ? userLogedIn.getUserId() : "null"));

            if (userLogedIn != null) {
                session.setAttribute("acc", userLogedIn); // Lưu User vào session
                System.out.println("Đã lưu user vào session với userId: " + userLogedIn.getUserId());
            }
        }

        String checkIdParam = request.getParameter("checkId");
        System.out.println("Received check_id: " + checkIdParam); // Kiểm tra giá trị check_id nhận được

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
            // Validate số điện thoại
            if (!isValidPhoneNumber(phone)) {
                request.setAttribute("errorprofile", "Số điện thoại không hợp lệ.");
                request.getRequestDispatcher("/dashboard/profile-setting.jsp").forward(request, response);
                return;
            } else {
                ud.updateUser(fullname, phone, address, Integer.parseInt(userID));
                request.setAttribute("successprofile", "Cập nhật hồ sơ thành công");
                request.getRequestDispatcher("/dashboard/profile-setting.jsp").forward(request, response);
                User nuser = ud.getUserById(u.getUserId());
                session.setAttribute("acc", nuser);
                request.getRequestDispatcher("/dashboard/profile-setting.jsp").forward(request, response);
            }
        } else //Change password
        {
            String currentpassword = request.getParameter("currentpassword");
            String newpassword = request.getParameter("newpassword");
            String confirmpassword = request.getParameter("confirmpassword");

            String hashedCurrentPassword = MD5Hash.hash(currentpassword);

            if (!hashedCurrentPassword.equals(u.getPassword())) {
                request.setAttribute("error", "Mật khẩu hiện tại không chính xác!");
                request.getRequestDispatcher("/dashboard/profile-setting.jsp").forward(request, response);
                return;
            }

            if (!newpassword.matches("^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&]).{8,}$")) {
                request.setAttribute("error", "Mật khẩu không đủ mạnh");
                request.getRequestDispatcher("/dashboard/profile-setting.jsp").forward(request, response);
                return;
            }

            if (!newpassword.equals(confirmpassword)) {
                request.setAttribute("error", "Mật khẩu mới và mật khẩu xác nhận không khớp!");
                request.getRequestDispatcher("/dashboard/profile-setting.jsp").forward(request, response);
                return;
            }
            String hashedNewPassword = MD5Hash.hash(newpassword);
            ud.updatePassword(u.getEmail(), newpassword);
            request.setAttribute("success", "Đổi mật khẩu thành công");
            User nuser = ud.getUserById(u.getUserId());
            session.setAttribute("acc", nuser);
            request.getRequestDispatcher("/dashboard/profile-setting.jsp").forward(request, response);
        }
    }

    // Phương thức kiểm tra số điện thoại
    private boolean isValidPhoneNumber(String phone) {
        // Kiểm tra null hoặc rỗng
        if (phone == null || phone.trim().isEmpty()) {
            return false;
        }

        // Loại bỏ khoảng trắng
        phone = phone.trim();

        // Kiểm tra chỉ chứa số
        if (!phone.matches("\\d+")) {
            return false;
        }

        // Kiểm tra độ dài 10 hoặc 11 số
        if (phone.length() != 10 && phone.length() != 11) {
            return false;
        }

        // Kiểm tra bắt đầu bằng số 0
        if (!phone.startsWith("0")) {
            return false;
        }

        return true;
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
