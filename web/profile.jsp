<%-- 
    Document   : profile
    Created on : Dec 24, 2022, 2:18:36 PM
    Author     : DC
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <style>
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp"></jsp:include>
        <jsp:include page="eDashboard.jsp"></jsp:include>
        
       <% 
        if(session.getAttribute("username")==null)
        {
           response.sendRedirect("elogin.jsp");    
        }
       %>
       <div class="content">
           <h1>Profile of <%out.println(session.getAttribute("username"));%></h1></br></br>
       <table class="table container">
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
                    <tr><td><b>Employee ID: </b></td><td><%out.println(rs.getString(1));%></td></tr>
                        <tr><td><b>Name: </b></td><td><%out.println(rs.getString(2));%></td></tr>
                        <tr><td><b>Email ID: </b></td><td><%out.println(rs.getString(3));%></td></tr>
                        <tr><td><b>Nationality: </b></td><td><%out.println(rs.getString(4));%></td></tr>
                        <tr><td><b>Address: </b></td><td><%out.println(rs.getString(5));%></td></tr>
                        <tr><td><b>DOB: </b></td><td><%out.println(rs.getString(6));%></td></tr>
                        <tr><td><b>Department: </b></td><td><%out.println(rs.getString(7));%></td></tr>
                        <tr><td><b>Post: </b></td><td><%out.println(rs.getString(8));%></td></tr>
                        <tr><td><b>Username: </b></td><td><%out.println(rs.getString(9));%></td></tr>
                        <tr><td><b>Password: </b></td><td><%out.println(rs.getString(10));%></td></tr>

                  <%}
                  
               }
               catch(Exception e)
               {
                   out.println(e);
               }                       
           %>    
       </table>
       </div>
       <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
