<%-- 
    Document   : enterOTP
    Created on : Mar 18, 2023, 12:31:55 AM
    Author     : DC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        // Retrieve the OTP from the user's session
        int otp = (int) session.getAttribute("otp");
        
        // Check if the OTP entered by the user matches the one sent via email
        int userOTP = Integer.parseInt(request.getParameter("otp"));
        if (userOTP == otp) {
                out.println("OTP verification successful!");
        } else {
                out.println("OTP verification failed. Please try again.");
        }
%>
<!DOCTYPE html>
<html>
<head>
        <title>Enter OTP</title>
</head>
<body>
        <h2>Enter the OTP you received via email:</h2>
        <form action="verifyOTP.jsp" method="post">
                <label for="otp">OTP:</label>
                <input type="number" id="otp" name="otp" required>
                <br><br>
                <input type="submit" value="Verify OTP">
        </form>
</body>
</html>