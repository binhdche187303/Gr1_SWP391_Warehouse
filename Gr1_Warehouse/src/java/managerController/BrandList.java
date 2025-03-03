/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package managerController;

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
public class BrandList extends HttpServlet {

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
            out.println("<title>Servlet BrandList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BrandList at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/manager/brand-list.jsp").forward(request, response);
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
        String brand_id_raw = request.getParameter("brand_id");
        String brand_name = request.getParameter("brand_name");
        try {
            int brand_id = Integer.parseInt(brand_id_raw);
            if (bd.isBrandNameExists(brand_name)) {
                request.setAttribute("brand_name", brand_name);
                List<Brands> listBrands = bd.getAllBrands();
                request.setAttribute("listBrands", listBrands);
                request.setAttribute("message", "Tên thương hiệu đã tồn tại");
                request.getRequestDispatcher("/manager/brand-list.jsp").forward(request, response);
            } else {
                bd.updateBrand(brand_id, brand_name);
                request.getSession().setAttribute("success", "Cập nhật tên thương hiệu thành công");
                response.sendRedirect("brandlist");
            }
        } catch (ServletException | IOException | NumberFormatException | SQLException e) {
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
