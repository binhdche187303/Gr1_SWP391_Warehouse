/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Role;
import model.User;
import ulti.MD5Hash;

/**
 *
 * @author Dell
 */
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // Thêm phương thức này để sử dụng trong Unit Test
    private UserDAO userDAO;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
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
    // Handle GET requests to render the signup page
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/pages/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String storeName = request.getParameter("storeName");
        String storeAddress = request.getParameter("storeAddress");
        String taxCode = request.getParameter("taxCode");
        String businessLicense = request.getParameter("businessLicense");

        System.out.println("📌 Nhận dữ liệu đăng ký:");
        System.out.println("Username: " + username);
        System.out.println("Password: " + password);
        System.out.println("Fullname: " + fullname);
        System.out.println("Phone: " + phone);
        System.out.println("Email: " + email);
        System.out.println("Store Name: " + storeName);
        System.out.println("Store Address: " + storeAddress);
        System.out.println("Tax Code: " + taxCode);
        System.out.println("Business License: " + businessLicense);

        boolean hasError = false;

        // Lưu các giá trị đã nhập vào request để hiển thị lại khi có lỗi
        request.setAttribute("username", username);
        request.setAttribute("password", ""); // Không lưu lại mật khẩu vì lý do bảo mật
        request.setAttribute("fullname", fullname);
        request.setAttribute("phone", phone);
        request.setAttribute("email", email);
        request.setAttribute("storeName", storeName);
        request.setAttribute("storeAddress", storeAddress);
        request.setAttribute("taxCode", taxCode);
        request.setAttribute("businessLicense", businessLicense);

        // Kiểm tra email đúng định dạng
        if (email == null || !email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$")) {
            request.setAttribute("errorEmail", "Email không đúng định dạng.");
            System.out.println("❌ Lỗi: Email không đúng định dạng.");
            hasError = true;
        }

        // Kiểm tra mật khẩu đúng định dạng
        if (password == null || !password.matches("^(?=.*[A-Z])(?=.*[!@#$%^&*])(?=.*[0-9]).{8,}$")) {
            request.setAttribute("errorPassword", "Mật khẩu phải có ít nhất 1 chữ in hoa, 1 ký tự đặc biệt, 1 số, tối thiểu 8 ký tự.");
            System.out.println("❌ Lỗi: Mật khẩu không hợp lệ.");
            hasError = true;
        }

        // Kiểm tra username không được để trống
        if (username == null || username.trim().isEmpty()) {
            request.setAttribute("errorUsername", "Tên người dùng không được để trống.");
            System.out.println("❌ Lỗi: Username không được để trống.");
            hasError = true;
        }

        // Kiểm tra fullname không được để trống
        if (fullname == null || fullname.trim().isEmpty()) {
            request.setAttribute("errorFullname", "Tên đầy đủ không được để trống.");
            System.out.println("❌ Lỗi: Fullname không được để trống.");
            hasError = true;
        }

        // Kiểm tra số điện thoại đúng định dạng
        if (phone == null || !phone.matches("^0[0-9]{9,10}$")) {
            request.setAttribute("errorPhone", "Số điện thoại không đúng định dạng.");
            System.out.println("❌ Lỗi: Số điện thoại không hợp lệ.");
            hasError = true;
        }

        // Kiểm tra tên cửa hàng không được để trống
        if (storeName == null || storeName.trim().isEmpty()) {
            request.setAttribute("errorStoreName", "Tên cửa hàng không được để trống.");
            System.out.println("❌ Lỗi: Store name không được để trống.");
            hasError = true;
        }

        // Kiểm tra địa chỉ cửa hàng không được để trống
        if (storeAddress == null || storeAddress.trim().isEmpty()) {
            request.setAttribute("errorStoreAddress", "Địa chỉ cửa hàng không được để trống.");
            System.out.println("❌ Lỗi: Store address không được để trống.");
            hasError = true;
        }

        // Kiểm tra định dạng mã số thuế
        if (taxCode == null || !taxCode.matches("^[0-9]{10,13}$")) {
            request.setAttribute("errorTaxCode", "Mã số thuế không đúng định dạng.");
            System.out.println("❌ Lỗi: Mã số thuế không hợp lệ.");
            hasError = true;
        }

        // Kiểm tra URL businessLicense
        if (businessLicense == null || !businessLicense.matches("^https://drive\\.google\\.com/file/d/[a-zA-Z0-9_-]+/view$")) {
            request.setAttribute("errorBusinessLicense", "URL Giấy phép kinh doanh không hợp lệ.");
            System.out.println("❌ Lỗi: Business License URL không hợp lệ.");
            hasError = true;
        }

        try {
            UserDAO userDAO = new UserDAO();
            //if (this.userDAO == null) {
            //  this.userDAO = new UserDAO();
            //}
            // Kiểm tra email đã tồn tại chưa
            if (!hasError && userDAO.isEmailExist(email)) {
                request.setAttribute("errorEmail", "Email đã tồn tại. Vui lòng chọn email khác.");
                System.out.println("❌ Lỗi: Email đã tồn tại.");
                hasError = true;
            }

            // Kiểm tra username đã tồn tại chưa
            if (!hasError && userDAO.isUserNameExist(username)) {
                request.setAttribute("errorUsername", "Tên người dùng đã tồn tại. Vui lòng chọn tên khác.");
                System.out.println("❌ Lỗi: Username đã tồn tại.");
                hasError = true;
            }

            // Kiểm tra số điện thoại đã tồn tại chưa
            if (!hasError && userDAO.isPhoneExist(phone)) {
                request.setAttribute("errorPhone", "Số điện thoại đã tồn tại. Vui lòng nhập số khác.");
                System.out.println("❌ Lỗi: Số điện thoại đã tồn tại.");
                hasError = true;
            }

            // Kiểm tra mã số thuế đã tồn tại chưa
            if (!hasError && userDAO.isTaxCodeExist(taxCode)) {
                request.setAttribute("errorTaxCode", "Mã số thuế đã tồn tại. Vui lòng nhập mã khác.");
                System.out.println("❌ Lỗi: Mã số thuế đã tồn tại.");
                hasError = true;
            }

            if (hasError) {
                System.out.println("🔴 Đăng ký thất bại do lỗi nhập liệu.");
                request.getRequestDispatcher("/pages/signup.jsp").forward(request, response);
                return;
            }

            // Chuyển đổi Google Drive URL
            String fileId = businessLicense.split("/d/")[1].split("/")[0];
            businessLicense = "https://drive.google.com/uc?export=view&id=" + fileId;
            System.out.println("✅ Business License URL hợp lệ, chuyển đổi thành: " + businessLicense);

            // Tiến hành đăng ký
            boolean isSuccess = userDAO.register(username, password, fullname, phone, email, storeName, storeAddress, taxCode, businessLicense);

            if (isSuccess) {
                System.out.println("🎉 Đăng ký thành công!");
                request.setAttribute("message", "Tài khoản đã được tạo thành công.");
                request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            } else {
                System.out.println("❌ Đăng ký thất bại do lỗi hệ thống hoặc dữ liệu.");
                request.setAttribute("error", "Đăng ký thất bại. Vui lòng thử lại.");
                request.getRequestDispatcher("/pages/signup.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("⚠️ Lỗi hệ thống: " + e.getMessage());
            request.setAttribute("error", "Lỗi hệ thống. Vui lòng thử lại sau.");
            request.getRequestDispatcher("/pages/signup.jsp").forward(request, response);
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
