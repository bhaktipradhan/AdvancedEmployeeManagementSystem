<%-- 
    Document   : ProfileUpdate
    Created on : Dec 26, 2022, 9:04:55 AM
    Author     : DC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Update</title>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
.scrollbar{
height: calc(100vh - 100%);
 padding-bottom: 5rem;
 margin-bottom : 50px;
}
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp"></jsp:include>
        <jsp:include page="eDashboard.jsp"></jsp:include>
    <center>
        <form action="profUpAction.jsp">
            <center></br>
            <h1>Profile Update</h1></br>  
       <% 
        if(session.getAttribute("username")==null)
        {
           response.sendRedirect("elogin.jsp");    
        }
       %>
            
       <div class="container" style="margin-left:300px">
           <div class="scrollbar">
           
       <table class="table">
           <%
               try
               {
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
                  Statement stmt = con.createStatement();
                  String username = (String)session.getAttribute("username");
                  String u = "select * from empinfo where EUsername = '"+username+"'";
                  ResultSet rs = stmt.executeQuery(u);
                  if(rs.next())
                  {
                    %>
                        <tr><td>Employee ID: </td><td><%out.println(rs.getString(1));%></td></tr>
                        <tr>
                            <td>Name: </td>
                            <td><input type="text" class="form-control" name="name" value="<%out.println(rs.getString(2));%>"</td>
                        </tr>
                        <tr>
                            <td>Email ID: </td>
                            <td><input type="email" class="form-control" name="mid" value="<%out.println(rs.getString(3));%>"</td>
                        </tr>
                        <tr>
                            <td>Nationality: </td>
                            <td><input type="text" class="form-control" name="nation" value="<%out.println(rs.getString(4));%>"</td>
                        </tr>
                        <tr>
                            <td>Address: </td>
                            <td><input type="text" class="form-control" name="add" value="<%out.println(rs.getString(5));%>"</td>
                        </tr>
                        <tr>
                            <td>DOB: </td>
                            <td><input type="date" class="form-control" name="dob" value="<%= rs.getString("EDOB")%>"</td>
                        </tr>
                        <tr>
                            <td>Department: </td>
                            <td><%out.println(rs.getString(7));%></td>
                        </tr>
                        <tr>
                            <td>Post: </td>
                            <td><%out.println(rs.getString(8));%></td>
                        </tr>
                        <tr>
                            <td>Username: </td>
                            <td><input type="text" class="form-control" name="user" value="<%out.println(rs.getString(9));%>"</td>
                        </tr>
                        <tr>
                            <td>Password: </td>
                            <td><input type="password" class="form-control" name="pass" value="<%out.println(rs.getString(10));%>"</td>
                        </tr>
                        
                  <%}
                  
               }
               catch(Exception e)
               {
                   out.println(e);
               }                       
           %>    
        </table>
        <div align="right">
            <input type="submit" id="submit" value="submit" name="submit" class="btn btn-primary">
            <input type="reset" id="reset" value="reset" name="reset" class="btn btn-secondary">
       </div>  
       </div>
       </div>
        </form>
    </center>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
