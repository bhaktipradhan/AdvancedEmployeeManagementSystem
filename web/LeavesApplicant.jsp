<%-- 
    Document   : LeavesApplicant
    Created on : Dec 22, 2022, 1:09:24 PM
    Author     : DC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Leaves Applicant</title>
        <style>
            .ccontent{
    margin-right: 5px;
    position: absolute;
    margin-left: 45px;
}
.scrollbar{
height: calc(100vh - 100%);
 padding-bottom: 5rem;
 margin-bottom : 55px;
}
        </style>
    </head>
    <body>
        <div class="scrollbar">
        <%if(session.getAttribute("ausername")==null)
            {
                response.sendRedirect("Admin.jsp");
            }
        %>
        <jsp:include page="navbar.jsp"></jsp:include>
        <jsp:include page="dashboard.jsp"></jsp:include>
        </br>
        
        <div class="container">
        <center>     
        <h1>Leave Applications</h1>
        </center>
        <div class="ccontent">
        </br>
         <div class="row">          
             <div class="col-sm-12">
                 <div class="panel-body">
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0"  width="100%">
                         <thead>
                             <tr>
                                    <th>Leave ID</th>
                                    <th>Employee ID</th>
                                    <th style="width:13%">Employee's Name </th>
                                    <th style="width:11%">Leave Type</th>
                                    <th style="width:9%">Start Date </th>
                                    <th style="width:9%">End Date</th>
                                    <th style="width:15%">Reason </th>
                                    <th style="width:9%">Time Stamp</th>
                                    <th>Status</th>
                                    <th style="width:17%">Action</th>
                             </tr>
                 
<%
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");  
        
                  Statement stmt = con.createStatement();                
                  String u = "select * from leaveemp order by LID desc";
                  ResultSet rs = stmt.executeQuery(u);
                 
                  while(rs.next())           
                  {
                     String lid= rs.getString("LID");
                      %>  
                      <tr>
                          <td><%=rs.getString("LID")%></td>
                          <td><%=rs.getString("EID")%></td>
                          <td><%=rs.getString("EName")%></td>
                          <td><%=rs.getString("leaveType")%></td>
                          <td><%=rs.getString("StartDate")%></td>
                          <td><%=rs.getString("EndDate")%></td>
                          <td><%=rs.getString("Reason")%></td>
                          <td><%=rs.getString("TimeEntry")%></td>                         
                          <td><%=rs.getString("Status")%></td>
                          <td><a href="ApproveLeave.jsp?lid=<%=lid%>"><button class="btn-success" style="color: black">Approve <i class="fa fa-check-circle"></i></button></a>
                              <a href="RejectLeave.jsp?lid=<%=lid%>"><button class="btn-danger" style="color: black">Reject <i class="fa fa-close"></i></button></a>                  
                      </tr>                                                     
        <% }                               
%>      
               </table>              
             </div>
           </div>            
        </div>
        </div>
        </div>
        
       <jsp:include page="footer.jsp"></jsp:include>
       </div>
    </body>
</html>
