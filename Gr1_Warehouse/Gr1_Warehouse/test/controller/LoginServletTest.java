/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package controller;

import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Base64;
import java.util.List;
import model.Role;
import model.User;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import static org.mockito.Mockito.*;
import ulti.MD5Hash;

public class LoginServletTest {

    private LoginServlet loginServlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;
    private RequestDispatcher dispatcher;
    private UserDAO userDAO;

    @Before
    public void setUp() throws Exception {
        // Đặt encoding mặc định là UTF-8
        System.setProperty("file.encoding", "UTF-8");

        // Xác nhận lại việc thiết lập encoding
        java.nio.charset.Charset.defaultCharset();

        loginServlet = new LoginServlet();
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
        session = mock(HttpSession.class);
        dispatcher = mock(RequestDispatcher.class);
        userDAO = mock(UserDAO.class);

        // Inject UserDAO mock into servlet
        loginServlet.setUserDAO(userDAO);
    }
// Test case 01: Để trống email/username và mật khẩu

    @Test
    public void testTC01_EmptyEmailAndPassword() throws Exception {
        // Giả lập việc không nhập giá trị cho email/username và mật khẩu
        when(request.getParameter("identifier")).thenReturn("");
        when(request.getParameter("pass")).thenReturn("");
        when(request.getRequestDispatcher("/pages/login.jsp")).thenReturn(dispatcher);

        // Gọi servlet để kiểm tra
        loginServlet.doPost(request, response);

        // Kiểm tra xem lỗi hiển thị đúng thông báo cho trường hợp này
        verify(request).setAttribute("error", "Email / Tên đăng nhập và Mật khẩu không được để trống.");
        verify(dispatcher).forward(request, response);
    }

// Test case 02: Để trống email/username nhưng có nhập mật khẩu
    @Test
    public void testTC02_EmptyEmail() throws Exception {
        when(request.getParameter("identifier")).thenReturn("");
        when(request.getParameter("pass")).thenReturn("password123");
        when(request.getRequestDispatcher("/pages/login.jsp")).thenReturn(dispatcher);

        loginServlet.doPost(request, response);

        verify(request).setAttribute("error", "Email hoặc Tên đăng nhập không được để trống.");
        verify(dispatcher).forward(request, response);
    }

// Test case 03: Để trống mật khẩu nhưng có nhập email/username
    @Test
    public void testTC03_EmptyPassword() throws Exception {
        when(request.getParameter("identifier")).thenReturn("user@example.com");
        when(request.getParameter("pass")).thenReturn("");
        when(request.getRequestDispatcher("/pages/login.jsp")).thenReturn(dispatcher);

        loginServlet.doPost(request, response);

        verify(request).setAttribute("error", "Mật khẩu không được để trống.");
        verify(dispatcher).forward(request, response);
    }

// Test case 04: Tài khoản không tồn tại
    @Test
    public void testTC04_AccountDoesNotExist() throws Exception {
        when(request.getParameter("identifier")).thenReturn("nonexistent@example.com");
        when(request.getParameter("pass")).thenReturn("password123");
        when(request.getRequestDispatcher("/pages/login.jsp")).thenReturn(dispatcher);
        when(userDAO.getUserByUsername("nonexistent@example.com")).thenReturn(null);

        loginServlet.doPost(request, response);
        verify(request).setAttribute("error", "Tài khoản không tồn tại. Vui lòng thử lại!");
        verify(dispatcher).forward(request, response);
    }

// Test case 05: Tài khoản bị vô hiệu hóa bởi admin
    @Test
    public void testTC05_AccountDisabledByAdmin() throws Exception {
        // Giả lập tài khoản bị vô hiệu hóa
        when(request.getParameter("identifier")).thenReturn("user112");
        when(request.getParameter("pass")).thenReturn("Dinbinh88@");
        when(request.getRequestDispatcher("/pages/login.jsp")).thenReturn(dispatcher);

        // Tạo đối tượng User với trạng thái "Deactive"
        User disabledUser = new User();
        disabledUser.setStatus("Deactive");
        disabledUser.setUserId(15);

        when(userDAO.getUserByUsername("user112")).thenReturn(disabledUser);

        loginServlet.doPost(request, response);
        verify(request).setAttribute("error", "Tài khoản của bạn đã bị vô hiệu hóa. Vui lòng liên hệ người quản lí.");
        verify(dispatcher).forward(request, response);
    }

// Test case 06: Tài khoản bán buôn đang chờ duyệt
    @Test
    public void testTC06_AccountPendingApproval() throws Exception {
        when(request.getParameter("identifier")).thenReturn("binhdc1111a");
        when(request.getParameter("pass")).thenReturn("Dinhbinh88@");
        when(request.getRequestDispatcher("/pages/login.jsp")).thenReturn(dispatcher);

        User user = new User();
        user.setStatus("Active");
        user.setUserId(23);

        when(userDAO.getUserByUsername("binhdc1111a")).thenReturn(user);
        when(userDAO.getWholesaleStatus(23)).thenReturn("Chờ duyệt");

        loginServlet.doPost(request, response);
        verify(request).setAttribute("error", "Tài khoản bán buôn của bạn đang chờ duyệt. Vui lòng liên hệ người quản lí.");
        verify(dispatcher).forward(request, response);
    }

// Test case 07: Tài khoản bán buôn bị từ chối
    @Test
    public void testTC07_AccountRejected() throws Exception {
        when(request.getParameter("identifier")).thenReturn("binhdche");
        when(request.getParameter("pass")).thenReturn("Dinhbinh88@");
        when(request.getRequestDispatcher("/pages/login.jsp")).thenReturn(dispatcher);

        User user = new User();
        user.setStatus("Active");
        user.setUserId(16);

        when(userDAO.getUserByUsername("binhdche")).thenReturn(user);
        when(userDAO.getWholesaleStatus(16)).thenReturn("Bị từ chối");

        loginServlet.doPost(request, response);

        verify(request).setAttribute("error", "Tài khoản của bạn đã bị từ chối.");
        verify(dispatcher).forward(request, response);
    }

// Test case 08: Mật khẩu không chính xác
    @Test
    public void testTC08_IncorrectPassword() throws Exception {
        when(request.getParameter("identifier")).thenReturn("admin");
        when(request.getParameter("pass")).thenReturn("wrongpassword");
        when(request.getRequestDispatcher("/pages/login.jsp")).thenReturn(dispatcher);

        User user = new User();
        user.setStatus("Active");
        user.setUserId(8);

        when(userDAO.getUserByUsername("testpending")).thenReturn(user);
        when(userDAO.login("testpending", "wrongpassword")).thenReturn(null);

        loginServlet.doPost(request, response);
        verify(request).setAttribute("error", "Mật khẩu không chính xác. Vui lòng thử lại!");
        verify(dispatcher).forward(request, response);
    }

