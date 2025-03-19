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
import ulti.MD5Hash;

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
            Cookie[] cookies = request.getCookies();
            String decodedPassword = "";
            String savedIdentifier = "";

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("identifier".equals(cookie.getName())) {
                        savedIdentifier = cookie.getValue();
                    }
                    if ("password".equals(cookie.getName())) {
                        try {
                            decodedPassword = new String(Base64.getDecoder().decode(cookie.getValue()));
                        } catch (IllegalArgumentException e) {
                            System.out.println("Error decoding password: " + e.getMessage());
                        }
                    }
                }
            }

            request.setAttribute("savedIdentifier", savedIdentifier);
            request.setAttribute("decodedPassword", decodedPassword);

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
            user = new User();
            user.setEmail(googleAccount.getEmail());
            user.setUsername(googleAccount.getName());
            user.setFullname(googleAccount.getName()); // Fullname giống username
            user.setPassword("123"); // Mật khẩu mặc định là 123

            Role role = new Role();
            role.setRoleId(2);  // Role id 2 là Customer
            user.setRole(role);
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

        HttpSession session = request.getSession();
        session.setAttribute("acc", user);

        int roleId = user.getRole().getRoleId();

        switch (roleId) {
            case 1:  // Admin system
                response.sendRedirect("/Gr1_Warehouse/dashboard");
                break;
            case 2:  // Customer
                response.sendRedirect(request.getContextPath() + "/home");
                break;
            case 3:  // Warehouse manager
                response.sendRedirect("/Gr1_Warehouse/manager/manager_dashboard.jsp");
                break;
            case 4:  // Warehouse staff
                response.sendRedirect("/Gr1_Warehouse/staff-checklist");
                break;
            case 5:  // Packing staff
                response.sendRedirect("packing/staff/dashboard");
                break;
            case 6:  // Shipper staff
                response.sendRedirect("/Gr1_Warehouse/ship-orders");
                break;
            case 7:  // Saler staff
                response.sendRedirect("/Gr1_Warehouse/sale-orders");
                break;
            default:
                System.out.println("Unknown role ID: " + roleId + ". Redirecting to error page.");
                response.sendRedirect("error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String identifier = request.getParameter("identifier");
        String password = request.getParameter("pass");
        String savePass = request.getParameter("save-pass");

        if (identifier == null || identifier.trim().isEmpty()) {
            System.out.println("Người dùng không nhập tên đăng nhập hoặc email.");
            request.setAttribute("error", "Email hoặc Tên đăng nhập không được để trống.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }
        if (password == null || password.trim().isEmpty()) {
            System.out.println("Người dùng không nhập mật khẩu.");
            request.setAttribute("error", "Mật khẩu không được để trống.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        identifier = identifier.trim();
        password = password.trim();

        UserDAO userDAO = null;
        try {
            userDAO = new UserDAO();
            System.out.println("Khởi tạo UserDAO thành công.");
        } catch (Exception e) {
            System.out.println("Lỗi khi khởi tạo UserDAO: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống. Vui lòng thử lại sau.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        String hashedPassword = null;
        try {
            hashedPassword = MD5Hash.hash(password);
        } catch (Exception e) {
            System.out.println("Lỗi khi mã hóa mật khẩu: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống. Vui lòng thử lại sau.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        // Thực hiện đăng nhập với thông tin người dùng nhập vào (Email hoặc Tên đăng nhập)
// Bước 1: Kiểm tra tài khoản có tồn tại không
        User user = userDAO.getUserByUsername(identifier);

        if (user == null) {
            System.out.println("🔴 Đăng nhập thất bại: Tài khoản không tồn tại - " + identifier);
            request.setAttribute("identifier", identifier);
            request.setAttribute("error", "Email/Tên đăng nhập hoặc Mật khẩu không chính xác. Vui lòng thử lại!");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

// Lấy trạng thái tài khoản từ bảng Users
        String userStatus = user.getStatus();

// Lấy trạng thái bán buôn từ bảng WholesaleCustomers
        String wholesaleStatus = userDAO.getWholesaleStatus(user.getUserId());

// Kiểm tra trạng thái tài khoản trước khi xác thực mật khẩu
        if ("Deactive".equalsIgnoreCase(userStatus)) {
            System.out.println("⚠️ Đăng nhập thất bại: Tài khoản bị vô hiệu hóa - " + identifier);
            request.setAttribute("identifier", identifier);
            request.setAttribute("error", "Tài khoản của bạn đã bị vô hiệu hóa. Vui lòng liên hệ người quản lí.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

// Kiểm tra trạng thái tài khoản bán buôn
        if (wholesaleStatus != null) {
            if ("Chờ duyệt".equalsIgnoreCase(wholesaleStatus)) {
                System.out.println("⏳ Đăng nhập thất bại: Tài khoản bán buôn đang chờ duyệt - " + identifier);
                request.setAttribute("identifier", identifier);
                request.setAttribute("error", "Tài khoản bán buôn của bạn đang chờ duyệt. Vui lòng liên hệ người quản lí.");
                request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
                return;
            }
            if ("Bị từ chối".equalsIgnoreCase(wholesaleStatus)) {
                System.out.println("❌ Đăng nhập thất bại: Tài khoản bán buôn bị từ chối - " + identifier);
                request.setAttribute("identifier", identifier);
                request.setAttribute("error", "Tài khoản của bạn đã bị từ chối.");
                request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
                return;
            }
        }

// Bước 2: Kiểm tra mật khẩu
        user = userDAO.login(identifier, password);
        if (user == null) {
            System.out.println("🔴 Đăng nhập thất bại: Sai mật khẩu - " + identifier);
            request.setAttribute("identifier", identifier);
            request.setAttribute("error", "Email/Tên đăng nhập hoặc Mật khẩu không chính xác. Vui lòng thử lại!");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

// Đăng nhập thành công

        HttpSession session = request.getSession();
        session.setAttribute("acc", user);

        if (savePass != null) {
            Cookie emailCookie = new Cookie("identifier", identifier);
            emailCookie.setMaxAge(7 * 24 * 60 * 60);
            emailCookie.setPath("/");
            response.addCookie(emailCookie);

            String encodedPassword = Base64.getEncoder().encodeToString(password.getBytes());
            Cookie passwordCookie = new Cookie("password", encodedPassword);
            passwordCookie.setMaxAge(7 * 24 * 60 * 60);
            passwordCookie.setPath("/");
            response.addCookie(passwordCookie);

            System.out.println("Identifier and password saved in cookies for 7 days.");
        } else {
            Cookie emailCookie = new Cookie("identifier", "");
            Cookie passwordCookie = new Cookie("password", "");
            emailCookie.setMaxAge(0);
            emailCookie.setPath("/");
            response.addCookie(emailCookie);
            passwordCookie.setMaxAge(0);
            passwordCookie.setPath("/");
            response.addCookie(passwordCookie);
            System.out.println("Identifier cookie deleted.");
        }

        Role userRole = user.getRole();
        if (userRole == null) {
            System.out.println("User has no role assigned. Redirecting to error page.");
            response.sendRedirect("error");
            return;
        }

        int roleId = userRole.getRoleId();
        String roleName = userRole.getRoleName();

        if (roleName == null || roleName.trim().isEmpty()) {
            System.out.println("User role name is invalid. Redirecting to error page.");
            response.sendRedirect("error");
            return;
        }

        System.out.println("Redirecting user with role: " + roleName);

        switch (roleId) {
            case 1:  // Admin system
                response.sendRedirect("/Gr1_Warehouse/dashboard");
                break;
            case 2:  // Customer
                response.sendRedirect(request.getContextPath() + "/home");
                break;
            case 3:  // Warehouse manager
                response.sendRedirect("/Gr1_Warehouse/manager/manager_dashboard.jsp");
                break;
            case 4:  // Warehouse staff
                response.sendRedirect("/Gr1_Warehouse/staff-checklist");
                break;
            case 5:  // Packing staff
                response.sendRedirect("packing/staff/dashboard");
                break;
            case 6:  // Shipper staff
                response.sendRedirect("/Gr1_Warehouse/ship-orders");
                break;
            case 7:  // Saler staff
                response.sendRedirect("/Gr1_Warehouse/sale-orders");
                break;
            default:
                System.out.println("Unknown role ID: " + roleId + ". Redirecting to error page.");
                response.sendRedirect("error");
        }
    }

    @Override
    public String getServletInfo() {
        return "Login Servlet";
    }
}
