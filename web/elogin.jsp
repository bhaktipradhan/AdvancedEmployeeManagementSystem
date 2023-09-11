<%-- 
    Document   : elogin
    Created on : Apr 3, 2023, 3:56:51 AM
    Author     : DC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style type="text/css">
            body{

            }
            form{
                margin-top: 70px;
                margin-left: 400px;
                border-radius: 10px;
                background:white;
                color: black;
                width:800px;
                height: 500px;
                padding: 4px;
                box-shadow: 0 4px 8px 2px rgba(0, 0, 0, 0.2);
            }
            #submit{
                margin-top: 10px;
                margin-left: 50px;
            }        
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp"></jsp:include>
        <form action="Login.jsp">
            <div class="form" id="form" style='margin-left: 83px; margin-top: 50px;'>
                <div style="background-image: url('images/loginbg.jpg'); background-repeat: no-repeat; background-size: 370px; background-position: bottom right; margin-top: 120px;">
                    <h3 style="margin-top:30px;">Employee Login</h3></br></br>
                <br>
                <label>Username: </label>
                <input type="text" name="user" class="form-group" placeholder="Enter the Username" required="required">
                </br></br>
                <label>Password: </label>
                <input type="password" name="pass" class="form-group" placeholder="Enter the Password" required="required">
                <br><a style="margin-left: 130px;" href="forgotpassword.jsp">forgot password</a></br>
                <input type="submit" class="btn btn-primary" value="Login" id="submit"></br></br>
                Don't have account? <a href="ERegistration.jsp">Register</a>
                
                </div>
        </form>  
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
