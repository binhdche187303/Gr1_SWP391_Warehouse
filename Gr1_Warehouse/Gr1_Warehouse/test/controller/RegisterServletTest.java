/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package controller;

import dao.UserDAO;
import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.junit.Before;
import org.junit.Test;
import java.io.IOException;
import java.util.Random;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import org.mockito.ArgumentCaptor;
import ulti.MD5Hash;

/**
 *
 * @author Dell
 */
public class RegisterServletTest {

    private RegisterServlet registerServlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private RequestDispatcher requestDispatcher;
    private UserDAO userDAO;

    @Before
    public void setUp() {
        registerServlet = new RegisterServlet();
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
        requestDispatcher = mock(RequestDispatcher.class);
        userDAO = mock(UserDAO.class); // Mock UserDAO
        // Inject the mock UserDAO into the servlet
        registerServlet.setUserDAO(userDAO);
    }

    //TC_01 : Empty all fiels
    @Test
    public void Tc01_testRequiredFieldsNotEmpty() throws ServletException, IOException {
        // Mock parameters to simulate empty fields
        when(request.getParameter("username")).thenReturn(""); // Empty username
        when(request.getParameter("password")).thenReturn(""); // Empty password
        when(request.getParameter("fullname")).thenReturn(""); // Empty full name
        when(request.getParameter("phone")).thenReturn(""); // Empty phone
        when(request.getParameter("email")).thenReturn(""); // Empty email
        when(request.getParameter("storeName")).thenReturn(""); // Empty store name
        when(request.getParameter("storeAddress")).thenReturn(""); // Empty store address
        when(request.getParameter("taxCode")).thenReturn(""); // Empty tax code
        when(request.getParameter("businessLicense")).thenReturn(""); // Empty business license
        when(request.getRequestDispatcher("/pages/signup.jsp")).thenReturn(requestDispatcher);

        // Call the doPost method
        registerServlet.doPost(request, response);

        // Verify that error messages are set for empty fields
        verify(request).setAttribute(eq("errorUsername"), eq("Tên người dùng không được để trống."));
        verify(request).setAttribute(eq("errorPassword"), eq("Mật khẩu phải có ít nhất 1 chữ in hoa, 1 ký tự đặc biệt, 1 số, tối thiểu 8 ký tự."));
        verify(request).setAttribute(eq("errorFullname"), eq("Tên đầy đủ không được để trống."));
        verify(request).setAttribute(eq("errorPhone"), eq("Số điện thoại không đúng định dạng."));
        verify(request).setAttribute(eq("errorEmail"), eq("Email không đúng định dạng."));
        verify(request).setAttribute(eq("errorStoreName"), eq("Tên cửa hàng không được để trống."));
        verify(request).setAttribute(eq("errorStoreAddress"), eq("Địa chỉ cửa hàng không được để trống."));
        verify(request).setAttribute(eq("errorTaxCode"), eq("Mã số thuế không đúng định dạng."));
        verify(request).setAttribute(eq("errorBusinessLicense"), eq("URL Giấy phép kinh doanh không hợp lệ."));

        // Verify that the request is forwarded to the signup page
        verify(request).getRequestDispatcher("/pages/signup.jsp");
        verify(requestDispatcher).forward(request, response);
    }

    // TC_02: Email is invalid (missing '@' symbol or domain).
    @Test
    public void TC02_emailInvalid() throws ServletException, IOException {
        when(request.getParameter("email")).thenReturn("emailgmail.com");
        when(request.getRequestDispatcher("/pages/signup.jsp")).thenReturn(requestDispatcher);

        registerServlet.doPost(request, response);

        verify(request).setAttribute(eq("errorEmail"), eq("Email không đúng định dạng."));
        verify(requestDispatcher).forward(request, response);
    }

    @Test
    public void TC03_passwordInvalid() throws ServletException, IOException {
        when(request.getParameter("password")).thenReturn("password1!");
        when(request.getRequestDispatcher("/pages/signup.jsp")).thenReturn(requestDispatcher);

        registerServlet.doPost(request, response);

        verify(request).setAttribute(eq("errorPassword"), eq("Mật khẩu phải có ít nhất 1 chữ in hoa, 1 ký tự đặc biệt, 1 số, tối thiểu 8 ký tự."));
        verify(requestDispatcher).forward(request, response);
    }

    @Test
    public void TC04_phoneInvalid() throws ServletException, IOException {
        when(request.getParameter("phone")).thenReturn("123456789");
        when(request.getRequestDispatcher("/pages/signup.jsp")).thenReturn(requestDispatcher);

        registerServlet.doPost(request, response);

        verify(request).setAttribute(eq("errorPhone"), eq("Số điện thoại không đúng định dạng."));
        verify(requestDispatcher).forward(request, response);
    }

