<%-- 
    Document   : ChangePassword
    Created on : Mar 19, 2023, 12:42:14 PM
    Author     : DC
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Change Password</title>
    </head>
    <body>
        <jsp:include page="navbar.jsp"></jsp:include>
        <form action="Achangepassword.jsp">
    <center>
        </br>
        <h1>Change Password</h1>
        </br>
        <label>New Password: </label> <input type="password" id="npassword" name="npassword" placeholder="Enter New Password" required="required"><br>
        </br>
        <label>Confirm Password: </label> <input type="password" id="rpassword" name="rpassword" placeholder="Re-Enter Password" required="required">
        <br></br>
        <input type="submit" name="changepass" id="chpass" value="Submit" onclick="matchPassword()" class="btn btn-primary">
        <input type = "reset" value = "Reset" class="btn btn-secondary">
    </center>
            <jsp:include page="footer.jsp"></jsp:include>
        </form>
    </body>
</html>

    