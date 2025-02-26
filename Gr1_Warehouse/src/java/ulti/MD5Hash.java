package ulti;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Hash {
    public static String hash(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(input.getBytes());
            byte[] digest = md.digest();

            StringBuilder sb = new StringBuilder();
            for (byte b : digest) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
    public static void main(String[] args) {
    String password = "12";  
    //123456 => e10adc3949ba59abbe56e057f20f883e
    //12345 => 827ccb0eea8a706c4c34a16891f84e7b
    //1234 => 81dc9bdb52d04dc20036dbd8313ed055
    //123 => 202cb962ac59075b964b07152d234b70
    //12 => c20ad4d76fe97759aa27a0c99bff6710
    String hashed = MD5Hash.hash(password);
    System.out.println("Hashed password: " + hashed);
}

}


