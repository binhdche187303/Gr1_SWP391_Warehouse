/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package controller;

import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import ulti.MD5Hash;

import java.io.IOException;
import org.mockito.Mockito;

import static org.mockito.Mockito.*;

/**
 *
 * @author Dell
 */
public class ChangePasswordTest {

    private ChangePassword changePasswordServlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;
    private UserDAO userDAO;
    private RequestDispatcher requestDispatcher;

    @Before
    public void setUp() {
        changePasswordServlet = new ChangePassword();
        request = Mockito.mock(HttpServletRequest.class);
        response = Mockito.mock(HttpServletResponse.class);
        session = Mockito.mock(HttpSession.class);
        userDAO = Mockito.mock(UserDAO.class);
        requestDispatcher = Mockito.mock(RequestDispatcher.class);

        changePasswordServlet.setUserDAO(userDAO); // Inject mock

        when(request.getSession()).thenReturn(session);
        when(request.getRequestDispatcher("/pages/profileSetting.jsp")).thenReturn(requestDispatcher);
    }

    @Test
    public void TC_01IncorrectCurrentPassword() throws ServletException, IOException {
        // Thiết lập dữ liệu đầu vào
        when(request.getParameter("currentpassword")).thenReturn("wrongpassword");
        when(request.getParameter("newpassword")).thenReturn("NewPass123!");
        when(request.getParameter("confirmpassword")).thenReturn("NewPass123!");

        // Mock người dùng trong session
        User testUser = new User();
        testUser.setUserId(2);
        testUser.setPassword(MD5Hash.hash("123")); // Mật khẩu hiện tại trong DB là "123"
        when(session.getAttribute("acc")).thenReturn(testUser);

        // Gọi phương thức doPost
        changePasswordServlet.doPost(request, response);

        // Kiểm tra kết quả
        verify(request).setAttribute("error", "Mật khẩu hiện tại không đúng!");
        verify(requestDispatcher).forward(request, response);
        verify(userDAO, never()).updatePassword(anyString(), anyInt());
        verify(userDAO, never()).getUserById(anyInt());
    }

    @Test
    public void TC_02PasswordMismatch() throws ServletException, IOException {
        when(request.getParameter("currentpassword")).thenReturn("123"); // Đúng mật khẩu hiện tại
        when(request.getParameter("newpassword")).thenReturn("NewPass123!");
        when(request.getParameter("confirmpassword")).thenReturn("NewPass124!"); // Không khớp

        User testUser = new User();
        testUser.setUserId(2);
        testUser.setPassword(MD5Hash.hash("123")); // Mật khẩu hiện tại trong DB là "123"
        when(session.getAttribute("acc")).thenReturn(testUser);

        changePasswordServlet.doPost(request, response);

        verify(request).setAttribute("error", "Mật khẩu mới và mật khẩu xác nhận không khớp!");
        verify(requestDispatcher).forward(request, response);
        verify(userDAO, never()).updatePassword(anyString(), anyInt());
        verify(userDAO, never()).getUserById(anyInt());
    }

    @Test
    public void TC_03WeakNewPassword() throws ServletException, IOException {
        when(request.getParameter("currentpassword")).thenReturn("123"); // Đúng mật khẩu hiện tại
        when(request.getParameter("newpassword")).thenReturn("weakpass"); // Không đủ phức tạp
        when(request.getParameter("confirmpassword")).thenReturn("weakpass");

        User testUser = new User();
        testUser.setUserId(2);
        testUser.setPassword(MD5Hash.hash("123")); // Mật khẩu hiện tại trong DB là "123"
        when(session.getAttribute("acc")).thenReturn(testUser);

        changePasswordServlet.doPost(request, response);

        verify(request).setAttribute("error", "Mật khẩu mới phải chứa ít nhất 1 chữ in hoa, 1 ký tự đặc biệt, 1 số và tối thiểu 8 ký tự!");
        verify(requestDispatcher).forward(request, response);
        verify(userDAO, never()).updatePassword(anyString(), anyInt());
        verify(userDAO, never()).getUserById(anyInt());
    }

    @Test
    public void TC_04SuccessfulPasswordChange() throws ServletException, IOException {
        when(request.getParameter("currentpassword")).thenReturn("123");//Lấy dữ liệu từ sesison mock
        when(request.getParameter("newpassword")).thenReturn("NewPass123!");
        when(request.getParameter("confirmpassword")).thenReturn("NewPass123!");

        User testUser = new User();
        testUser.setUserId(2);
        testUser.setPassword(MD5Hash.hash("123"));
        when(session.getAttribute("acc")).thenReturn(testUser);

        User updatedUser = new User();
        updatedUser.setUserId(2);
        updatedUser.setPassword(MD5Hash.hash("NewPass123!"));
        when(userDAO.getUserById(2)).thenReturn(updatedUser);

        changePasswordServlet.doPost(request, response);

        verify(userDAO).updatePassword(MD5Hash.hash("NewPass123!"), 2);
        verify(userDAO).getUserById(2);
        verify(session).setAttribute("acc", updatedUser);
        verify(request).setAttribute("success", "Đổi mật khẩu thành công!");
        verify(requestDispatcher).forward(request, response);
    }

}
