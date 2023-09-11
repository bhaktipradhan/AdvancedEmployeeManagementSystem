<%-- 
    Document   : leaveEmp
    Created on : Dec 21, 2022, 10:08:22 AM
    Author     : DC
--%>

<%@page import="java.sql.*" %>
<jsp:include page="navbar.jsp"></jsp:include>
<jsp:include page="eDashboard.jsp"></jsp:include>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style type="text/css">
            td{
               padding-top: .5em;
    padding-bottom: .5em;
    padding-right: 15px;
            }
            input,textarea,select{
                width: 250px;
            }
            submit{
             width:75%;   
            } 
            select{
                height: 30px;
            }
            
        </style>
        <title>Leave Application</title>
    </head>
    <body>     
       <%        
        if(session.getAttribute("username")==null)
        {
           response.sendRedirect("elogin.jsp");    
        }
       %>


    <center>
        <form id="leaveapp" action="AleaveEmp.jsp">
            </br></br>
            <h1>Leave Application</h1></br></br>
            <table>
                <tr><td>
                        <label>Leave Type:</label></td>
       
                    <td><select name="leaveType" id="typeL">
        <option>Select</option>
             <%Class.forName("com.mysql.jdbc.Driver");
                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");  
        
                  Statement stmt = con.createStatement();                
                  String u = "select * from leavetype";
                  ResultSet rs = stmt.executeQuery(u);
                 
                  while(rs.next()) {          %>
        <option><%=rs.getString("leaveType")%></option>
        <%}%>
                        </select></td></tr>
                <tr><td><label>Leave Start Date:</label></td><td><input type="date" name="StartDate" placeholder="Enter Start Date" id="start" required="required"/></td></tr>
        <tr><td><label>Leave End Date:</label></td><td><input type="date" name="EndDate" placeholder="Enter End Date" id="end" required="required"/></td></tr>
        <tr><td><label>Reason of Leave:</label></td><td><textarea style="padding:2px;" id="tR" name="reason" placeholder="reason"></textarea></td></tr>
            </table>
                        </br>
        <input type="submit" value="Apply" class="btn btn-primary">
        <script>
           $("#end").change(function () {
    var startDate = document.getElementById("start").value;
    var endDate = document.getElementById("end").value;

    if ((Date.parse(startDate) > Date.parse(endDate))) {
        alert("End date should be greater than Start date");
        document.getElementById("end").value = "";
    }
});
        </script>      
        </form>
</center>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
