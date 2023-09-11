<%-- 
    Document   : navbar
    Created on : 31 Mar, 2023, 11:31:01 PM
    Author     : rajan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AEMS</title>       
        <style type="text/css">
#d1{
  overflow: hidden;
  background-color: black;
  width: 100%;
}

#dd1 a {
  float: right;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

#dd1 a:hover {
  background-color: whitesmoke;
  color: black;
}

#d1 a:active {
  background-color: black;
  color: white;
}
nav{
    margin: 0px;
    width: 100%;
    padding: 0;
}
nav font{
    margin-left: 10px;
    margin-top: 10px;
}
.nav-right{
   float: left;
   text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 20px;
  font-family: verdana;
}
#d1 a{
    
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px
}
#n a:hover{
    background: black;
    color: white; 
}
#n a{
    padding-right: 50px;
        margin-right: 90px;
}
nav{
    margin: 0;
    padding: 0;
    
}
body{
    margin: 0;
    padding: 0;
    width: 100%;
}
        </style>
    </head>
        <div id="d1">
        <nav width="100%">
            <div class="nav-right">
                <a id="n" style="text-align:center" color="white" size='5px'><b>AEMS</b></a>
            </div>
            <div id="dd1">
            <a href="About.jsp">About</a>
            <a href="index.jsp">Home</a>
            </div>
        </nav> 
        </div>
</html>