    //Case login Active ở Users và WholesaleCustomers với Customer
    @Test
    public void testTC09_ValidWholesaleAccount_User18() throws Exception {
        // 1. Thiết lập request parameters
        when(request.getParameter("identifier")).thenReturn("user1121");
        when(request.getParameter("pass")).thenReturn("Dinhbinh88@");
        when(request.getParameter("save-pass")).thenReturn(null);

        // 2. Mock User và Role
        Role role = new Role();
        role.setRoleId(2); // Customer role
        role.setRoleName("Customer");

        User expectedUser = new User();
        expectedUser.setUserId(18);
        expectedUser.setUsername("user88");
        expectedUser.setPassword("202cb962ac59075b964b07152d234b70"); // MD5 của "123"
        expectedUser.setFullname("binhdc1331");
        expectedUser.setEmail("customer12121@example.com");
        expectedUser.setAddress("123 Đường ABC, TP.HCM11");
        expectedUser.setStatus("Active");
        expectedUser.setRole(role);

        // 3. Mock UserDAO
        when(userDAO.getUserByUsername("user88")).thenReturn(expectedUser);
        when(userDAO.getWholesaleStatus(18)).thenReturn("Hoạt động");
        when(userDAO.login("user88", "123")).thenReturn(expectedUser);

        // 4. Mock session và response
        HttpSession session = mock(HttpSession.class);
        when(request.getSession()).thenReturn(session);
        doNothing().when(response).sendRedirect(anyString());

        // 5. Chạy test
        loginServlet.doPost(request, response);

        // 6. Verify - Sử dụng any(User.class) thay vì exact object
        verify(session).setAttribute(eq("acc"), any(User.class));
        verify(response).sendRedirect(request.getContextPath() + "/home");
    }

