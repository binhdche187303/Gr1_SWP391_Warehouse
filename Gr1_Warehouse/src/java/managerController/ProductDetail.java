/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package managerController;

import dao.BrandDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import dao.SizeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import model.Brands;
import model.Categories;
import model.Images;
import model.Products;
import model.Sizes;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author admin
 */
public class ProductDetail extends HttpServlet {

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
            out.println("<title>Servlet ProductDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetail at " + request.getContextPath() + "</h1>");
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
        ProductDAO pd = new ProductDAO();
        BrandDAO bd = new BrandDAO();
        CategoryDAO cd = new CategoryDAO();
        SizeDAO sd = new SizeDAO();
        String product_id_raw = request.getParameter("product_id");
        try {
            int product_id = Integer.parseInt(product_id_raw);
            Products p = pd.getDetails(product_id);
            List<Brands> listBrands = bd.getAllBrands();
            List<Categories> listCategories = cd.getAllCategories();
            List<Sizes> listSizes = sd.getAllSizes();
            request.setAttribute("product", p);
            request.setAttribute("listBrands", listBrands);
            request.setAttribute("listCategories", listCategories);
            request.setAttribute("listSizes", listSizes);
            request.getRequestDispatcher("/manager/product_detail.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
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
        String action = request.getParameter("action");
        ProductDAO pd = new ProductDAO();
        BrandDAO bd = new BrandDAO();
        CategoryDAO cd = new CategoryDAO();
        if ("edit".equals(action)) {
            try {
                String productId_raw = request.getParameter("productId");
                int productId = Integer.parseInt(productId_raw);
                String productName = request.getParameter("productname");
                String description = request.getParameter("description");
                String origin = request.getParameter("origin");
                String brandId_raw = request.getParameter("brand");
                int brandId = Integer.parseInt(brandId_raw);
                String categoryId_raw = request.getParameter("category");
                int categoryId = Integer.parseInt(categoryId_raw);

                boolean isUpdated = pd.updateProduct(productId, productName, description, origin, brandId, categoryId);

                if (isUpdated) {
                    request.getSession().setAttribute("success", "Cập nhật thành công");
                    response.sendRedirect("productdetail?product_id=" + productId);
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        } else if ("editprice".equals(action)) {
            try {
                // Lấy thông tin từ form
                int variantId = Integer.parseInt(request.getParameter("variant_id"));
                BigDecimal price = new BigDecimal(request.getParameter("price"));

                // Validate dữ liệu
                if (price.compareTo(BigDecimal.ZERO) <= 0) {
                    // Giá không hợp lệ
                    request.setAttribute("errorMessage", "Giá phải lớn hơn 0");
                }

                // Sử dụng hàm updatePrice đã có
                boolean success = pd.updatePrice(variantId, price);
                int productId = pd.getProductIdFromVariant(variantId);
                if (success) {
                    request.getSession().setAttribute("success", "Cập nhật thành công");
                    response.sendRedirect("productdetail?product_id=" + productId);
                }

            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        } else if ("addprice".equals(action)) {
            try {
                String product_id_raw = request.getParameter("product_id");
                String size_id_raw = request.getParameter("size");
                BigDecimal price = new BigDecimal(request.getParameter("price"));
                String sku = request.getParameter("sku");
                int product_id = Integer.parseInt(product_id_raw);
                int size_id = Integer.parseInt(size_id_raw);
                // Validate dữ liệu
                if (price.compareTo(BigDecimal.ZERO) <= 0) {
                    // Giá không hợp lệ
                    request.setAttribute("errorMessage", "Giá phải lớn hơn 0");
                }

                boolean success = pd.addProductVariant(product_id, size_id, price, sku);
                System.out.println(product_id);
                System.out.println(size_id);
                System.out.println(price);
                System.out.println(sku);
                System.out.println(success);
                if (success) {
                    request.getSession().setAttribute("success", "Thêm mới thành công");
                } else {
                    request.getSession().setAttribute("errorMessage", "Thêm mới thất bại do mã SKU đã tồn tại");
                    request.getSession().setAttribute("sku", sku);
                    request.getSession().setAttribute("price", price);
                    request.getSession().setAttribute("size", size_id);
                    request.getSession().setAttribute("success", "Thêm mới thất bại do mã sku đã tồn tại");
                }
                response.sendRedirect("productdetail?product_id=" + product_id);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        } else if ("editimage".equals(action)) {
            try {
                // Lấy product_id từ request
                int productId = Integer.parseInt(request.getParameter("product_id"));

                // Lấy danh sách ảnh từ form gửi lên dưới dạng JSON
                String imagesListJson = request.getParameter("imagesList");
                List<Images> updatedImages = new ArrayList<>();

                // Nếu có dữ liệu JSON từ client
                if (imagesListJson != null && !imagesListJson.isEmpty()) {
                    try {
                        // Parse JSON string thành danh sách đối tượng Images
                        // Giả sử bạn có một lớp tiện ích JsonParser hoặc sử dụng thư viện JSON như Gson
                        JSONArray imagesArray = new JSONArray(imagesListJson);

                        for (int i = 0; i < imagesArray.length(); i++) {
                            JSONObject imageObj = imagesArray.getJSONObject(i);

                            Images image = new Images();
                            image.setImage_url("assets/images/img_products/"+ imageObj.getString("image_url"));
                            updatedImages.add(image);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        // Xử lý lỗi khi parse JSON
                    }
                }

                boolean success = pd.updateProductImages(updatedImages, productId);

                if (success) {
                    request.getSession().setAttribute("success", "Thêm mới thành công");
                } else {
                    request.getSession().setAttribute("success", "Thêm mới thất bại");
                }

                response.sendRedirect("productdetail?product_id=" + productId);

            } catch (NumberFormatException e) {
                System.out.println(e);
            } catch (IOException e) {
                System.out.println(e);
            }
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
