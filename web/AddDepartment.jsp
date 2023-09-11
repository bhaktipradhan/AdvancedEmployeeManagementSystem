<%-- 
    Document   : AddDepartment
    Created on : Feb 16, 2023, 7:54:40 PM
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
        <title>Add Department</title>
    </head>
    <body>
        <%if(session.getAttribute("ausername")==null)
            {
                response.sendRedirect("Admin.jsp");
            }
        %>
        <jsp:include page="navbar.jsp"></jsp:include>
        <jsp:include page="dashboard.jsp"></jsp:include>
        </br>
    <center>
        <form action="AAddDepartment.jsp">
            <h2>Add Department</h2></br></br>            
            <input type="text" name="department" placeholder="Enter Department Name" required="required"></br></br>
            <input type="submit" value="Add" class="btn btn-primary" name="addDepartment">                 
        </form> 
    </center>
    <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
