<%-- 
    Document   : AAddDepartment
    Created on : Feb 16, 2023, 8:41:48 PM
    Author     : DC
--%>

<%@page import="java.sql.*"%>
<%
            String department= request.getParameter("department");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
            PreparedStatement pst = con.prepareStatement("insert into adddepartment (DepartmentName) values(?)");
            pst.setString(1,department);
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
            alert("Department Added");
        </script>    
        <jsp:forward page="allDepartment.jsp"></jsp:forward>
    </body>
</html>
