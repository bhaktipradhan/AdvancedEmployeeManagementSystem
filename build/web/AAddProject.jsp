<%-- 
    Document   : AAddProject
    Created on : Feb 19, 2023, 4:10:39 PM
    Author     : DC
--%>

<%--
<%@page import="java.sql.*"%>
<%//not in use
            String project= request.getParameter("project");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
            PreparedStatement pst = con.prepareStatement("insert into project (ProjectName) values(?)");
            pst.setString(1,project);
            pst.executeUpdate();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>
            alert("Project Added");
        </script>
    </body>
</html>
--%>