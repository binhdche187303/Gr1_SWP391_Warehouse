/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;
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
import java.io.BufferedReader;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Cart;
import model.ProductVariants;
import model.Products;
import model.User;

/**
 *
 * @author HP
 */
public class CheckoutController extends HttpServlet {

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
            out.println("<title>Servlet CheckoutController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutController at " + request.getContextPath() + "</h1>");
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
        SizeDAO sizeDAO = new SizeDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        int userId = user.getUserId();
        List<Cart> cartItems = (List<Cart>) session.getAttribute("cart_to_checkout");
        request.setAttribute("user", user);
        request.setAttribute("cartItems", cartItems);
        request.getRequestDispatcher("pages/checkout.jsp").forward(request, response);
    }

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            JsonObject jsonData = gson.fromJson(reader, JsonObject.class);

            if (jsonData == null || !jsonData.has("type") || !jsonData.has("items")) {
                response.getWriter().write("{\"status\": \"error\", \"message\": \"Dữ liệu không đầy đủ.\"}");
                return;
            }

            String type = jsonData.get("type").getAsString();
            JsonArray itemsArray = jsonData.getAsJsonArray("items");
            List<Cart> items = new ArrayList<>();

            for (JsonElement item : itemsArray) {
                JsonObject obj = item.getAsJsonObject();
                int productId = obj.get("productId").getAsInt();
                int sizeId = obj.get("sizeId").getAsInt();
                items.add(new Cart(productId, sizeId));
            }

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("acc");

            if (user == null) {
                response.sendRedirect("login");
                return;
            }

            ProductDAO productDao = new ProductDAO();
            CartDAO cartDAO = new CartDAO();
            List<Cart> carts = new ArrayList<>();

            if (type.equals("cart")) {
                List<Cart> cartOfUser = cartDAO.getCartByUserId(user.getUserId());
                for (Cart cart : cartOfUser) {
                    for (Cart item : items) {
                        if (item.getProductId() == cart.getProductId() && item.getSizeId() == cart.getSizeId()) {
                            int stock = productDao.getStockByProductIdAndSize(cart.getProductId(), cart.getSizeId());

                            if (stock < cart.getQuantity()) {
                                response.getWriter().write("{\"status\": \"error\", \"message\": \"Số lượng tồn kho không đủ cho sản phẩm: "
                                        + cart.getProductName() + " " + cart.getSizeName() + "\", \"stock\": " + stock + "}");
                                return;
                            }

                            boolean isDuplicate = carts.stream()
                                    .anyMatch(c -> c.getProductId() == cart.getProductId() && c.getSizeId() == cart.getSizeId());
                            if (!isDuplicate) {
                                carts.add(cart);
                            }
                        }
                    }
                }
            } else {
                // Mua trực tiếp
                int productId = items.get(0).getProductId();
                int sizeId = items.get(0).getSizeId();
                int quantity = jsonData.get("quantity").getAsInt();
                int stock = productDao.getStockByProductIdAndSize(productId, sizeId);

                if (stock < quantity) {
                    response.getWriter().write("{\"status\": \"error\", \"message\": \"Số lượng tồn kho không đủ\", \"stock\": " + stock + "}");
                    return;
                }

                Products product = productDao.getProductByIdAndSizeId(productId, sizeId);
                if (product != null) {
                    String sizeName = "";
                    double price = 0;
                    for (ProductVariants pv : product.getVariants()) {
                        if (pv.getSizeId() == sizeId) {
                            sizeName = pv.getSize().getSize_name();
                            price = pv.getPrice().doubleValue();
                        }
                    }

                    Cart cart = new Cart(0, productId, product.getProductName(), sizeId, sizeName, price, quantity, product.getImages().get(0).getImage_url());
                    boolean isDuplicate = carts.stream()
                            .anyMatch(c -> c.getProductId() == productId && c.getSizeId() == sizeId);
                    if (!isDuplicate) {
                        carts.add(cart);
                    }
                }
            }

            session.removeAttribute("cart_to_checkout");
            session.setAttribute("cart_to_checkout", carts);
            response.getWriter().write("{\"status\": \"success\"}");

        } catch (Exception e) {
            response.getWriter().write("{\"status\": \"error\", \"message\": \"Đã xảy ra lỗi: " + e.getMessage() + "\"}");
            e.printStackTrace();
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
