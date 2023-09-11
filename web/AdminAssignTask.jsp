<%-- 
    Document   : AdminAssignTask
    Created on : Feb 22, 2023, 8:17:31 PM
    Author     : DC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Assign Task</title>
        <style>
           td{
               padding-top: .5em;
    padding-bottom: .5em;
    padding-right: 15px;
            }
            input,textarea,select{
                width: 250px;
            }            
        </style>
    </head>
    <body>
        <%if(session.getAttribute("ausername")==null)
            {
                response.sendRedirect("Admin.jsp");
            }
        %>
        <jsp:include page="navbar.jsp"></jsp:include>
        <jsp:include page="dashboard.jsp"></jsp:include>
        <div class="container">
        <form action="AAssignTask.jsp">  
            </br><center>
                <h1>Assign Task</h1></br>
                <table>         
            <tr><td><label>Task: </label></td><td><input type="text" name="task" placeholder="Enter Task" required="required"></td></tr>
            <tr><td><label>Task Description: </label></td><td><textarea  name="description" placeholder="Enter Description" required="required"></textarea></td></tr>
            <tr><td><label>Assign To: </label></td><td><select name="assignTo" id="assignTo" required="required">
                <option>Select Employee</option>
                 <%Class.forName("com.mysql.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");  
                   Statement stmt = con.createStatement();                            
                   String query1 = "select * from empinfo";
                   ResultSet rs = stmt.executeQuery(query1);
                 
                  while(rs.next()) {          %>
                <option value="<%=rs.getString("EID")%>"><%=rs.getString("EID")%> - <%=rs.getString("EName")%></option>
                <%}%>
                </select></td></tr>
                <tr><td><label>Deadline Time: </label></td><td><input type="datetime-local" name="deadLine" required="required"</td></tr>
                <tr><td><label>Priority: </label></td><td><select name="priority" id="priority" required="required">
                    <option value="">Select Priority</option>
                <option value="Low">Low</option>
                <option value="Medium">Medium</option>
                <option value="Urgent">Urgent</option>
                </select></td></tr>           
                </table>
                </br>
                <input type="submit" value="Assign" style="color: whitesmoke; width: 125px;" class="btn btn-primary" name="assignTask">
                <input type="reset" class="btn btn-secondary" style="color: whitesmoke; width: 125px;"> 
            </center>
        </form>
        </div>
                <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>