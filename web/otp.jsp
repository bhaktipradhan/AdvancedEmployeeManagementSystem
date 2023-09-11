<%-- 
    Document   : otp
    Created on : Mar 18, 2023, 10:40:43 PM
    Author     : DC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>OTP Page</title>
    </head>
    <body>
        <jsp:include page="navbar.jsp"></jsp:include>
        <center>
         <form action="VerifyOTP.jsp" method="get">
             </br>
         <label for="otp">Enter OTP: </label>
         <input type="text" id="otp" name="otps"><br><br>
         <input type="submit" class="btn btn-primary" value="Verify">
    </form>
    </center>
    <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>