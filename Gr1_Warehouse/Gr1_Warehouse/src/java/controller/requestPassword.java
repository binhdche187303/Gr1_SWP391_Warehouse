/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAOTokenForget;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import model.TokenForgetPassword;
import model.User;

/**
 *
 * @author Dell
 */
public class requestPassword extends HttpServlet {

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
            out.println("<title>Servlet requestPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet requestPassword at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/pages/forgot.jsp").forward(request, response);
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
        UserDAO UserDAO = new UserDAO();
        String email = request.getParameter("email");

        User user = UserDAO.getUserByEmail(email);
        if (user == null) {
            request.setAttribute("mess", "Email không tồn tại");
            request.getRequestDispatcher("/pages/forgot.jsp").forward(request, response);
            return;
        }

        resetService service = new resetService();
        String token = service.generateToken();
        String encodedToken = URLEncoder.encode(token, "UTF-8");
        String linkReset = "http://localhost:8080/Gr1_Warehouse/reset?token=" + encodedToken;

        TokenForgetPassword newTokenForget = new TokenForgetPassword(user.getUserId(), false, token, service.expireDateTime());

        System.out.println("Chèn mã thông báo vào cơ sở dữ liệu");
        DAOTokenForget daoToken = new DAOTokenForget();
        boolean isInserted = daoToken.insertTokenForget(newTokenForget);
        if (!isInserted) {
            System.out.println("Chèn mã thông báo không thành công"); 
            request.setAttribute("mess", "Đã xảy ra lỗi trên máy chủ");
            request.getRequestDispatcher("/pages/forgot.jsp").forward(request, response);
            return;
            
        }
        try {
            boolean isSent = service.sendEmail(email, linkReset, user.getUsername());
            if (!isSent) {
                throw new Exception("Không gửi được email."); // Ném lỗi nếu gửi email không thành công
            }
        } catch (Exception e) {
            System.out.println("Error occurred: " + e.getMessage()); // Ghi log lỗi
            request.setAttribute("mess", "Đã xảy ra lỗi trên máy chủ: " + e.getMessage());
            request.getRequestDispatcher("/pages/forgot.jsp").forward(request, response);
            return; 
        }

        request.setAttribute("mess", "Yêu cầu đã được gửi thành công");
        request.getRequestDispatcher("/pages/forgot.jsp").forward(request, response);

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
