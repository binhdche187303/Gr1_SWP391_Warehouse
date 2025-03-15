/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package managerController;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.SizeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import model.Categories;
import model.ProductVariants;
import model.Products;
import model.Sizes;

/**
 *
 * @author admin
 */
public class CreateProductVariants extends HttpServlet {

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
            out.println("<title>Servlet CreateProductVariants</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateProductVariants at " + request.getContextPath() + "</h1>");
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
        SizeDAO sd = new SizeDAO();
        List<Sizes> listSizes = sd.getAllSizes();
        request.setAttribute("listSizes", listSizes);
        request.getRequestDispatcher("/manager/create-product-variant.jsp").forward(request, response);
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
        ProductDAO pd = new ProductDAO();
        SizeDAO sd = new SizeDAO();
        List<Sizes> listSizes = sd.getAllSizes();
        request.setAttribute("listSizes", listSizes);
        String size_raw = request.getParameter("size");
        String sku = request.getParameter("sku");
        String price_raw = request.getParameter("price");

        try {
            BigDecimal price = new BigDecimal(price_raw);
            int size = Integer.parseInt(size_raw);
            if (pd.isSkuExists(sku)) {
                request.setAttribute("sku", sku);
                request.setAttribute("price", price);
                request.setAttribute("size", size);
                request.setAttribute("message", "Mã Sku đã tồn tại!");
                request.getRequestDispatcher("/manager/create-product-variant.jsp").forward(request, response);
            } else {
                ProductVariants pv = new ProductVariants();
                pv.setSku(sku);
                pv.setPrice(price);

                Sizes sizes = new Sizes();
                sizes.setSize_id(size);
                pv.setSize(sizes);
                List<ProductVariants> lp = new ArrayList<>();
                lp.add(pv);
                HttpSession session = request.getSession();
                Products product = (Products) session.getAttribute("product");
                product.setVariants(lp);
                pd.addNewProduct(product);
                session.setAttribute("success", "Tạo mới sản phẩm thành công!");
                response.sendRedirect("productdetail?product_id="+ product.getProductId());
            }
        } catch (ServletException | IOException | NumberFormatException e) {
            System.out.println(e);
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