    @Test
    public void testTC10_AdminLoginSuccess() throws Exception {
        // 1. Thiết lập request parameters
        when(request.getParameter("identifier")).thenReturn("admin");
        when(request.getParameter("pass")).thenReturn("123");
        when(request.getParameter("save-pass")).thenReturn(null);

        // 2. Mock User và Role
        Role adminRole = new Role();
        adminRole.setRoleId(1); // Admin role
        adminRole.setRoleName("Admin");

        User expectedAdmin = new User();
        expectedAdmin.setUserId(1);
        expectedAdmin.setUsername("admin");
        expectedAdmin.setPassword("202cb962ac59075b964b07152d234b70"); // MD5 của "123"
        expectedAdmin.setFullname("Admin 1");
        expectedAdmin.setPhone("0123456789");
        expectedAdmin.setEmail("manager01@example.com");
        expectedAdmin.setAddress("Hai Ba Trung , Hà Nội1");
        expectedAdmin.setStatus("Active");
        expectedAdmin.setRole(adminRole);

        // 3. Mock UserDAO
        when(userDAO.getUserByUsername("admin")).thenReturn(expectedAdmin);
        when(userDAO.login("admin", "123")).thenReturn(expectedAdmin);

        // 4. Mock session và response
        HttpSession session = mock(HttpSession.class);
        when(request.getSession()).thenReturn(session);
        doNothing().when(response).sendRedirect(anyString());

        // 5. Chạy test
        loginServlet.doPost(request, response);

        // 6. Verify
        verify(session).setAttribute(eq("acc"), any(User.class));
        verify(response).sendRedirect("/Gr1_Warehouse/dashboard");
    }

    @Test
    public void testTC11_WarehouseManagerLoginSuccess() throws Exception {
        // 1. Thiết lập request parameters
        when(request.getParameter("identifier")).thenReturn("manager1");
        when(request.getParameter("pass")).thenReturn("123");
        when(request.getParameter("save-pass")).thenReturn(null);

        // 2. Mock User và Role
        Role managerRole = new Role();
        managerRole.setRoleId(3); // Warehouse Manager role
        managerRole.setRoleName("Warehouse Manager");

        User expectedManager = new User();
        expectedManager.setUserId(3);
        expectedManager.setUsername("manager1");
        expectedManager.setPassword("202cb962ac59075b964b07152d234b70"); // MD5 của "123"
        expectedManager.setFullname("Warehouse manager 1");
        expectedManager.setPhone("0123456789");
        expectedManager.setEmail("manager@gmail.com");
        expectedManager.setAddress(null); // NULL trong database
        expectedManager.setStatus("Active");
        expectedManager.setRole(managerRole);

        // 3. Mock UserDAO
        when(userDAO.getUserByUsername("manager1")).thenReturn(expectedManager);
        when(userDAO.login("manager1", "123")).thenReturn(expectedManager);

        // 4. Mock session và response
        HttpSession session = mock(HttpSession.class);
        when(request.getSession()).thenReturn(session);
        doNothing().when(response).sendRedirect(anyString());

        // 5. Chạy test
        loginServlet.doPost(request, response);

        // 6. Verify
        verify(session).setAttribute(eq("acc"), any(User.class));
        verify(response).sendRedirect("/Gr1_Warehouse/managerDashboard");
    }

