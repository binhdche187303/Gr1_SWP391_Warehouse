package dashboardController;

import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@WebServlet(name = "ManagerUser", urlPatterns = {"/manageUser"})
public class ManagerUser extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("Service");

        if ("export".equals(service)) {
            handleExport(response);
        } else {
            // Nếu không có tham số hoặc tham số không hợp lệ, chuyển hướng về danh sách nhân viên
            RequestDispatcher dispatcher = request.getRequestDispatcher("allstaff");
            dispatcher.forward(request, response);
        }
    }

    private void handleExport(HttpServletResponse response) {
        List<User> userList = userDAO.getAllStaff();
        boolean success = exportToExcel(userList, response);

        // Thiết lập header phản hồi để hiển thị thông báo thành công/thất bại
        response.setHeader("message", success ? "Export success" : "Export failed");
    }

    private boolean exportToExcel(List<User> userList, HttpServletResponse response) {
        try (Workbook workbook = new XSSFWorkbook()) {
            Sheet sheet = workbook.createSheet("Staff Data");
            String[] headers = {"Username", "Full Name", "Phone", "Email", "Address", "Role", "Status"};
            Row headerRow = sheet.createRow(0);

            for (int i = 0; i < headers.length; i++) {
                headerRow.createCell(i).setCellValue(headers[i]);
            }

            int rowNum = 1;
            for (User user : userList) {
                Row row = sheet.createRow(rowNum++);
                row.createCell(0).setCellValue(user.getUsername());
                row.createCell(1).setCellValue(user.getFullname());
                row.createCell(2).setCellValue(user.getPhone());
                row.createCell(3).setCellValue(user.getEmail());
                row.createCell(4).setCellValue(user.getAddress());
                row.createCell(5).setCellValue(user.getRole().getRoleName());
                row.createCell(6).setCellValue(user.getStatus());
            }

            // Thiết lập kiểu phản hồi để tải file
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=StaffData.xlsx");

            try (OutputStream out = response.getOutputStream()) {
                workbook.write(out);
            }
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public String getServletInfo() {
        return "ManagerUser Servlet for exporting user data.";
    }
}
