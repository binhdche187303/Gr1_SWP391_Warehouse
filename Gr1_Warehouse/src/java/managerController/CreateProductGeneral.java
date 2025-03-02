/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package managerController;

import dao.BrandDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Brands;
import model.Categories;
import model.Products;

/**
 *
 * @author admin
 */
public class CreateProductGeneral extends HttpServlet {

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
            out.println("<title>Servlet CreateProductGeneral</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateProductGeneral at " + request.getContextPath() + "</h1>");
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
        BrandDAO bd = new BrandDAO();
        CategoryDAO cd = new CategoryDAO();
        List<Brands> listBrands = bd.getAllBrands();
        List<Categories> listCategories = cd.getAllCategories();
        request.setAttribute("listBrands", listBrands);
        request.setAttribute("listCategories", listCategories);
        request.getRequestDispatcher("/manager/create-product-general.jsp").forward(request, response);
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
        String product_name = request.getParameter("product_name");
        String brand_id_raw = request.getParameter("brand");
        String origin = request.getParameter("origin");
        String category_id_raw = request.getParameter("category");
        String description = request.getParameter("description");
        try {
            int brand_id = Integer.parseInt(brand_id_raw);
            int category_id = Integer.parseInt(category_id_raw);
            Products p = new Products();
            p.setProductName(product_name);

            Brands brand = new Brands();
            brand.setBrand_id(brand_id);
            p.setBrand(brand);

            Categories category = new Categories();
            category.setCategory_id(category_id);
            p.setOrigin(origin);
            p.setCate(category);
            p.setDescription(description);

            if (pd.isProductNameExists(product_name)) {
                request.setAttribute("product_name", product_name);
                request.setAttribute("brand", brand);
                request.setAttribute("origin", origin);
                request.setAttribute("category", category);
                request.setAttribute("description", description);
                request.setAttribute("message", "Tên sản phẩm đã tồn tại!");
                BrandDAO bd = new BrandDAO();
                CategoryDAO cd = new CategoryDAO();
                List<Brands> listBrands = bd.getAllBrands();
                List<Categories> listCategories = cd.getAllCategories();
                request.setAttribute("listBrands", listBrands);
                request.setAttribute("listCategories", listCategories);
                request.getRequestDispatcher("/manager/create-product-general.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("product", p);
                session.setAttribute("progress", 33);
                System.out.println(p.getProductName());
                response.sendRedirect("createproductimg");
            }

        } catch (NumberFormatException e) {
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