    @Test
    public void testTC12_WarehouseStaffLoginSuccess() throws Exception {
        // 1. Thiết lập request parameters
        when(request.getParameter("identifier")).thenReturn("staff1");
        when(request.getParameter("pass")).thenReturn("123");
        when(request.getParameter("save-pass")).thenReturn(null);

        // 2. Mock User và Role
        Role staffRole = new Role();
        staffRole.setRoleId(4);
        staffRole.setRoleName("Warehouse Staff");

        User expectedStaff = new User();
        expectedStaff.setUserId(4);
        expectedStaff.setUsername("staff1");
        expectedStaff.setPassword("202cb962ac59075b964b07152d234b70");
        expectedStaff.setFullname("Staff 1");
        expectedStaff.setPhone("0123456789");
        expectedStaff.setEmail("staff1@gmail.com");
        expectedStaff.setAddress(null);
        expectedStaff.setStatus("Active");
        expectedStaff.setRole(staffRole);

        // 3. Mock UserDAO
        when(userDAO.getUserByUsername("staff1")).thenReturn(expectedStaff);
        when(userDAO.login("staff1", "123")).thenReturn(expectedStaff);

        // 4. Mock session và response
        HttpSession session = mock(HttpSession.class);
        when(request.getSession()).thenReturn(session);
        doNothing().when(response).sendRedirect(anyString());

        // 5. Chạy test
        loginServlet.doPost(request, response);

        // 6. Verify
        verify(session).setAttribute(eq("acc"), any(User.class));
        verify(response).sendRedirect("/Gr1_Warehouse/staff-checklist");
    }

    @Test
    public void testTC13_PackingStaffLoginSuccess() throws Exception {
        // 1. Thiết lập request parameters
        when(request.getParameter("identifier")).thenReturn("packing1");
        when(request.getParameter("pass")).thenReturn("123");
        when(request.getParameter("save-pass")).thenReturn(null);

        // 2. Mock User và Role
        Role packingRole = new Role();
        packingRole.setRoleId(5);
        packingRole.setRoleName("Packing Staff");

        User expectedPacking = new User();
        expectedPacking.setUserId(5);
        expectedPacking.setUsername("packing1");
        expectedPacking.setPassword("202cb962ac59075b964b07152d234b70");
        expectedPacking.setFullname("Packing 1");
        expectedPacking.setPhone("0123456789");
        expectedPacking.setEmail("packing@gmail.com");
        expectedPacking.setAddress(null);
        expectedPacking.setStatus("Active");
        expectedPacking.setRole(packingRole);

        // 3. Mock UserDAO
        when(userDAO.getUserByUsername("packing1")).thenReturn(expectedPacking);
        when(userDAO.login("packing1", "123")).thenReturn(expectedPacking);

        // 4. Mock session và response
        HttpSession session = mock(HttpSession.class);
        when(request.getSession()).thenReturn(session);
        doNothing().when(response).sendRedirect(anyString());

        // 5. Chạy test
        loginServlet.doPost(request, response);

        // 6. Verify
        verify(session).setAttribute(eq("acc"), any(User.class));
        verify(response).sendRedirect("/Gr1_Warehouse/packing-orders");
    }

    @Test
    public void testTC14_ShipperLoginSuccess() throws Exception {
        // 1. Thiết lập request parameters
        when(request.getParameter("identifier")).thenReturn("shipper1");
        when(request.getParameter("pass")).thenReturn("123");
        when(request.getParameter("save-pass")).thenReturn(null);

        // 2. Mock User và Role
        Role shipperRole = new Role();
        shipperRole.setRoleId(6);
        shipperRole.setRoleName("Shipper");

        User expectedShipper = new User();
        expectedShipper.setUserId(6);
        expectedShipper.setUsername("shipper1");
        expectedShipper.setPassword("202cb962ac59075b964b07152d234b70");
        expectedShipper.setFullname("Shipper 1");
        expectedShipper.setPhone("0123456789");
        expectedShipper.setEmail("shipper@gmail.com");
        expectedShipper.setAddress(null);
        expectedShipper.setStatus("Active");
        expectedShipper.setRole(shipperRole);

        // 3. Mock UserDAO
        when(userDAO.getUserByUsername("shipper1")).thenReturn(expectedShipper);
        when(userDAO.login("shipper1", "123")).thenReturn(expectedShipper);

        // 4. Mock session và response
        HttpSession session = mock(HttpSession.class);
        when(request.getSession()).thenReturn(session);
        doNothing().when(response).sendRedirect(anyString());

        // 5. Chạy test
        loginServlet.doPost(request, response);

        // 6. Verify
        verify(session).setAttribute(eq("acc"), any(User.class));
        verify(response).sendRedirect("/Gr1_Warehouse/ship-orders");
    }

