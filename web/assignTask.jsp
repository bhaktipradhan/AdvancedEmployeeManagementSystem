<%-- 
    Document   : assignTask
    Created on : Feb 21, 2023, 4:18:59 PM
    Author     : DC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="navbar.jsp"></jsp:include>
<jsp:include page="eDashboard.jsp"></jsp:include>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Assign Task</title>
        <style>
            label{
                width:137px;
                display:inline-block;                
            }
            input[type="text"],input[type="datetime-local"], select{
                
                width: 250px;
                height: 30px;
            }
            textarea{
               
                width: 250px;
                height: 90px;
            }
            .ccontent{
                padding-left: 30px;
                padding-bottom: 50px; 
                padding-top: 50px;
                padding-right: 30px;                
            }

        </style>
    </head>
    <body>
               
       <% 
        if(session.getAttribute("username")==null)
        {
           response.sendRedirect("elogin.jsp");    
        }
       %>
       </br>
    <center>
       <div class="ccontent">
       <div class="container">
        <form action="AAssignTask.jsp">  
           <h1>Assign Task</h1>
            </br>
            </br>
            <table>
            <p><lable id="l1">Task: </lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="task" placeholder="Enter Task" required="required"></p>
            <p><label>Task Description: </label><textarea  name="description" placeholder="Enter Description" required="required"></textarea></p>
            <p><label>Assign To: </label><select name="assignTo" id="assignTo" required="required">
                <option>Select Employee</option>
<%                 
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");  
                   String username = (String)session.getAttribute("username"); 
                   
                   Statement stmt = con.createStatement(); 
                   String query3 ="select * from empinfo where EUsername='"+username+"'";
                   ResultSet rs1 = stmt.executeQuery(query3);                 
                   while(rs1.next()) {
                   Statement stm = con.createStatement(); 
                   String department= rs1.getString("EDepartment");
                   String u = "select * from empinfo where EDepartment='"+department+"' and EUsername!='"+username+"'";
                   ResultSet rs = stm.executeQuery(u);              
                   while(rs.next()) {          %>
                   <option value="<%=rs.getString("EID")%>"><%=rs.getString("EID")%> - <%=rs.getString("EName")%></option>
                <%
                }
}
%>
                </select></p>
                <p><label>Deadline Time: </label><input type="datetime-local" name="deadLine" required="required"</p>
                <p><label>Priority: </label><select name="priority" id="priority" required="required">
                <option value="">Select Priority</option>
                <option value="Low">Low</option>
                <option value="Medium">Medium</option>
                <option value="Urgent">Urgent</option>
                    </select></p></br>
            </table>
                <center><input type="submit" value="Assign" class="btn btn-primary" style="color: whitesmoke;" name="assignTask">
                    <input type="reset" class="btn btn-secondary"></center>                 
        </form>
       </div>
       </div>
                </center>
       <jsp:include page="footer.jsp"></jsp:include>         
    </body>
</html>