    @Test
    public void TC05_taxCodeInvalid() throws ServletException, IOException {
        when(request.getParameter("taxCode")).thenReturn("12345abcde");
        when(request.getRequestDispatcher("/pages/signup.jsp")).thenReturn(requestDispatcher);

        registerServlet.doPost(request, response);

        verify(request).setAttribute(eq("errorTaxCode"), eq("Mã số thuế không đúng định dạng."));
        verify(requestDispatcher).forward(request, response);
    }

    @Test
    public void TC06_businessLicenseUrlInvalid() throws ServletException, IOException {
        when(request.getParameter("businessLicense")).thenReturn("https://example.com/file/d/abc123/view");
        when(request.getRequestDispatcher("/pages/signup.jsp")).thenReturn(requestDispatcher);

        registerServlet.doPost(request, response);

        verify(request).setAttribute(eq("errorBusinessLicense"), eq("URL Giấy phép kinh doanh không hợp lệ."));
        verify(requestDispatcher).forward(request, response);
    }

    // TC7: Email already exists
    @Test
    public void TC07_emailAlreadyExists() throws ServletException, IOException {
        // Setup test data with an existing email from the user table
        String existingEmail = "cus1@gmail.com";

        // Prepare a complete set of valid registration parameters
        when(request.getParameter("email")).thenReturn(existingEmail);
        when(request.getParameter("username")).thenReturn("newUniqueUsername");
        when(request.getParameter("password")).thenReturn("ValidPass123!");
        when(request.getParameter("fullname")).thenReturn("John Doe");
        when(request.getParameter("phone")).thenReturn("0987654321");
        when(request.getParameter("storeName")).thenReturn("New Store");
        when(request.getParameter("storeAddress")).thenReturn("123 Test Street");
        when(request.getParameter("taxCode")).thenReturn("1234567890");
        when(request.getParameter("businessLicense")).thenReturn("https://drive.google.com/file/d/testfile/view");

        // Mock the UserDAO method to return true for email existence
        when(userDAO.isEmailExist(existingEmail)).thenReturn(true);
        when(request.getRequestDispatcher("/pages/signup.jsp")).thenReturn(requestDispatcher);

        // Execute the registration
        registerServlet.doPost(request, response);

        // Verify error handling
        verify(request).setAttribute(eq("errorEmail"), eq("Email đã tồn tại. Vui lòng chọn email khác."));
        verify(requestDispatcher).forward(request, response);
    }

    // TC8: Username already exists
    @Test
    public void TC08_usernameAlreadyExists() throws ServletException, IOException {
        // Setup test data with an existing username from the user table
        String existingUsername = "admin";

        // Prepare a complete set of valid registration parameters
        when(request.getParameter("username")).thenReturn(existingUsername);
        when(request.getParameter("email")).thenReturn("new11email@example.com");
        when(request.getParameter("password")).thenReturn("ValidPass123!");
        when(request.getParameter("fullname")).thenReturn("John Doe");
        when(request.getParameter("phone")).thenReturn("0987654321");
        when(request.getParameter("storeName")).thenReturn("New Store");
        when(request.getParameter("storeAddress")).thenReturn("123 Test Street");
        when(request.getParameter("taxCode")).thenReturn("1234567890");
        when(request.getParameter("businessLicense")).thenReturn("https://drive.google.com/file/d/testfile/view");

        // Mock the UserDAO method to return true for username existence
        when(userDAO.isUserNameExist(existingUsername)).thenReturn(true);
        when(request.getRequestDispatcher("/pages/signup.jsp")).thenReturn(requestDispatcher);

        // Execute the registration
        registerServlet.doPost(request, response);

        // Verify error handling
        verify(request).setAttribute(eq("errorUsername"), eq("Tên người dùng đã tồn tại. Vui lòng chọn tên khác."));
        verify(requestDispatcher).forward(request, response);
    }

    // TC9: Phone number already exists
    @Test
    public void TC09_phoneAlreadyExists() throws ServletException, IOException, Exception {
        // Setup test data with an existing phone number from the user table
        String existingPhone = "0123456789";

        // Prepare a complete set of valid registration parameters
        when(request.getParameter("phone")).thenReturn(existingPhone);
        when(request.getParameter("username")).thenReturn("newUn1111iqueUsername");
        when(request.getParameter("email")).thenReturn("newema110il@example.com");
        when(request.getParameter("password")).thenReturn("ValidPass123!");
        when(request.getParameter("fullname")).thenReturn("John Doe");
        when(request.getParameter("storeName")).thenReturn("New Store");
        when(request.getParameter("storeAddress")).thenReturn("123 Test Street");
        when(request.getParameter("taxCode")).thenReturn("1234567890");
        when(request.getParameter("businessLicense")).thenReturn("https://drive.google.com/file/d/testfile/view");

        // Mock the UserDAO method to return true for phone existence
        when(userDAO.isPhoneExist(existingPhone)).thenReturn(true);
        when(request.getRequestDispatcher("/pages/signup.jsp")).thenReturn(requestDispatcher);

        // Execute the registration
        registerServlet.doPost(request, response);

        // Verify error handling
        verify(request).setAttribute(eq("errorPhone"), eq("Số điện thoại đã tồn tại. Vui lòng nhập số khác."));
        verify(requestDispatcher).forward(request, response);
    }

