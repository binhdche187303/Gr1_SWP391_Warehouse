package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dao.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author HP
 */
public class UpdateCartController extends HttpServlet {

    private CartDAO cartDAO;

    @Override
    public void init() {
        cartDAO = new CartDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        String productIdPara = request.getParameter("productId");
        int userId = user.getUserId();
        String quantityPara = request.getParameter("quantity");
        String sizeIdPara = request.getParameter("sizeId");
        try {
            int productId = Integer.parseInt(productIdPara);
            int quantity = Integer.parseInt(quantityPara);
            int sizeId = Integer.parseInt(sizeIdPara);
            boolean updateSuccess = cartDAO.updateCartQuantity(productId, quantity, userId, sizeId);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"success\": " + updateSuccess + "}");
        } catch (Exception e) {
            System.out.println(e);
        }

    }
}
