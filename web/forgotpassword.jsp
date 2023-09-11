<%-- 
    Document   : forgotpassword
    Created on : Mar 18, 2023, 12:22:23 AM
    Author     : DC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Forgot Password</title>
    </head>
    <body>
       <jsp:include page="navbar.jsp"></jsp:include>
        <center>
        <form action="OTPForgotServlet" method="post">
            </br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email"><br><br>
            <input type="submit" value="Submit" class="btn btn-primary">
            <input type="reset" value="Reset" class="btn btn-secondary" >
        </form>
    </center>
    <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
