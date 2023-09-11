<%-- 
    Document   : payrolls
    Created on : Apr 3, 2023, 10:40:59 AM
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
        <title>Payroll Page</title>
        <style>
         .ccontent{
    margin-right: 5px;
    position: absolute;

}
.scrollbar{
height: calc(100vh - 100%);
 padding-bottom: 5rem;
 margin-bottom : 50px;
}
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp"></jsp:include>
        <jsp:include page="eDashboard.jsp"></jsp:include>
        
       <% 
        if(session.getAttribute("username")==null)
        {
           response.sendRedirect("elogin.jsp");    
        }
       %>
        </br>
       <center>
           <h1>Payroll</h1></center></br></br>
  
           <div class="scrollbar">
               <center>
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
    String username = (String)session.getAttribute("username"); 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
    Statement stm = con.createStatement();
    String up = "select * from empinfo where Eusername='"+username+"'";
    ResultSet rs1 = stm.executeQuery(up);
    while (rs1.next()){
    String uep = rs1.getString("EID");
    Statement stmt = con.createStatement();                
    String s = "select * from payroll where EID='"+uep+"' order by PayID desc";
    ResultSet rs = stmt.executeQuery(s);
    while(rs.next())
    {
        String payid = rs.getString("PayID");
    %>  
    <tr>
        <td><%=rs.getString("PayID")%></td>
        <td><%=rs.getString("FromDate")%></td>
        <td><%=rs.getString("ToDate")%></td>
        <td><%=rs.getString("TotalAllow")%></td>
        <td><%=rs.getString("TotalDe")%></td>
        <td><%=rs.getString("Total")%></td>
        <td> <a href="paySlip.jsp?payid=<%=payid%>"><button  class='btn btn-primary'style="color:whitesmoke;border: none;">Pay Slip &nbsp; <i class="fa fa-money"></i></button></a></td>
    </tr>
    <%}
}
   %>
        </table>              
            </div>
            </div>
        </div>
        </div>
               </center>
        </div>
        <jsp:include page="footer.jsp"></jsp:include> 
    </body>
</html>
