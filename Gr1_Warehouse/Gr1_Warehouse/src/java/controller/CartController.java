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
import model.Categories;
import model.ProductVariants;
import model.User;
import java.net.URLEncoder;

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
        ProductDAO productDAO = new ProductDAO();
        List<Categories> categories = productDAO.getAllCategory();
        request.setAttribute("category", categories);
        int userId = user.getUserId();
        List<Cart> cartItems = cartDAO.getCartByUserId(userId);
        Map<Integer, List<ProductVariants>> sizeOptions = new HashMap<>();

        for (Cart item : cartItems) {
            sizeOptions.put(item.getProductId(), sizeDAO.getSizesByProductId(item.getProductId()));
        }
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("sizeOptions", sizeOptions);
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
        CartDAO cartDAO = new CartDAO(); // Cần đảm bảo CartDAO được khởi tạo đúng
        int userId = user.getUserId();
        int productId = Integer.parseInt(request.getParameter("productId"));
        int sizeId = Integer.parseInt(request.getParameter("size"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Kiểm tra tồn kho
        int stock = productDao.getStockByProductIdAndSize(productId, sizeId);
        System.out.println("Received - Product ID: " + productId + ", Size ID: " + sizeId + ", Quantity: " + quantity);

        // Lấy giỏ hàng hiện tại của người dùng
        List<Cart> cartItems = cartDAO.getCartByUserId(userId);

        // Kiểm tra số lượng sản phẩm trong giỏ hàng
        int totalQuantityInCart = 0;
        for (Cart item : cartItems) {
            if (item.getProductId() == productId && item.getSizeId() == sizeId) {
                totalQuantityInCart += item.getQuantity();
            }
        }

        // Tính số lượng tối đa có thể thêm vào giỏ hàng
        int maxQuantity = stock - totalQuantityInCart;

        // Nếu số lượng yêu cầu vượt quá tồn kho, set lại thành số lượng tối đa có thể thêm vào giỏ
        if (quantity > maxQuantity) {
            quantity = maxQuantity; // Cập nhật lại số lượng giỏ hàng với số lượng tối đa có thể thêm
            // Thêm thông báo vào request để hiển thị trong cart.jsp
            request.setAttribute("quantityExceeded", "Số lượng bạn yêu cầu vượt quá số lượng tồn kho. Giỏ hàng đã được điều chỉnh về số lượng tối đa có thể thêm.");
        }

        // Kiểm tra nếu số lượng muốn thêm vượt quá tồn kho
        if (quantity > stock) {
            response.sendRedirect("cart?type=outOfStock");
        } else {
            // Cập nhật giỏ hàng nếu không vượt quá số lượng tồn kho
            cartDAO.addToCart(userId, productId, sizeId, quantity);
            response.sendRedirect("cart");
        }
    }

}
