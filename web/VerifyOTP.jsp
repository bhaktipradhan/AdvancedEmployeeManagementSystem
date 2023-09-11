<%-- 
    Document   : VerifyOTP
    Created on : Mar 19, 2023, 11:58:33 AM
    Author     : DC
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
  try 
        {
            String enteredOtp = request.getParameter("otps");           
            String actualOtp = (String) session.getAttribute("OTP");
            
            if (enteredOtp.equals(actualOtp)) 
            {
                
      
 response.sendRedirect("ChangePassword.jsp");

}           
            else {
               %>
               <script>
                   alert("WRONG OTP ENTERED");
               </script>
               <jsp:include page="otp.jsp"></jsp:include>
        <%
             
            }
}       
  catch(Exception e){
     out.println(e);
  }
%>
    </body>
</html>
