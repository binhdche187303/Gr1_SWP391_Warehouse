/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dashboardController;

import dao.DiscountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Discounts;

/**
 *
 * @author admin
 */
@WebServlet(name = "CouponList", urlPatterns = {"/couponlist"})
public class CouponList extends HttpServlet {

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
            out.println("<title>Servlet CouponList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CouponList at " + request.getContextPath() + "</h1>");
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
        DiscountDAO dd = new DiscountDAO();
        List<Discounts> listDiscounts = dd.getAllDiscounts();
        request.setAttribute("listDiscounts", listDiscounts);

        request.getRequestDispatcher("/dashboard/coupon-list.jsp").forward(request, response);
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
        try {
            // Lấy các tham số từ form
            int discountId = Integer.parseInt(request.getParameter("discount_id"));
            double discountPercentage = Double.parseDouble(request.getParameter("discount_percentage"));
            String status = request.getParameter("status");

            // Xử lý tham số max_uses có thể null
            String maxUsesStr = request.getParameter("max_uses");
            Integer maxUses = null;
            if (maxUsesStr != null && !maxUsesStr.trim().isEmpty()) {
                maxUses = Integer.parseInt(maxUsesStr);
            }
            // Tạo đối tượng DiscountDAO và cập nhật
            DiscountDAO discountDAO = new DiscountDAO();
            boolean updated = discountDAO.updateDiscount(discountId, discountPercentage, status, maxUses, 1);

            if (updated) {
                // Nếu cập nhật thành công, chuyển hướng về trang danh sách
                response.sendRedirect("couponlist");
            } else {
                // Nếu thất bại, đặt thông báo lỗi và hiển thị lại trang
                request.setAttribute("errorMessage", "Không thể cập nhật mã giảm giá. Mã có thể không tồn tại hoặc đã bị thay đổi.");
                doGet(request, response);
            }
        } catch (NumberFormatException e) {
            // Xử lý lỗi định dạng số
            request.setAttribute("errorMessage", "Định dạng đầu vào không hợp lệ. Vui lòng kiểm tra lại các giá trị.");
            doGet(request, response);
        } catch (SQLException e) {
            // Xử lý lỗi SQL
            request.setAttribute("errorMessage", "Lỗi cơ sở dữ liệu: " + e.getMessage());
            doGet(request, response);
        } catch (Exception e) {
            // Xử lý các lỗi khác
            request.setAttribute("errorMessage", "Đã xảy ra lỗi không mong muốn: " + e.getMessage());
            doGet(request, response);
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