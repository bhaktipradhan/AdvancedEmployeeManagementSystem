import java.io.*;
import java.sql.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class OTPLoginServlet extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        String email = request.getParameter("email");
try (PrintWriter out = response.getWriter()) 
        {
          
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
            Statement st =con.createStatement();
            String mi = "select * from empinfo where EEmailID = '"+email+"'";
            
            ResultSet rs = st.executeQuery(mi);
            if(rs.next()) {
            if(email.equals(rs.getString("EEMailID"))){
                 // Generate a random OTP
            Random random = new Random();
            int otp = 100000 + random.nextInt(900000);

            // Send OTP through email Calling Function
            sendEmail(otp, email);

            // Store OTP in the session for Verification
            HttpSession session = request.getSession();
            session.setAttribute("OTP", Integer.toString(otp));
            session.setAttribute("eemail",email);

            // Redirect the user to the OTP verification page
            response.sendRedirect("otp.jsp");
            }
            }
            else{
                
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('Enter Registerd Email ID');");
                 out.println("</script>");
                 RequestDispatcher rd = request.getRequestDispatcher("forgotpassword.jsp");
                 rd.include(request, response);
                }
                   
        } catch (ClassNotFoundException | SQLException ex) {
            
        }

       
    }

    //sendEmail Function Declaration
    private void sendEmail(int otp, String email) 
    {
        //Your Email Id and Generated Password by Enabling two Factor Authentication and Generating App Password
        final String username = "youremailid@gmail.com";  //Put your Email Id
        final String password = "password"; //Manage Google Account --> Search App Password --> Create Custom Name ---> Copy Password and Paste Here)

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() 
                {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() 
            {
                return new PasswordAuthentication(username, password);
            }
        });

        try 
        {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("from@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            //Subject of the Email Message
            message.setSubject("OTP for Login");
            //Text of the Message
            message.setText("Your OTP is: " + otp);

            Transport.send(message);

            System.out.println("OTP sent successfully");
        } 
        catch (MessagingException e) 
        {
            throw new RuntimeException(e);
        }
    }
}
