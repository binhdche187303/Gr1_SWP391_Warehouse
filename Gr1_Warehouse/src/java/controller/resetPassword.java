package controller;

import dao.DAOTokenForget;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Enumeration;
import model.TokenForgetPassword;
import model.User;

public class resetPassword extends HttpServlet {

    DAOTokenForget DAOToken = new DAOTokenForget();
    UserDAO UserDAO = new UserDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet resetPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet resetPassword at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String token = request.getParameter("token");
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            System.out.println(paramName + " = " + request.getParameter(paramName));
        }

        if (token != null) {
            token = token.trim();
        }

        System.out.println("Token từ URL sau khi loại bỏ khoảng trắng: " + token); // Kiểm tra token
        HttpSession session = request.getSession();

        if (token != null) {
            TokenForgetPassword tokenForgetPassword = DAOToken.getTokenPassword(token);

            if (tokenForgetPassword == null) {
                request.setAttribute("mess", "Token không hợp lệ.");
                request.getRequestDispatcher("/pages/reset.jsp").forward(request, response);
                return;
            }
            if (tokenForgetPassword.isIsUsed()) {
                request.setAttribute("mess", "Token đã được sử dụng.");
                request.getRequestDispatcher("/pages/reset.jsp").forward(request, response);
                return;
            }
            if (new resetService().isExpireTime(tokenForgetPassword.getExpireTime())) {
                request.setAttribute("mess", "Token đã hết hạn.");
                request.getRequestDispatcher("/pages/reset.jsp").forward(request, response);
                return;
            }

            User user = UserDAO.getUserById(tokenForgetPassword.getUser_id());
            request.setAttribute("email", user.getEmail());
            session.setAttribute("token", tokenForgetPassword.getToken());
            request.getRequestDispatcher("/pages/reset.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/pages/reset.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("mess", "Xác nhận mật khẩu phải giống mật khẩu.");
            request.setAttribute("email", email);
            request.getRequestDispatcher("/pages/reset.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        String tokenStr = (String) session.getAttribute("token");
        TokenForgetPassword tokenForgetPassword = DAOToken.getTokenPassword(tokenStr);

        if (tokenForgetPassword == null) {
            request.setAttribute("mess", "Token không hợp lệ.");
            request.getRequestDispatcher("/pages/reset.jsp").forward(request, response);
            return;
        }
        if (tokenForgetPassword.isIsUsed()) {
            request.setAttribute("mess", "Token đã được sử dụng.");
            request.getRequestDispatcher("/pages/forgot.jsp").forward(request, response);
            return;
        }
        if (new resetService().isExpireTime(tokenForgetPassword.getExpireTime())) {
            request.setAttribute("mess", "Token đã hết hạn.");
            request.getRequestDispatcher("/pages/forgot.jsp").forward(request, response);
            return;
        }

        UserDAO.updatePassword(email, password);

        tokenForgetPassword.setIsUsed(true);
        DAOToken.updateStatus(tokenForgetPassword);

        response.sendRedirect("login");
    }

    @Override
    public String getServletInfo() {
        return "Servlet xử lý yêu cầu reset mật khẩu";
    }
}
