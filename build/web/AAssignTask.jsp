<%-- 
    Document   : AAssignTask
    Created on : Feb 21, 2023, 11:51:04 PM
    Author     : DC
--%>

<%@page import="java.sql.*"%>
<%
    String task, description, assignTO, assignTime, deadLine, priority, status;
    status= "Pending";
    task = request.getParameter("task");
    description = request.getParameter("description");
    assignTO = request.getParameter("assignTo");
    deadLine = request.getParameter("deadLine");
    priority = request.getParameter("priority");
    status= "Pending";
    try
            {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
            
            PreparedStatement stmt = con.prepareStatement("insert into task (TaskName,Description,AssignTo,DeadLine,Priority,Status) values (?,?,?,?,?,?)");
            
            stmt.setString(1,task);
            stmt.setString(2,description);
            stmt.setString(3,assignTO);
            stmt.setString(4,deadLine);
            stmt.setString(5,priority);
            stmt.setString(6,status);         
            
            int row = stmt.executeUpdate();
            
            if(row==1)
            {
                %>
                <script>
                    alert("Task Assigned Successfully");
                    window.location(history.back());
                </script>
                <jsp:include page="AdminAssignTask.jsp"></jsp:include> 
                <%
            }
            else
            {
                out.println("Task Assigning Failed");
        %>
        
        <%
            }
            }
           catch(Exception e)
           {
                out.println(e);
           } 
        %>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    </body>
</html>
