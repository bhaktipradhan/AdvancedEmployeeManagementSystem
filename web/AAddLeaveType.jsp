<%-- 
    Document   : AAddLeaveType
    Created on : Feb 19, 2023, 11:22:20 AM
    Author     : DC
--%>
<%-- <% //Not in use%>
<%@page import="java.sql.*"%>
<%
            String leaveType= request.getParameter("leavetype");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
            PreparedStatement pst = con.prepareStatement("insert into leavetype (leaveType) values(?)");
            pst.setString(1,leaveType);
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
            alert("Leave Type Added");
        </script>
    </body>
</html>
--%>    