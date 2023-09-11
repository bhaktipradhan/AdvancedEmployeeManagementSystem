<%-- 
    Document   : Admin
    Created on : Jan 13, 2023, 6:27:52 PM
    Author     : DC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <a href="font-awesome/fonts/fontawesome-webfont.svg"></a>
        <style type="text/css">
            body{               
                margin:0;
            }
          label{
                width: 100%;
                display: inline-block;
                margin: 4px;
            }
            form{
                margin-top: 70px;
                margin-left: 430px;
                border-radius: 10px;
                background:white;
                color: black;
                width:760px;
                height: 500px;
                padding: 4px;
                box-shadow: 0 4px 8px 2px rgba(0, 0, 0, 0.2);
                align-content: center;
            }
            #submit{
                margin-top: 10px;
                margin-left: 50px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp"></jsp:include>
        <form action="AAdmin.jsp">
                    
<div style="background-image: url('images/loginbg.jpg'); background-repeat: no-repeat; background-size: 370px; background-position: bottom right; padding-top: 100px;">
                <div style='margin-left: 86px; margin-top: -40px;' id="form" class="form">
                    <div>
                        <h3 style="margin-top:30px; color: black;">Admin Login</h3>  </br></br>
                    </div>
                <label>Enter the Username:</label>
                <input type="text" placeholder="username" class="form-group" name="ausername" required="required">
                <br><p>
                <label>Enter the Password:</label>
                <input type="password" placeholder="password" class="form-group" name="apassword" required="required">
                </p>
                <input type="submit" class="btn btn-primary" class="form-group" value="Login" id="submit">
                </div> 
</div>
            
        </form>    
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