    // TC10: Tax code already exists
    @Test
    public void TC10_taxCodeAlreadyExists() throws ServletException, IOException, Exception {
        // Setup test data with an existing tax code from the user table
        String existingTaxCode = "01234567181";

        // Prepare a complete set of valid registration parameters
        when(request.getParameter("taxCode")).thenReturn(existingTaxCode);
        when(request.getParameter("username")).thenReturn("newUni2queUsername");
        when(request.getParameter("email")).thenReturn("newemafdsil@example.com");
        when(request.getParameter("password")).thenReturn("ValidPass123!");
        when(request.getParameter("fullname")).thenReturn("John Doe");
        when(request.getParameter("phone")).thenReturn("0180654321");
        when(request.getParameter("storeName")).thenReturn("New Store");
        when(request.getParameter("storeAddress")).thenReturn("123 Test Street");
        when(request.getParameter("businessLicense")).thenReturn("https://drive.google.com/file/d/testfile/view");

        // Mock the UserDAO method to return true for tax code existence
        when(userDAO.isTaxCodeExist(existingTaxCode)).thenReturn(true);
        when(request.getRequestDispatcher("/pages/signup.jsp")).thenReturn(requestDispatcher);

        // Execute the registration
        registerServlet.doPost(request, response);

        // Verify error handling
        verify(request).setAttribute(eq("errorTaxCode"), eq("Mã số thuế đã tồn tại. Vui lòng nhập mã khác."));
        verify(requestDispatcher).forward(request, response);
    }
    //TC11 : Register sucessfully
    @Test
    public void TC11_valid8CharPasswordAndSuccessfulRegistration() throws Exception {

        // 1. Tạo dữ liệu test
        String username = "newUser" + System.currentTimeMillis();
        String password = "Dinhbinh2!";
        String phone = "09" + String.format("%08d", new Random().nextInt(100000000));
        String email = "newEmail" + System.currentTimeMillis() + "@example.com";
        String taxCode = String.format("%010d", Math.abs(new Random().nextLong() % 10000000000L));
        String originalLicenseUrl = "https://drive.google.com/file/d/11qqtZj31PQRjCVBu80IdsJTfw2sGlkuh/view";
        String convertedLicenseUrl = "https://drive.google.com/uc?export=view&id=11qqtZj31PQRjCVBu80IdsJTfw2sGlkuh";

        // 2. Mock request parameters
        when(request.getParameter("username")).thenReturn(username);
        when(request.getParameter("password")).thenReturn(password);
        when(request.getParameter("fullname")).thenReturn("New User");
        when(request.getParameter("phone")).thenReturn(phone);
        when(request.getParameter("email")).thenReturn(email);
        when(request.getParameter("storeName")).thenReturn("New Store");
        when(request.getParameter("storeAddress")).thenReturn("123 New Street");
        when(request.getParameter("taxCode")).thenReturn(taxCode);
        when(request.getParameter("businessLicense")).thenReturn(originalLicenseUrl);

        // 3. Mock dispatchers
        RequestDispatcher successDispatcher = mock(RequestDispatcher.class);
        when(request.getRequestDispatcher("/pages/login.jsp")).thenReturn(successDispatcher);
        when(request.getRequestDispatcher("/pages/signup.jsp")).thenReturn(mock(RequestDispatcher.class));

        // 4. Tạo một UserDAO mock và inject nó (mặc dù servlet không dùng trực tiếp)
        UserDAO mockUserDAO = mock(UserDAO.class);
        when(mockUserDAO.isEmailExist(email)).thenReturn(false);
        when(mockUserDAO.isPhoneExist(phone)).thenReturn(false);
        when(mockUserDAO.isUserNameExist(username)).thenReturn(false);
        when(mockUserDAO.isTaxCodeExist(taxCode)).thenReturn(false);
        when(mockUserDAO.register(
                eq(username), eq(password), eq("New User"),
                eq(phone), eq(email), eq("New Store"),
                eq("123 New Street"), eq(taxCode),
                eq(convertedLicenseUrl)
        )).thenReturn(true);

        // Inject mock UserDAO (dù không dùng được trực tiếp do local instantiation)
        registerServlet.setUserDAO(mockUserDAO);

        // 5. Thực thi doPost
        registerServlet.doPost(request, response);

        // 6. Verify kết quả mong đợi
        // Servlet sẽ gọi một UserDAO thực tế (không phải mock), nhưng ta kiểm tra output
        verify(request).setAttribute("message", "Tài khoản đã được tạo thành công.");
        verify(request).getRequestDispatcher("/pages/login.jsp");
        verify(successDispatcher).forward(request, response);

        // 7. Verify không có lỗi
        verify(request, never()).setAttribute(eq("error"), any());
        verify(request, never()).getRequestDispatcher("/pages/signup.jsp"); // Không lỗi thì không forward về signup
    }


}
