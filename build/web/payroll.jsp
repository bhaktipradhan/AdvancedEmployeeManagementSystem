<%-- 
    Document   : payroll
    Created on : Feb 28, 2023, 8:57:53 AM
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
        <title>Payroll</title>
        <style>
             td{
               padding-top: .5em;
    padding-bottom: .5em;
    padding-right: 15px;
            }
            input,select{
                width: 250px;
            }  
            select{
                height: 30px;
            }
        </style>
    </head>
    <body>
    <center>
        <%if(session.getAttribute("ausername")==null)
            {
                response.sendRedirect("Admin.jsp");
            }
        %>
        <jsp:include page="navbar.jsp"></jsp:include>
        <jsp:include page="dashboard.jsp"></jsp:include>
            <form action="APayroll.jsp">
                </br>
                <center><h1>Payroll</h1></center>
                </br>
                <table>
        <tr><td><label>Employee Id - Name :</label></td><td>
                <select name="employee" id="employee" required="required">
                <option>Select Employee</option>
<%                 
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
                   Statement stmt = con.createStatement();
                   String u = "select * from empinfo";
                   ResultSet rs = stmt.executeQuery(u);              
                   while(rs.next()) {          %>
                   <option value="<%=rs.getString("EID")%>"><%=rs.getString("EID")%> - <%=rs.getString("EName")%></option>
                <%
                }
%>   
        </select></td></tr>
        <tr><td><label>From:</label></td><td>
            <input type="date" id="fromdate" name="fromdate" required="required"></td></tr>
         <tr><td><label>To:</label></td><td>
             <input type="date" id="todate" name="todate" required="required"></td></tr>
        <tr><td><label>Basic Salary: </label></td><td>
        <input type="text" id="basicSalary" name="basicSalary" placeholder="Enter Basic Salary" required="required">
        <br></td></tr>
        <tr><td><label>Medical Allowance: </label></td><td>
        <input type="text" id="mediallow" name="mediallow" placeholder="Enter Medical Allowance" required="required">
        <br></td></tr>
        <tr><td><label>Food Allowance: </label></td><td>
            <input type="text" id="foodallow" name="foodallow" placeholder="Enter Food Allowance" required="required">
        <br></td></tr>
        <tr><td><label>Other Allowance: </label></td><td>
            <input type="text" id="otherallow" name="otherallow" placeholder="Enter Allowance" required="required">
        <br></td></tr>
        <tr><td><label>Tax: </label></td><td>
            <input type="text" id="tax" name="tax" placeholder="Enter Tax" required="required">
        <br></td></tr>
        <tr><td><label>Other Deduction: </label></td><td>
            <input type="text" id="deduction" name="deduction" placeholder="Enter Other Deduction" required="required">
        <br></td></tr>
                </table></br>
                <input type="submit" class="btn btn-primary" name="submit" id="pay">
               
<script>
           $("#todate").change(function () {
    var fromDate = document.getElementById("fromdate").value;
    var toDate = document.getElementById("todate").value;

    if ((Date.parse(fromDate) > = Date.parse(toDate))) {
        alert("End date should be greater than Start date");
        document.getElementById("todate").value = "";
    }
});
</script>          
    </form>
    </center>
<jsp:include page="footer.jsp"></jsp:include>            
    </body>
</html>
