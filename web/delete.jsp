<%-- 
    Document   : delete
    Created on : Dec 16, 2022, 7:42:40 PM
    Author     : DC
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
        String id = request.getParameter("id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
        pst = con.prepareStatement("delete from empinfo where EID = ?");
        pst.setString(1, id);
        pst.executeUpdate();  
        
        %>
       
        <script>
            
            alert("Record Deleted");
            
        </script>