    @Test
    public void testTC15_SaleStaffLoginSuccess() throws Exception {
        // 1. Thiết lập request parameters
        when(request.getParameter("identifier")).thenReturn("seller1");
        when(request.getParameter("pass")).thenReturn("123");
        when(request.getParameter("save-pass")).thenReturn(null);

        // 2. Mock User và Role
        Role saleRole = new Role();
        saleRole.setRoleId(7);
        saleRole.setRoleName("Sale Staff");

        User expectedSeller = new User();
        expectedSeller.setUserId(7);
        expectedSeller.setUsername("seller1");
        expectedSeller.setPassword("202cb962ac59075b964b07152d234b70");
        expectedSeller.setFullname("Seller 1");
        expectedSeller.setPhone("0123456789");
        expectedSeller.setEmail("seller1@gmail.com");
        expectedSeller.setAddress(null);
        expectedSeller.setStatus("Active");
        expectedSeller.setRole(saleRole);

        // 3. Mock UserDAO
        when(userDAO.getUserByUsername("seller1")).thenReturn(expectedSeller);
        when(userDAO.login("seller1", "123")).thenReturn(expectedSeller);

        // 4. Mock session và response
        HttpSession session = mock(HttpSession.class);
        when(request.getSession()).thenReturn(session);
        doNothing().when(response).sendRedirect(anyString());

        // 5. Chạy test
        loginServlet.doPost(request, response);

        // 6. Verify
        verify(session).setAttribute(eq("acc"), any(User.class));
        verify(response).sendRedirect("/Gr1_Warehouse/sale-orders");
    }

    @Test
    public void testTC16_RememberMe_SaveCookies() throws Exception {
        // 1. Thiết lập request parameters với remember me được chọn
        String username = "cus1";
        String password = "123";
        when(request.getParameter("identifier")).thenReturn(username);
        when(request.getParameter("pass")).thenReturn(password);
        when(request.getParameter("save-pass")).thenReturn("on"); // Remember me được chọn

        // 2. Mock User và Role
        Role customerRole = new Role();
        customerRole.setRoleId(2);
        customerRole.setRoleName("Customer");

        User expectedUser = new User();
        expectedUser.setUserId(2);
        expectedUser.setUsername(username);
        expectedUser.setPassword("202cb962ac59075b964b07152d234b70"); // MD5 của "123"
        expectedUser.setRole(customerRole);
        expectedUser.setStatus("Active");

        // 3. Mock UserDAO
        when(userDAO.getUserByUsername(username)).thenReturn(expectedUser);
        when(userDAO.login(username, password)).thenReturn(expectedUser);

        // 4. Mock session và response
        HttpSession session = mock(HttpSession.class);
        when(request.getSession()).thenReturn(session);

        // Sử dụng ArgumentCaptor để bắt cookie
        ArgumentCaptor<Cookie> cookieCaptor = ArgumentCaptor.forClass(Cookie.class);
        doNothing().when(response).addCookie(cookieCaptor.capture());
        doNothing().when(response).sendRedirect(anyString());

        // 5. Chạy test
        loginServlet.doPost(request, response);

        // 6. Verify
        // Kiểm tra session được tạo
        verify(session).setAttribute(eq("acc"), any(User.class));

        // Kiểm tra đã thêm 2 cookie (identifier và password)
        List<Cookie> capturedCookies = cookieCaptor.getAllValues();
        assertEquals(2, capturedCookies.size());

        // Kiểm tra cookie identifier
        Cookie identifierCookie = capturedCookies.get(0);
        assertEquals("identifier", identifierCookie.getName());
        assertEquals(username, identifierCookie.getValue());
        assertEquals(7 * 24 * 60 * 60, identifierCookie.getMaxAge()); // 7 ngày
        assertEquals("/", identifierCookie.getPath());

        // Kiểm tra cookie password (được mã hóa Base64)
        Cookie passwordCookie = capturedCookies.get(1);
        assertEquals("password", passwordCookie.getName());
        assertEquals(Base64.getEncoder().encodeToString(password.getBytes()), passwordCookie.getValue());
        assertEquals(7 * 24 * 60 * 60, passwordCookie.getMaxAge());
        assertEquals("/", passwordCookie.getPath());

        // Kiểm tra redirect
        verify(response).sendRedirect(request.getContextPath() + "/home");

        // Kiểm tra log
        System.out.println("✅ Test TC16 - Đã lưu cookie khi chọn Remember Me");
    }
}
