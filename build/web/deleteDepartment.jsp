<%-- 
    Document   : deleteDepartment
    Created on : Feb 26, 2023, 8:31:43 PM
    Author     : DC
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        String did = request.getParameter("did");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
        pst = con.prepareStatement("delete from adddepartment where DID = ?");
        pst.setString(1, did);
        pst.executeUpdate();  
        
        %>    
        <script>
            
            alert("Department Deleted");        
        </script>
         <jsp:include page="allDepartment.jsp"></jsp:include> 