<%-- 
    Document   : deleteLeave
    Created on : Feb 10, 2023, 3:44:16 PM
    Author     : DC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        String lid = request.getParameter("lid");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
        pst = con.prepareStatement("delete from leaveemp where LID = ?");
        pst.setString(1, lid);
        pst.executeUpdate();  
        
        %>
       
        <script>
            
            alert("Leave Application Deleted");
            
        </script>
         <jsp:include page="ViewStatus.jsp"></jsp:include> 