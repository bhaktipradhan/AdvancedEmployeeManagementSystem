<%-- 
    Document   : Login
    Created on : Aug 9, 2022, 3:49:56 PM
    Author     : DC
--%>
<%@page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <%
            String username = request.getParameter("user");
            String password = request.getParameter("pass");
            try
            {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
            PreparedStatement ps=con.prepareStatement("select EUsername,EPassword from empinfo where EUsername=? and EPassword=?");
            
            ps.setString(1,username);
            ps.setString(2,password);
            ResultSet rs=ps.executeQuery();
            if (rs.next())
           {    session.setAttribute("username",username);
                %>
                <jsp:include page="EmployeeHomepg.jsp"></jsp:include>
                <%
            }
            else
            {
                
        %>
        <script>
            alert("Wrong Username or Password. Try Again");
        </script>
        <jsp:include page="elogin.jsp"></jsp:include> 
        <%
            }
            
            }catch(Exception e)
            {
                out.println(e);
            }
        %>
    </body>
</html>
