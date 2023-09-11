<%-- 
    Document   : allPayslips
    Created on : Apr 4, 2023, 10:26:27 PM
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
        <style>
.scrollbar{
height: calc(100vh - 100%);
 padding-bottom: 5rem;
 margin-bottom : 50px;
}
.ccontent{
    margin-right: 5px;
    margin-left: 20%;
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
        </br>
       <center>
           <h1>Payroll</h1></center></br></br>
  
           <center>
           <div class="scrollbar">
              
        <div class="container">
        <div class="ccontent>"
        <div class="row">         
             <div class="col-sm-11">
                 <div class="panel-body">
                     <table id="tbl-deldep" class="table table-responsive table-bordered" cellpadding ="0"  width="100%">
                         <thead>
                                <tr><th>Pay ID</th>
                                    <th style="width:16%">From Date</th>
                                    <th style="width:16%">To Date</th>
                                    <th style="width:15%">Allowance ₹</th>
                                    <th style="width:15%">Deduction ₹</th>
                                    <th style="width:20%">Net Payment ₹</th>
                                    <th>Pay Slip  </th>
                             </tr>
                 
<%
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
    Statement stmt = con.createStatement();                
    String s = "select * from payroll order by PayID desc";
    ResultSet rs = stmt.executeQuery(s);
    while(rs.next())
    {
        String payId = rs.getString("PayID");
    %>  
    <tr>
        <td><%=rs.getString("PayID")%></td>
        <td><%=rs.getString("FromDate")%></td>
        <td><%=rs.getString("ToDate")%></td>
        <td><%=rs.getString("TotalAllow")%></td>
        <td><%=rs.getString("TotalDe")%></td>
        <td><%=rs.getString("Total")%></td>
        <td> <a href="paySlips.jsp?payId=<%=payId%>"><button  class='btn btn-primary'style="color:whitesmoke;border: none;">Pay Slip &nbsp; <i class=" fa fa-money"></i></button></a></td>
    </tr>
    <%
}
   %>
        </table>              
            </div>
            </div>
        </div>
        </div>
        </div>
           </center>
        <jsp:include page="footer.jsp"></jsp:include>    
    </body>
</html>
