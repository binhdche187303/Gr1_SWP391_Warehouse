/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dashboardController;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.Part;
import java.io.FileInputStream;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import model.Role;
import model.User;

/**
 *
 * @author admin
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class AddStaff extends HttpServlet {

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
            out.println("<title>Servlet AddStaff</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddStaff at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        try {
            Part filePart = request.getPart("excelFile");

            if (filePart == null) {
                request.getRequestDispatcher("/Gr1_Warehouse/allstaff").forward(request, response);
                return;
            }

            List<User> userList = new ArrayList<>();

            try (InputStream inputStream = filePart.getInputStream()) {
                Workbook workbook = new XSSFWorkbook(inputStream);
                Sheet sheet = workbook.getSheetAt(0);

                int totalRows = sheet.getPhysicalNumberOfRows();
                System.out.println("Tổng số hàng trong file: " + totalRows);

                // Duyệt từng hàng trong file (bỏ qua hàng đầu tiên nếu là tiêu đề)
                for (int rowIndex = 1; rowIndex < totalRows; rowIndex++) {
                    Row dataRow = sheet.getRow(rowIndex);
                    if (dataRow == null) {
                        System.out.println("Bỏ qua hàng " + rowIndex + " vì rỗng.");
                        continue; // Bỏ qua hàng rỗng
                    }

                    // Lấy dữ liệu từ từng ô trong hàng
                    Cell usernameCell = dataRow.getCell(0);
                    Cell passwordCell = dataRow.getCell(1);
                    Cell fullnameCell = dataRow.getCell(2);
                    Cell emailCell = dataRow.getCell(3);
                    Cell roleCell = dataRow.getCell(4);

                    // Kiểm tra nếu bất kỳ ô nào bị thiếu
                    if (usernameCell == null || passwordCell == null || fullnameCell == null || emailCell == null || roleCell == null) {
                        System.out.println("Bỏ qua hàng " + rowIndex + " vì thiếu dữ liệu.");
                        continue;
                    }

                    String username = getCellValueAsString(usernameCell);
                    String password = getCellValueAsString(passwordCell);
                    String fullname = getCellValueAsString(fullnameCell);
                    String email = getCellValueAsString(emailCell);
                    String roleString = getCellValueAsString(roleCell);

                    if (username == null || password == null || fullname == null || email == null || roleString == null) {
                        System.out.println("Bỏ qua hàng " + rowIndex + " vì có giá trị null.");
                        continue;
                    }

                    username = username.trim();
                    password = password.trim();
                    fullname = fullname.trim();
                    email = email.trim();
                    roleString = roleString.trim();

                    if (username.isEmpty() || password.isEmpty() || fullname.isEmpty() || email.isEmpty()) {
                        System.out.println("Bỏ qua hàng " + rowIndex + " vì có trường dữ liệu rỗng.");
                        continue;
                    }

                    int roleId;
                    try {
                        roleId = Integer.parseInt(roleString);
                    } catch (NumberFormatException e) {
                        System.out.println("Lỗi chuyển đổi Role ID ở hàng " + rowIndex + ": " + e.getMessage());
                        continue;
                    }

                    // Tạo đối tượng User và thêm vào danh sách
                    User user = new User(username.trim(), password.trim(), fullname.trim(), email.trim(), new Role(roleId));
                    userList.add(user);
                }

                workbook.close();
            }

            // Nếu có dữ liệu hợp lệ, thêm vào database
            if (!userList.isEmpty()) {
                UserDAO userDAO = new UserDAO();
                int addedCount = userDAO.addUsers(userList);
            } else {
            }
            response.sendRedirect("/Gr1_Warehouse/allstaff");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Lấy giá trị từ ô Excel dưới dạng chuỗi, xử lý cả số và công thức.
     */
    private String getCellValueAsString(Cell cell) {
        if (cell == null) {
            return "";
        }

        try {
            switch (cell.getCellType()) {
                case STRING:
                    return cell.getStringCellValue();
                case NUMERIC:
                    double numericValue = cell.getNumericCellValue();
                    if (DateUtil.isCellDateFormatted(cell)) {
                        return cell.getDateCellValue().toString();
                    }
                    return (numericValue == Math.floor(numericValue)) ? String.valueOf((int) numericValue) : String.valueOf(numericValue);
                case BOOLEAN:
                    return String.valueOf(cell.getBooleanCellValue());
                case FORMULA:
                try {
                    return String.valueOf(cell.getNumericCellValue());
                } catch (Exception e) {
                    return cell.getCellFormula();
                }
                case BLANK:
                default:
                    return "";
            }
        } catch (Exception e) {
            System.err.println("Lỗi đọc ô Excel: " + e.getMessage());
            return "";
        }
    }

    private String getRawCellValue(Cell cell) {
        try {
            switch (cell.getCellType()) {
                case STRING:
                    return "String: " + cell.getStringCellValue();
                case NUMERIC:
                    return "Numeric: " + cell.getNumericCellValue();
                case BOOLEAN:
                    return "Boolean: " + cell.getBooleanCellValue();
                case FORMULA:
                    return "Formula: " + cell.getCellFormula();
                case BLANK:
                    return "Blank cell";
                default:
                    return "Unknown type";
            }
        } catch (Exception e) {
            return "Error reading cell: " + e.getMessage();
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