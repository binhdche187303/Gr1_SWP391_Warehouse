/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Dell
 */
package dashboardController;

import java.io.UnsupportedEncodingException;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class EmailSender {

    private final String username; // Email của người gửi
    private final String password; // Mật khẩu email hoặc app password
    private final Properties props;

    public EmailSender(String host, int port, boolean auth, boolean tls) {
        username = "kimtuan09112004@gmail.com"; // Thay đổi email của bạn
        password = "ezpo szbi dtkn knkx"; // Thay đổi mật khẩu

        props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", auth);
        props.put("mail.smtp.starttls.enable", tls);
    }

    public boolean sendNewAccountEmail(String recipient, String username) throws UnsupportedEncodingException {
        try {
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(EmailSender.this.username, password);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject(MimeUtility.encodeText("Thông tin tài khoản mới - Warehouse System", "UTF-8", "B"));

            // Link đến trang đổi mật khẩu
            String changePasswordLink = "http://localhost:8080/Gr1_Warehouse/changepasswordemail";

            // Nội dung email
            String emailContent = "Xin chào " + username + ",<br><br>"
                    + "Bạn vừa được tạo tài khoản trên hệ thống Warehouse. <br>"
                    + "Thông tin đăng nhập:<br>"
                    + "- Email: " + recipient + "<br>"
                    + "- Username: " + username + "<br>"
                    + "- Mật khẩu mặc định: 123<br><br>"
                    + "Vui lòng đăng nhập và đổi mật khẩu của bạn tại đường dẫn sau:<br><br>"
                    + "<a href='" + changePasswordLink + "'>Nhấp vào đây để đổi mật khẩu</a><br><br>"
                    + "Trân trọng,<br>Đội ngũ Quản lý Warehouse";

            message.setContent(emailContent, "text/html; charset=UTF-8");
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}

