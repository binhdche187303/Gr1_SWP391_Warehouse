package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    protected Connection connection;

    public DBContext() {
        try {
            // Cập nhật URL, username và password cho phù hợp với cấu hình của bạn
            String url = "jdbc:sqlserver://localhost:1433;databaseName=SWPV2;encrypt=true;trustServerCertificate=true"; // Thêm cấu hình SSL nếu cần
            String username = "sa";  // Đảm bảo đúng username
            String password = "123"; // Đảm bảo đúng password
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            // Kết nối đến cơ sở dữ liệu
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Kết nối cơ sở dữ liệu thành công!");

        } catch (ClassNotFoundException e) {
            System.out.println("Lỗi: Không tìm thấy driver JDBC.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Lỗi kết nối cơ sở dữ liệu.");
            e.printStackTrace();
        }
    }

    // Phương thức để đóng kết nối khi không còn sử dụng
    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Đã đóng kết nối cơ sở dữ liệu.");
            } catch (SQLException e) {
                System.out.println("Lỗi khi đóng kết nối.");
                e.printStackTrace();
            }
        }
    }
}
