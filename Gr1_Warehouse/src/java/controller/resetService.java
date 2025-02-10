/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.time.LocalDateTime;
import java.util.Properties;
import java.util.UUID;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Dell
 */
public class resetService {

    private final int LIMIT_MINUS = 10;
    static final String from = "dinhcongbinh8820@gmail.com";
    static final String password = "bmkb kqzj nmgz ovwq";

    public String generateToken() {
        return UUID.randomUUID().toString();
    }

    public LocalDateTime expireDateTime() {
        return LocalDateTime.now().plusMinutes(LIMIT_MINUS);
    }

    public boolean isExpireTime(LocalDateTime time) {
        return LocalDateTime.now().isAfter(time);
    }

public boolean sendEmail(String to, String link, String name) {
    Properties props = new Properties();
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");

    Authenticator auth = new Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, password); // Dùng mật khẩu ứng dụng
        }
    };

    Session session = Session.getInstance(props, auth);
    MimeMessage msg = new MimeMessage(session);

    try {
        msg.setFrom(new InternetAddress(from));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
        msg.setSubject("Reset Your Password", "UTF-8");
        String content = "<h1>Hello " + name + ",</h1>"
                + "<p>Please click the following link to reset your password:</p>"
                + "<p><a href='" + link + "'>Reset Password</a></p>"
                + "<p>The link is valid for 10 minutes only.</p>";
        msg.setContent(content, "text/html; charset=UTF-8");
        Transport.send(msg);
        System.out.println("Email sent successfully");
        return true;
    } catch (Exception e) {
        System.out.println("Failed to send email: " + e.getMessage());  // Ghi lại thông báo lỗi chi tiết
        return false;
    }
}

}
