<%-- 
    Document   : ViewStatus
    Created on : Jan 18, 2023, 4:59:19 PM
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
        <title>Leaves Applicant</title>
        <style>
            .ccontent{
    margin-right: 5px;
    position: absolute;
    margin-left: 170px;
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

        <div class="container"> 
            <div class="hcontent">
                <center><h1>Leave Application Status</h1></center>
            </div>
            </br></br>
        <div class="ccontent scrollbar">
         <div class="row">
            
             <div class="col-lg-12">
                 <div class="panel-body">
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0"  width="100%">
                         <thead>
                             <tr>   <th>Leave ID</th>
                                    <th style="width:30%">Leave Type</th>
                                    <th style="width:25%">Start Date</th>
                                    <th style="width:25%">End Date</th>
                                    <th style="width:24%">Reason</th>
                                    <th>Status</th>
                                    <th style="width:9%">Delete</th>
                             </tr>
                 
<%
    Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");    
            String username = (String)session.getAttribute("username"); 
            Statement smt = con.createStatement();
                  
                  String l = "select * from empinfo where EUsername = '"+username+"'";
                  ResultSet rs1 = smt.executeQuery(l);
                  while(rs1.next())
                  {
            String id= rs1.getString("EID");
            String name= rs1.getString("EName");
            Statement stmt = con.createStatement();                
                 String s = "select * from leaveemp where EID='"+id+"' order by LID desc";
                  ResultSet rs = stmt.executeQuery(s);
                  while(rs.next())
                  {
                     String lid = rs.getString("LID");
                      %>  
                      <tr>
                           <td><%=rs.getString("LID")%></td>
                           <td><%=rs.getString("leaveType")%></td>
                           <td><%=rs.getString("StartDate")%></td>
                           <td><%=rs.getString("EndDate")%></td>
                           <td><%=rs.getString("Reason")%></td>                        
                           <td><%=rs.getString("Status")%></td>
                           <%if(rs.getString("Status").equals("Pending")){%>
                           <td><a href="deleteLeave.jsp?lid=<%=lid%>"><button class='btn btn-danger btn-xs pull-right'style="background:#d11a2a; color:whitesmoke;border: none;"> Delete <i class="fa fa-trash"></i></button></a></td>
                           <%}
else{
%>
                           <td><a href=""><button disabled class='btn btn-danger btn-xs pull-right'style="background:#d11a2a; color:whitesmoke;border: none;"> Delete <i class="fa fa-trash"></i></button></a></td>
<%
}
                           %>
                      </tr>
                      <%}
}
          %>
                    </table>              
                </div>
            </div>
        </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
