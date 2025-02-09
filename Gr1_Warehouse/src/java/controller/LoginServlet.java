package controller;

import dao.UserDAO;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import model.GoogleAccount;
import model.Role;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code == null || code.trim().isEmpty()) {
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        GoogleLogin googleLogin = new GoogleLogin();
        String accessToken;

        try {
            accessToken = googleLogin.getToken(code);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to retrieve access token from Google.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        GoogleAccount googleAccount;
        try {
            googleAccount = googleLogin.getUserInfo(accessToken);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to retrieve Google account information.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        if (googleAccount == null || googleAccount.getEmail() == null) {
            request.setAttribute("error", "Failed to retrieve Google account email.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        UserDAO userDAO = new UserDAO();
        User user = userDAO.findByEmail(googleAccount.getEmail());

        if (user == null) {
            // Nếu user chưa tồn tại, tạo mới
            user = new User();
            user.setEmail(googleAccount.getEmail());
            user.setUsername(googleAccount.getName());
            user.setFullname(googleAccount.getName()); // Fullname giống username
            user.setPassword("123"); // Mật khẩu mặc định là 123

            // Thiết lập Role mặc định
            Role role = new Role();
            role.setRoleId(2);  // Role id 2 là Customer
            user.setRole(role);  // Gán role cho user
            user.setStatus("Active");

            try {
                userDAO.create(user);
                System.out.println("New user created in the database.");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Failed to create new user in the database.");
                request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
                return;
            }
        }

        // Nếu user đã tồn tại hoặc vừa được tạo, tiến hành đăng nhập
        HttpSession session = request.getSession();
        session.setAttribute("acc", user);

        // Xác định đường dẫn chuyển hướng theo role_id
        int roleId = user.getRole().getRoleId();

        switch (roleId) {
            case 1:  // Admin system
                response.sendRedirect("dashboard");
                break;
            case 2:  // Customer
                response.sendRedirect(request.getContextPath() + "/pages/home.jsp");
                break;
            case 3:  // Warehouse manager
                response.sendRedirect("warehouse/manager/dashboard");
                break;
            case 4:  // Warehouse staff
                response.sendRedirect("warehouse/staff/home");
                break;
            case 5:  // Packing staff
                response.sendRedirect("packing/staff/dashboard");
                break;
            default:
                response.sendRedirect("error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy thông tin từ form
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String savePass = request.getParameter("save-pass"); // Kiểm tra checkbox "Remember me"

        // Kiểm tra nếu email và password trống
        if (email == null || email.trim().isEmpty()) {
            System.out.println("Email is empty.");
            request.setAttribute("error", "Email cannot be empty");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        if (password == null || password.trim().isEmpty()) {
            System.out.println("Password is empty.");
            request.setAttribute("error", "Password cannot be empty");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        // Loại bỏ khoảng trắng thừa ở đầu và cuối
        email = email.trim();
        password = password.trim();

        // Khởi tạo UserDAO để kiểm tra đăng nhập
        UserDAO userDAO = null;

        try {
            userDAO = new UserDAO();
            System.out.println("UserDAO instance created successfully.");
        } catch (Exception e) {
            System.out.println("Error initializing UserDAO: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Internal Server Error. Please try again later.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        User user = userDAO.login(email, password);

        if (user == null) {
            System.out.println("Login failed for email: " + email);
            request.setAttribute("email", email);
            request.setAttribute("error", "Email or Password is incorrect. Please try again!");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        if (user.getStatus() == null || "Deactive".equalsIgnoreCase(user.getStatus())) {
            System.out.println("Login attempt with deactivated account: " + email);
            request.setAttribute("email", email);
            request.setAttribute("error", "Your account is deactivated. Please contact support.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        System.out.println("Login successful for email: " + email);

        // Đăng nhập thành công, lưu thông tin người dùng vào session
        HttpSession session = request.getSession();
        session.setAttribute("acc", user);

        // Lưu email vào cookie nếu người dùng chọn "Remember me"
        if (savePass != null) {
            // Lưu email vào cookie với thời gian tồn tại là 7 ngày
            Cookie emailCookie = new Cookie("email", email);
            emailCookie.setMaxAge(7 * 24 * 60 * 60);  // Lưu cookie trong 7 ngày
            emailCookie.setPath("/");  // Cookie có sẵn cho toàn bộ website
            response.addCookie(emailCookie);
            // Lưu password vào cookie (mã hóa trước khi lưu)
            String encodedPassword = Base64.getEncoder().encodeToString(password.getBytes());
            Cookie passwordCookie = new Cookie("password", encodedPassword);
            passwordCookie.setMaxAge(7 * 24 * 60 * 60); // 7 ngày
            passwordCookie.setPath("/");
            response.addCookie(passwordCookie);

            System.out.println("Email and password saved in cookies for 7 days.");
        } else {
            // Nếu không chọn "Remember me", xóa cookie email
            Cookie emailCookie = new Cookie("email", "");
            emailCookie.setMaxAge(0);  // Xóa cookie ngay lập tức
            emailCookie.setPath("/");  // Đảm bảo cookie bị xóa trên toàn bộ trang web
            response.addCookie(emailCookie);
            System.out.println("Email cookie deleted.");
        }

        // Kiểm tra vai trò của người dùng và chuyển hướng tới trang tương ứng
        String roleName = user.getRole().getRoleName();

        if (roleName == null || roleName.trim().isEmpty()) {
            System.out.println("User role is invalid. Redirecting to error page.");
            response.sendRedirect("error");
            return;
        }

        System.out.println("Redirecting user with role: " + roleName);
        switch (roleName) {
            case "Admin system":
                response.sendRedirect("dashboard");
                break;
            case "Customer":
                response.sendRedirect(request.getContextPath() + "/pages/home.jsp");
                break;
            case "Warehouse manager":
                response.sendRedirect("warehouse/manager/dashboard");
                break;
            case "Warehouse staffs":
                response.sendRedirect("warehouse/staff/home");
                break;
            case "Packing staffs":
                response.sendRedirect("packing/staff/dashboard");
                break;
            default:
                System.out.println("Unknown role: " + roleName + ". Redirecting to error page.");
                response.sendRedirect("error");
        }
    }

    @Override
    public String getServletInfo() {
        return "Login Servlet";
    }
}
