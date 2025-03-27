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
import org.mockito.Mockito;

import java.io.IOException;
import org.mockito.InjectMocks;
import org.mockito.Mock;

import static org.mockito.Mockito.*;
import org.mockito.MockitoAnnotations;

/**
 *
 * @author Dell
 */
public class ChangeProfileTest {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;
    private RequestDispatcher requestDispatcher;
    @Mock
    private UserDAO userDAO;

    @InjectMocks
    private ChangeProfile changeProfileServlet;

    @Before
    public void setUp() {
        changeProfileServlet = new ChangeProfile();
        request = Mockito.mock(HttpServletRequest.class);
        response = Mockito.mock(HttpServletResponse.class);
        session = Mockito.mock(HttpSession.class);
        userDAO = Mockito.mock(UserDAO.class);
        requestDispatcher = Mockito.mock(RequestDispatcher.class);

    MockitoAnnotations.openMocks(this);
    changeProfileServlet.setUserDAO(userDAO); // Inject mock DAO
        when(request.getSession()).thenReturn(session);
        when(request.getRequestDispatcher("/pages/profileSetting.jsp")).thenReturn(requestDispatcher);
    }

    @Test
    public void TC01_updateProfileWithInvalidPhoneNumber() throws ServletException, IOException {
        User mockUser = new User();
        mockUser.setUserId(2);

        when(session.getAttribute("acc")).thenReturn(mockUser);

        when(request.getParameter("fullname")).thenReturn("Customer 1");
        when(request.getParameter("phone")).thenReturn("123"); // Invalid phone number
        when(request.getParameter("address")).thenReturn("Ha Noi");

        changeProfileServlet.doPost(request, response);

        verify(request).setAttribute(eq("errorprofile"), eq("Số điện thoại không hợp lệ."));
        verify(requestDispatcher).forward(request, response);

        verify(userDAO, never()).updateUser(anyString(), anyString(), anyString(), anyInt());
    }

    @Test
    public void TC02_updateProfileWithExcessiveNameLength() throws ServletException, IOException {
        User mockUser = new User();
        mockUser.setUserId(2);

        when(session.getAttribute("acc")).thenReturn(mockUser);

        String longName = "A".repeat(101);

        when(request.getParameter("fullname")).thenReturn(longName);
        when(request.getParameter("phone")).thenReturn("0123456789");
        when(request.getParameter("address")).thenReturn("Ha Noi");

        changeProfileServlet.doPost(request, response);

        verify(request).setAttribute(eq("errorprofile"), eq("Họ tên không được vượt quá 100 ký tự."));
        verify(requestDispatcher).forward(request, response);

        verify(userDAO, never()).updateUser(anyString(), anyString(), anyString(), anyInt());
    }

    @Test
    public void TC04_updateProfileWithExcessiveAddressLength() throws ServletException, IOException {
        User mockUser = new User();
        mockUser.setUserId(2);

        when(session.getAttribute("acc")).thenReturn(mockUser);

        String longAddress = "A".repeat(256);

        when(request.getParameter("fullname")).thenReturn("Customer 1");
        when(request.getParameter("phone")).thenReturn("0123456789");
        when(request.getParameter("address")).thenReturn(longAddress);

        changeProfileServlet.doPost(request, response);

        verify(request).setAttribute(eq("errorprofile"), eq("Địa chỉ không được vượt quá 255 ký tự."));
        verify(requestDispatcher).forward(request, response);

        verify(userDAO, never()).updateUser(anyString(), anyString(), anyString(), anyInt());
    }

@Test
public void TC05_successfulProfileUpdate() throws ServletException, IOException {
    // Arrange
    User mockUser = new User();
    mockUser.setUserId(2);
    when(session.getAttribute("acc")).thenReturn(mockUser);

    when(request.getParameter("fullname")).thenReturn("Customer");
    when(request.getParameter("phone")).thenReturn("0987654321");
    when(request.getParameter("address")).thenReturn("Ha Noi");

    when(userDAO.updateUser(anyString(), anyString(), anyString(), anyInt())).thenReturn(true);

    User updatedUser = new User();
    updatedUser.setUserId(2);
    when(userDAO.getUserById(2)).thenReturn(updatedUser);

    changeProfileServlet.setUserDAO(userDAO);
    changeProfileServlet.doPost(request, response);

    // Assert
    verify(userDAO).updateUser(eq("Customer"), eq("0987654321"), eq("Ha Noi"), eq(2));
    verify(session).setAttribute(eq("acc"), eq(updatedUser));
    verify(request).setAttribute(eq("successprofile"), eq("Thông tin cá nhân đã được cập nhật thành công."));
    verify(requestDispatcher).forward(request, response);
}

}
