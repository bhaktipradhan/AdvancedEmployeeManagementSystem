<%-- 
    Document   : Registration
    Created on : Aug 9, 2022, 4:55:41 PM
    Author     : DC
--%>

<%@page language="java" %>
<%@page import="java.sql.*,java.io.*,java.util.*" %>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
    </head>
    <body>
        <%
            String name, email, nationality, address, DOB, department, post, username, password;
            
            name = request.getParameter("name");
            email = request.getParameter("mid");
            nationality = request.getParameter("nation");
            address = request.getParameter("add");
            DOB = request.getParameter("dob");
            department = request.getParameter("department");
            post = request.getParameter("post");
            username = request.getParameter("user");
            password = request.getParameter("pass");
            
            session.setAttribute("name",name);
            session.setAttribute("email",email);
            session.setAttribute("post",post);
            session.setAttribute("department",department);
            session.setAttribute("username",username);
            session.setAttribute("password",password);
                        
            try
            {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
            
            PreparedStatement stmt = con.prepareStatement("insert into empinfo (Ename,EEmailID,ENationality,EAddress,EDOB,EDepartment,EPost,EUsername,EPassword) values (?,?,?,?,?,?,?,?,?)");
            
            stmt.setString(1,name);
            stmt.setString(2,email);
            stmt.setString(3,nationality);
            stmt.setString(4,address);
            stmt.setString(5,DOB);
            stmt.setString(6,department);
            stmt.setString(7,post);
            stmt.setString(8,username);
            stmt.setString(9,password);
            
            int row = stmt.executeUpdate();
            
            if(row==1)
            {
                %>
                <script>
                    alert("Registration Done");                  
                </script>             
                <jsp:include page="ERegistration.jsp"></jsp:include>
       <%
            }
            }
           catch(Exception e)
           {
                out.println(e);
           } 
        %>
    </body>
</html>
