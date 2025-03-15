/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package managerController;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Images;
import model.Products;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author admin
 */
public class CreateProductImg extends HttpServlet {

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
            out.println("<title>Servlet CreateProductImg</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateProductImg at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/manager/create-product-img.jsp").forward(request, response);
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
            // Lấy danh sách ảnh từ form
            String imagesListJson = request.getParameter("imagesList");
            System.out.println("Received JSON: " + imagesListJson);

            List<Images> updatedImages = new ArrayList<>();

            // Nếu có dữ liệu JSON từ client
            if (imagesListJson != null && !imagesListJson.isEmpty()) {
                try {
                    // Parse JSON string thành danh sách đối tượng Images
                    JSONArray imagesArray = new JSONArray(imagesListJson);
                    for (int i = 0; i < imagesArray.length(); i++) {
                        JSONObject imageObj = imagesArray.getJSONObject(i);
                        Images image = new Images();

                        // Lấy đường dẫn ảnh đầy đủ
                        image.setImage_url("assets/images/img_products/" + imageObj.getString("image_url"));

                        updatedImages.add(image);
                        System.out.println("Added image: " + image.getImage_url());
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    System.out.println("Error parsing JSON: " + e.getMessage());
                }
            } else {
                System.out.println("No image list JSON received");
            }

            // Lấy product từ session
            HttpSession session = request.getSession();
            Products product = (Products) session.getAttribute("product");

            if (product == null) {
                System.out.println("Product is null in session - creating new product");
                product = new Products();
                session.setAttribute("product", product);
            }

            // Set the images to the product
            product.setImages(updatedImages);

            // Debug: Kiểm tra số lượng ảnh
            System.out.println("Number of images: " + updatedImages.size());
            if (!updatedImages.isEmpty()) {
                System.out.println("First image URL: " + updatedImages.get(0).getImage_url());
            }

            // Lưu lại vào session
            session.setAttribute("product", product);
            response.sendRedirect("createproductvariants");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("General error: " + e.getMessage());
            response.sendRedirect("error.jsp");
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