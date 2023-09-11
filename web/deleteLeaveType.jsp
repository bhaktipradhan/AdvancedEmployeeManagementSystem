<%-- 
    Document   : deleteLeaveType
    Created on : Mar 31, 2023, 3:12:52 AM
    Author     : DC
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        String ltid = request.getParameter("ltid");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
        pst = con.prepareStatement("delete from leavetype where LTID = ?");
        pst.setString(1, ltid);
        pst.executeUpdate();  
        
        %>    
        <script>
            
            alert("Leave Type Deleted");        
        </script>
         <jsp:include page="allLeaveTypes.jsp"></jsp:include> 