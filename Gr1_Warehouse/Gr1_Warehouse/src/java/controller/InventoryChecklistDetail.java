/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.InventoryDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.InventoryCheck;
import model.InventoryCheckDetailDTO;
import model.User;

/**
 *
 * @author Huy Nam
 */
public class InventoryChecklistDetail extends HttpServlet {

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
            out.println("<title>Servlet InventoryChecklistDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InventoryChecklistDetail at " + request.getContextPath() + "</h1>");
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
                session.setAttribute("user", userLogedIn); // Lưu User vào session
                System.out.println("Đã lưu user vào session với userId: " + userLogedIn.getUserId());
            }
        }

        String checkIdParam = request.getParameter("checkId");
        System.out.println("Received check_id: " + checkIdParam); // Kiểm tra giá trị check_id nhận được

        InventoryDAO dao = new InventoryDAO();

        try {
            int checkId = Integer.parseInt(checkIdParam);
            List<InventoryCheckDetailDTO> list = dao.getInventoryCheckDetail(checkId);
            InventoryCheck check = dao.getInventoryCheckDetails(checkId);
            request.setAttribute("idlist", list);
            request.setAttribute("check", check);
            request.getRequestDispatcher("manager/inventory_checklist_detail.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println("Error parsing check_id: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Exception occurred: " + e.getMessage());
            e.printStackTrace();
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
        processRequest(request, response);
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