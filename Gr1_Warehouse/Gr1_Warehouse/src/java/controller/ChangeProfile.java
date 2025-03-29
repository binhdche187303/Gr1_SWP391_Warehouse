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
import model.WholesaleCustomer;

/**
 *
 * @author admin
 */
public class ChangeProfile extends HttpServlet {

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
            out.println("<title>Servlet ChangeUserSettingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeUserSettingServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    private UserDAO userDAO;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public void init() throws ServletException {
        if (this.userDAO == null) {
            this.userDAO = new UserDAO();
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
        String name = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String storeName = request.getParameter("storeName");
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");
        // Kiểm tra session hợp lệ
        if (u == null) {
            System.out.println("Session invalid - redirecting to login.");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Kiểm tra các trường không được để trống
        if (name == null || name.trim().isEmpty()
                || phone == null || phone.trim().isEmpty()
                || address == null || address.trim().isEmpty()) {
            System.out.println("Validation failed: Missing required fields.");
            request.setAttribute("errorprofile", "Vui lòng điền đầy đủ thông tin.");
            WholesaleCustomer wholesaleCustomer = userDAO.getWholesaleCustomersById(u.getUserId());
            request.setAttribute("wholesaleCustomer", wholesaleCustomer);
            request.getRequestDispatcher("/pages/profileSetting.jsp").forward(request, response);
            return;
        }

        // Kiểm tra định dạng số điện thoại
        String phonePattern = "^(0|\\+84)[0-9]{9}$";
        if (!phone.matches(phonePattern)) {
            System.out.println("Validation failed: Số điện thoại không hợp lệ.");
            request.setAttribute("errorprofile", "Số điện thoại không hợp lệ.");
            WholesaleCustomer wholesaleCustomer = userDAO.getWholesaleCustomersById(u.getUserId());
            request.setAttribute("wholesaleCustomer", wholesaleCustomer);
            request.getRequestDispatcher("/pages/profileSetting.jsp").forward(request, response);
            return;
        }

        // Kiểm tra độ dài các trường
        if (name.length() > 100) {
            System.out.println("Validation failed: Họ tên không được vượt quá 100 ký tự.");
            request.setAttribute("errorprofile", "Họ tên không được vượt quá 100 ký tự.");
            WholesaleCustomer wholesaleCustomer = userDAO.getWholesaleCustomersById(u.getUserId());
            request.setAttribute("wholesaleCustomer", wholesaleCustomer);
            request.getRequestDispatcher("/pages/profileSetting.jsp").forward(request, response);
            return;
        }

        if (address.length() > 255) {
            System.out.println("Validation failed: Địa chỉ không được vượt quá 255 ký tự.");
            request.setAttribute("errorprofile", "Địa chỉ không được vượt quá 255 ký tự.");
            WholesaleCustomer wholesaleCustomer = userDAO.getWholesaleCustomersById(u.getUserId());
            request.setAttribute("wholesaleCustomer", wholesaleCustomer);
            request.getRequestDispatcher("/pages/profileSetting.jsp").forward(request, response);
            return;
        }

        // Cập nhật thông tin người dùng
        //UserDAO ud = new UserDAO();
        if (!userDAO.updateUser(name, phone, address, storeName, u.getUserId())) {
            request.setAttribute("errorprofile", "Cập nhật thông tin thất bại. Vui lòng thử lại.");
            WholesaleCustomer wholesaleCustomer = userDAO.getWholesaleCustomersById(u.getUserId());
            request.setAttribute("wholesaleCustomer", wholesaleCustomer);
            request.getRequestDispatcher("/pages/profileSetting.jsp").forward(request, response);
            return;
        }

        // Cập nhật session và thông báo thành công
        User nuser = userDAO.getUserById(u.getUserId());
        session.setAttribute("acc", nuser);
        System.out.println("User updated in session. UserID: " + nuser.getUserId());
        WholesaleCustomer wholesaleCustomer = userDAO.getWholesaleCustomersById(u.getUserId());
        request.setAttribute("wholesaleCustomer", wholesaleCustomer);
        request.setAttribute("successprofile", "Thông tin cá nhân đã được cập nhật thành công.");
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
