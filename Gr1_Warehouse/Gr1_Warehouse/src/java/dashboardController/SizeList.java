/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dashboardController;

import dao.SizeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import model.Sizes;

/**
 *
 * @author admin
 */
public class SizeList extends HttpServlet {

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
            out.println("<title>Servlet SizeList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SizeList at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/dashboard/size-list.jsp").forward(request, response);
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
        SizeDAO bd = new SizeDAO();
        String size_id_raw = request.getParameter("size_id");
        String size_name = request.getParameter("size_name");

        try {
            int size_id = Integer.parseInt(size_id_raw);

            // Loại bỏ khoảng trắng thừa và kiểm tra trùng tên
            String cleanedSizeName = size_name.replaceAll("\\s+", "").trim();

            if (bd.isSizeNameExists(size_id, cleanedSizeName)) {
                request.setAttribute("size_name", size_name);
                List<Sizes> listSizes = bd.getAllSizes();
                request.setAttribute("listSizes", listSizes);
                request.setAttribute("message", "Tên kích cỡ đã tồn tại");
                request.getRequestDispatcher("/dashboard/size-list.jsp").forward(request, response);
            } else {
                bd.updateSize(size_id, size_name);
                request.getSession().setAttribute("success", "Cập nhật tên kích cỡ thành công");
                response.sendRedirect("sizelist");
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
