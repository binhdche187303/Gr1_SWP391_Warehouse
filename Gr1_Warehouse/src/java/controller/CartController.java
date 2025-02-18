/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CartDAO;
import dao.ProductDAO;
import dao.SizeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Cart;
import model.ProductVariants;
import model.User;

/**
 *
 * @author HP
 */
public class CartController extends HttpServlet {

    private CartDAO cartDAO;

    @Override
    public void init() throws ServletException {
        cartDAO = new CartDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Kiểm tra đăng nhập
        SizeDAO sizeDAO = new SizeDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        int userId = user.getUserId();
        List<Cart> cartItems = cartDAO.getCartByUserId(userId);
        Map<Integer, List<ProductVariants>> sizeOptions = new HashMap<>();

        for (Cart item : cartItems) {
            sizeOptions.put(item.getProductId(), sizeDAO.getSizesByProductId(item.getProductId()));
        }
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("sizeOptions", sizeOptions);
        request.setAttribute("cartItems", cartItems);
        request.getRequestDispatcher("pages/cart.jsp").forward(request, response);
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
        ProductDAO productDao = new ProductDAO();
        int userId = user.getUserId();
        int productId = Integer.parseInt(request.getParameter("productId"));
        int sizeId = Integer.parseInt(request.getParameter("size"));
        int stock = productDao.getStockByProductIdAndSize(productId, sizeId);
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        System.out.println("Received - Product ID: " + productId + ", Size ID: " + sizeId + ", Quantity: " + quantity);
        if (quantity > stock) {
            response.sendRedirect("cart?type=outOfStock");
        } else {
            cartDAO.addToCart(userId, productId, sizeId, quantity);
            response.sendRedirect("cart");
            
        }
    }

}
