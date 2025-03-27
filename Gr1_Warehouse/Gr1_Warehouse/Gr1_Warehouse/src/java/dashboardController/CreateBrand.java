/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dashboardController;

import dao.BrandDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import model.Brands;

/**
 *
 * @author admin
 */
public class CreateBrand extends HttpServlet {

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
            out.println("<title>Servlet CreateBrand</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateBrand at " + request.getContextPath() + "</h1>");
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
        List<Brands> listBrands = bd.getAllBrands();
        request.setAttribute("listBrands", listBrands);
        request.getRequestDispatcher("/dashboard/create-brand.jsp").forward(request, response);
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
        BrandDAO bd = new BrandDAO();
        String brand_name = request.getParameter("brand_name");

        // Xử lý brand_name: loại bỏ khoảng trắng thừa
        String cleanedBrandName = brand_name.trim();

        try {
            if (bd.isBrandNameExists(cleanedBrandName)) {
                request.setAttribute("brand_name", brand_name);
                List<Brands> listBrands = bd.getAllBrands();
                request.setAttribute("listBrands", listBrands);
                request.setAttribute("message", "Tên thương hiệu đã tồn tại");
                request.getRequestDispatcher("/dashboard/create-brand.jsp").forward(request, response);
            } else {
                boolean success = bd.createBrand(cleanedBrandName);
                request.getSession().setAttribute("success", "Tạo thương hiệu mới thành công");
                response.sendRedirect("brandlist");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
            // Có thể thêm xử lý lỗi chi tiết hơn
            request.setAttribute("error", "Đã có lỗi xảy ra khi tạo thương hiệu");
            request.getRequestDispatcher("/dashboard/create-brand.jsp").forward(request, response);
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
