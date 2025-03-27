/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dashboardController;

import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import model.Categories;

/**
 *
 * @author admin
 */
public class CategoryList extends HttpServlet {

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
            out.println("<title>Servlet CategoryList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryList at " + request.getContextPath() + "</h1>");
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
        CategoryDAO cd = new CategoryDAO();
        List<Categories> listCategories = cd.getAllCategories();
        request.setAttribute("listCategories", listCategories);
        request.getRequestDispatcher("/dashboard/category-list.jsp").forward(request, response);
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
        CategoryDAO cd = new CategoryDAO();
        String category_id_raw = request.getParameter("category_id");
        String category_name = request.getParameter("category_name");

        try {
            int category_id = Integer.parseInt(category_id_raw);

            // Loại bỏ khoảng trắng thừa và kiểm tra trùng tên
            String cleanedCategoryName = category_name.replaceAll("\\s+", "").trim();

            if (cd.isCategoryNameExists(category_id, cleanedCategoryName)) {
                request.setAttribute("category_name", category_name);
                List<Categories> listCategories = cd.getAllCategories();
                request.setAttribute("listCategories", listCategories);
                request.setAttribute("message", "Tên thể loại đã tồn tại");
                request.getRequestDispatcher("/dashboard/category-list.jsp").forward(request, response);
            } else {
                cd.updateCategory(category_id, category_name);
                request.getSession().setAttribute("success", "Cập nhật tên thể loại thành công");
                response.sendRedirect("categorylist");
            }
        } catch (NumberFormatException | SQLException e) {
             System.out.println(e);
            // Xử lý lỗi phù hợp
            request.setAttribute("error", "Đã có lỗi xảy ra");
            request.getRequestDispatcher("/dashboard/category-list.jsp").forward(request, response);
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
