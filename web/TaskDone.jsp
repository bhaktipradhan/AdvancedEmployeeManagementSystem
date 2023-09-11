<%-- 
    Document   : TaskDone
    Created on : Feb 26, 2023, 7:40:45 PM
    Author     : DC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <% 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
    String tid =request.getParameter("tid");
    Statement stmt = con.createStatement();                
    String u = "select * from task";
    ResultSet rs = stmt.executeQuery(u);
    while(rs.next()){         
    PreparedStatement pst;
    pst = con.prepareStatement("update task set Status='Completed' where TID='"+tid+"'");
    int row = pst.executeUpdate();
    if(row ==1)
        {    
%>       
<script>
    history.back();   
</script>
    <% } 
}%>    

