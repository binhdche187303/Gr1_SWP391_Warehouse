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

        HttpSession session = request.getSession();
        session.setAttribute("acc", user);

        int roleId = user.getRole().getRoleId();

        switch (roleId) {
            case 1:  // Admin system
                response.sendRedirect("/Gr1_Warehouse/includes/admin.jsp");
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
        String identifier = request.getParameter("identifier");
        String password = request.getParameter("pass");
        String savePass = request.getParameter("save-pass");

        if (identifier == null || identifier.trim().isEmpty()) {
            System.out.println("User is empty.");
            request.setAttribute("error", "Email or Username cannot be empty");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        if (password == null || password.trim().isEmpty()) {
            System.out.println("Password is empty.");
            request.setAttribute("error", "Password cannot be empty");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        identifier = identifier.trim();
        password = password.trim();

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

        String hashedPassword = null;
        try {
            hashedPassword = MD5Hash.hash(password);
        } catch (Exception e) {
            System.out.println("Error hashing password: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Internal Server Error. Please try again later.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        User user = userDAO.login(identifier, password);
        if (user == null) {
            System.out.println("Login failed for identifier: " + identifier);
            request.setAttribute("identifier", identifier);
            request.setAttribute("error", "Email/Username or Password is incorrect. Please try again!");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        if (user.getStatus() == null || "Deactive".equalsIgnoreCase(user.getStatus())) {
            System.out.println("Login attempt with deactivated account: " + identifier);
            request.setAttribute("identifier", identifier);
            request.setAttribute("error", "Your account is deactivated. Please contact support.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        System.out.println("Login successful for identifier: " + identifier);

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
            emailCookie.setMaxAge(0);
            emailCookie.setPath("/");
            response.addCookie(emailCookie);
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
                response.sendRedirect("/Gr1_Warehouse/includes/admin.jsp");
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
                System.out.println("Unknown role ID: " + roleId + ". Redirecting to error page.");
                response.sendRedirect("error");
        }
    }

    @Override
    public String getServletInfo() {
        return "Login Servlet";
    }
}
