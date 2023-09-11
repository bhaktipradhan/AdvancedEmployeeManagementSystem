<%-- 
    Document   : addLeaveType
    Created on : Feb 8, 2023, 7:31:37 PM
    Author     : DC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Leave Type</title>
    </head>
    <body>
        <%if(session.getAttribute("ausername")==null)
            {
                response.sendRedirect("Admin.jsp");
            }
        %>
        <jsp:include page="navbar.jsp"></jsp:include>
        <jsp:include page="dashboard.jsp"></jsp:include>
        <form action="addLeaveType.jsp" method="post">
            </br>
            <center><h1>Add Leave Type</h1></br></br>
            <input type="text" name="leavetype" placeholder="Enter Leave Type" required="required"></br></br>
            <input type="submit" value="Add" class="btn btn-primary" name="addLeavetype">
            </center>
        </form>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
<%if(request.getParameter("leavetype")!= null){
            String leaveType= request.getParameter("leavetype");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
            PreparedStatement pst = con.prepareStatement("insert into leavetype (leaveType) values(?)");
            pst.setString(1,leaveType);
            pst.executeUpdate();
%>
<script>
    alert("Leave Type Added");
</script>
<% } %>