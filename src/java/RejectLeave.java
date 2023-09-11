import java.io.IOException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RejectLeave extends HttpServlet {
   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
      
      // Retrieve email ID from MySQL database
      String emailId = null;
      String query = "SELECT email_id FROM users WHERE username = ?";
      String username = request.getParameter("username");
      try {
         Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "password");
         PreparedStatement ps = con.prepareStatement(query);
         ps.setString(1, username);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            emailId = rs.getString("email_id");
         }
         con.close();
      } catch (ClassNotFoundException | SQLException e) {
      }
      
      // Set email properties
      String host = "smtp.gmail.com";
      String port = "587";
      String userrname = "your-email@gmail.com";
      String password = "your-password";
      String to = emailId;
      String from = "your-email@gmail.com";
      String subject = "Test Email";
      String body = "This is a test email.";
      
      Properties properties = new Properties();
      properties.put("mail.smtp.host", host);
      properties.put("mail.smtp.port", port);
      properties.put("mail.smtp.auth", "true");
      properties.put("mail.smtp.starttls.enable", "true");
      
      // Authenticate and send email
      Authenticator authenticator = new Authenticator() {
         @Override
         protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(userrname, password);
         }
      };
      Session session = Session.getInstance(properties, authenticator);
      try {
         MimeMessage message = new MimeMessage(session);
         message.setFrom(new InternetAddress(from));
         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
         message.setSubject(subject);
         message.setText(body);
         Transport.send(message);
         response.getWriter().println("Email sent successfully.");
      } catch (MessagingException mex) {
         mex.printStackTrace();
      }
   }
}