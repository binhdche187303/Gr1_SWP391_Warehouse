/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package dashboardController;

import dao.InventoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import org.json.JSONObject;

/**
 *
 * @author Huy Nam
 */
public class BalanceStock extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet BalanceStock</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BalanceStock at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JSONObject jsonResponse = new JSONObject();

        try {
            // Đọc dữ liệu JSON từ request
            BufferedReader reader = request.getReader();
            StringBuilder jsonBuilder = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                jsonBuilder.append(line);
            }
            JSONObject jsonRequest = new JSONObject(jsonBuilder.toString());

            // Kiểm tra dữ liệu hợp lệ
            if (!jsonRequest.has("checkId")) {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Thiếu checkId");
                response.getWriter().write(jsonResponse.toString());
                return;
            }

            int checkId = jsonRequest.getInt("checkId");

            // Gọi DAO để cập nhật tồn kho
            InventoryDAO dao = new InventoryDAO();
            boolean updateSuccess = dao.updateStockFromInventoryCheck(checkId);

            if (updateSuccess) {
                dao.updateInventoryCheckBalance(checkId);
                jsonResponse.put("success", true);
                jsonResponse.put("message", "Cập nhật tồn kho và trạng thái thành công!");
            } else {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Cập nhật số lượng thất bại!");
            }

        } catch (Exception e) {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Lỗi xử lý: " + e.getMessage());
        }

        // Trả về JSON response
        response.getWriter().write(jsonResponse.toString());
    
    
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
