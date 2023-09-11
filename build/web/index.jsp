<%-- 
    Document   : index
    Created on : 31 Mar, 2023, 11:12:58 PM
    Author     : rajan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/b3ad385e53.js" crossorigin="anonymous"></script>
        <jsp:include page="navbar.jsp"></jsp:include>
        <title>AEMS</title>       
        <style type="text/css">
            body{
                margin:0;
                background:  no-repeat center center fixed; 
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
                font-family: Times New Roman;
                border-radius: 0;
            }
            submit{
                margin-top: 15px;
            }
            nav{              
                margin-top: 5px;
            }
            a{
                margin: 10px;
                padding-bottom: 3px;
            }
            #j1{
                border-radius: 0;
            }
            .scrollbar{
                height: calc(100vh - 100%);
 padding-bottom: 5rem;
 margin-bottom : 50px;
            }
            .cards{
                display: grid;
                grid-template-columns: repeat(3,1fr) ;
                grid-gap: 2rem;
            }
            .grid-container > div {
  background-color: rgba(255, 255, 255, 0.8);
  text-align: center;
  padding: 20px 0;
  font-size: 30px;
}
        </style>
    </head>
    <body>
        <div class="scrollbar" >
        <div style= " background-color: black; color: whitesmoke; background-image:url('images/himg.jpg'); background-position: right top; background-repeat:  no-repeat; bottom: 50px;" id="j1" class="jumbotron">
            <h3 class="display-3">Welcome To AEMS</h3>
         <div style="width:70%" class="para">
         <p>Advanced Employee management is a practice that helps a manager and Admin improve employee productivity and satisfaction to help an organization reach its goals. As well as helps employee to be up-to-date.</p>
         </div>
            </br>
            <a href="ERegistration.jsp"><button class="btn btn-outline-light btn-lg">Register &nbsp;<i class="fa fa-user-plus" aria-hidden="true"></i></button></a>
            <a href="Admin.jsp"><button class="btn btn-outline-light btn-lg">Admin Login &nbsp;<i class="fa fa-user" aria-hidden="true"></i></button></a>
            <a href="elogin.jsp"><button class="btn btn-outline-light btn-lg">Employee Login &nbsp;<i class="fa-solid fa-circle-user fa-beat-fade"></i></button></a>           
        </div>
            </br>
        <div class="container-fluid">
            <h5>Modules</h5>
<div class="card-deck">
  <div class="card">
    <div class="card-body">
      <h5 class="card-title">Admin Module</h5>
      <p class="card-text">Admin is the super user and have highest authority.</p>
    </div>
  </div>
  <div class="card">
    <div class="card-body">
      <h5 class="card-title">Manager Module</h5>
      <p class="card-text">Manager is have authority to access employees under them and their own data.</p>
    </div>
  </div>
  <div class="card">
    <div class="card-body">
      <h5 class="card-title">Employee Module</h5>
      <p class="card-text">Employee is main subject of this AEMS. It helps employee to manage their profile info, apply leave, see task and retrieve their pay slips.</p>
    </div>
  </div>
</div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
    </body>
</html>
