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
import model.Role;
import model.User;

/**
 *
 * @author Dell
 */
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
    // Handle GET requests to render the signup page
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/pages/signup.jsp").forward(request, response);
    }
    
    @Override
    // Handle POST requests to process the form data
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Lấy các tham số từ form đăng ký
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String fullname = request.getParameter("fullname");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");

    // Tạo đối tượng UserDAO
    UserDAO userDAO = new UserDAO();

    // Kiểm tra nếu email đã tồn tại trong hệ thống
    if (userDAO.isEmailExist(email)) {
        // Nếu email đã tồn tại, trả về thông báo lỗi và chuyển đến trang đăng ký
        request.setAttribute("error", "Email đã tồn tại. Vui lòng chọn email khác.");
        request.getRequestDispatcher("pages/signup.jsp").forward(request, response);
        return;
    }

    // Đăng ký người dùng mới
    boolean isSuccess = userDAO.register(username, password, fullname, phone, email, 2, "Active");

    if (isSuccess) {
        // Nếu đăng ký thành công, chuyển hướng người dùng đến trang đăng nhập
        response.sendRedirect("pages/login.jsp");
    } else {
        // Nếu đăng ký thất bại, trả về thông báo lỗi và giữ lại trang đăng ký
        request.setAttribute("error", "Đăng ký thất bại. Vui lòng thử lại.");
        // Dùng forward thay vì redirect để giữ lại dữ liệu và lỗi trên trang đăng ký
        request.getRequestDispatcher("pages/signup.jsp").forward(request, response);
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
