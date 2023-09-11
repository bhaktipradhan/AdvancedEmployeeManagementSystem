<%-- 
    Document   : reg
    Created on : Feb 19, 2023, 3:28:23 PM
    Author     : DC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Registration Form</title>
        <style type="text/css">
            label{
                width:120px;
                display:inline-block;
                font-weight: bold;
            }
            .container label{
                
            }
            td{
               padding-top: .5em;
    padding-bottom: .5em;
            }
            .scrollbar{
                height: calc(100vh - 100%);
 padding-bottom: 5rem;
 margin-bottom : 35px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp"></jsp:include>
        <div class="scrollbar">
            <center>
        <div class="card-body">
        <form action="Registration.jsp">
            <br>
                <h2>Employee Registration</h2><br>
                <br>
                <table align="center">
                <tr><td><lable><b>Name:</b></lable></td><td><input type="text" name="name" placeholder="Enter Name" required="required"></td></tr>
                
                <tr><td><lable><b>Email ID:</b></lable></td><td><input type="email" name="mid" placeholder="Enter Email ID" required="required"></td></tr>
                
                <tr><td><label>Nationality:</label></td><td><input type="text" name="nation" placeholder="Enter Nationality" required="required"></td></tr>
                
                <tr><td><lable><b>Address:</b></lable></td><td><input type="text" name="add" placeholder="Enter Address" required="required"></td></tr>
                
<tr><td><lable><b>DOB:</b></lable></td><td><input type="date" name="dob" required="required"></td></tr>
                <tr><td><label>Department:</label></td><td>
                <select name="department" id="department" required="required">
                <option>Select Department</option>
                 <%Class.forName("com.mysql.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");  
        
                   Statement stmt = con.createStatement();                
                   String u = "select * from adddepartment";
                   ResultSet rs = stmt.executeQuery(u);
                 
                  while(rs.next()) {          %>
                <option><%=rs.getString("DepartmentName")%></option>
                <%}%>
                </select></td></tr>
                
                <tr><td><label>Post:</label></td><td><input type="text" name="post" placeholder="Enter Post" required="required"></td></tr>
                
                <tr><td><lablel><b>Username:</b></lablel></td><td><input type="text" name="user" placeholder="Enter Username" required="required"></td></tr>
                
                <tr><td><label>Password:</label></td><td><input type="password" name="pass" placeholder="Enter Password:" required="required"></td></tr>
               </table></br>
        
               <center><input type="submit" value="Register" class="btn btn-primary"> <input type="reset" class="btn btn-secondary"</center><br>
               </br>      <center>Already have account?<a href="elogin.jsp">Login</a>
               </center>
    
        </form>                 
        
        </div>
            </center>
        </div>
    <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
