import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VerifyOTPServlet extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) 
        {
            Connection con = null;
           
            String enteredOtp = request.getParameter("otps");
            
            HttpSession session = request.getSession();
            String actualOtp = (String) session.getAttribute("OTP");
            
            if (enteredOtp.equals(actualOtp)) 
            {
                session.getAttribute("eemail");
                
            } 
            else 
            {
               out.println("WRONG OTP ENTERED");
            }
        }
    }
}
