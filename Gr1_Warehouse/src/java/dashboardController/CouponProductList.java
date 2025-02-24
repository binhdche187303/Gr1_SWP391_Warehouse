/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dashboardController;

import com.google.gson.Gson;
import dao.DiscountProductDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.DiscountProduct;
import model.Products;

/**
 *
 * @author admin
 */
public class CouponProductList extends HttpServlet {

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
            out.println("<title>Servlet CouponProductList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CouponProductList at " + request.getContextPath() + "</h1>");
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
        DiscountProductDAO dpd = new DiscountProductDAO();
        ProductDAO pd = new ProductDAO();
        List<DiscountProduct> list = dpd.getAllDiscountsProduct();
        List<Products> listProduct = pd.getAllProducts();
        request.setAttribute("list", list);
        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("/dashboard/coupon-product-list.jsp").forward(request, response);
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
        String subName = request.getParameter("sub_name");
        ProductDAO productDAO = new ProductDAO();
        List<Products> products = productDAO.getProductsByName(subName);

        // Add debug logging
        System.out.println("Search term: " + subName);
        System.out.println("Found products: " + products.size());

        String isAjax = request.getHeader("X-Requested-With");

        if ("XMLHttpRequest".equals(isAjax)) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            String json = new Gson().toJson(products);
            // Debug the JSON output
            System.out.println("JSON response: " + json);
            response.getWriter().write(json);
        } else {
            request.setAttribute("listProduct", products);
            request.getRequestDispatcher("/dashboard/coupon-product-list.jsp").forward(request, response);
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
