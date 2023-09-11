<%-- 
    Document   : allLeaveTypes
    Created on : Mar 31, 2023, 3:07:18 AM
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
    position: absolute;
    margin-left: 300px;
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
        <div class="scrollbar">
        </br>
        <div class="container">
            <center><h1>Leave Types</h1></center>
            </br></br>
        <div class="ccontent">
        <a href="addLeaveType.jsp"><button class="btn btn-primary">Add Leave Type <i class="fa fa-plus"></i></button></a>
        </br></br>
        <div class="row">         
             <div class="col-xl-12">
                 <div class="panel-body">
                     <table id="tbl-deldep" class="table table-responsive table-bordered" cellpadding ="0"  width="100%">
                         <thead>
                             <tr>   <th width="35%">Leave Type ID</th>
                                    <th width="55%">Leave Type</th>
                                    <th width="15%">Delete  </th>
                             </tr>
                 
<%
    Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");    
            Statement stmt = con.createStatement();                
                 String slt = "select * from leavetype order by LTID";
                  ResultSet rs = stmt.executeQuery(slt);
                  while(rs.next())
                  {
                     String ltid = rs.getString("LTID");
                      %>  
                      <tr>
                           <td><%=rs.getString("LTID")%></td>
                           <td><%=rs.getString("leaveType")%></td>
                           <td> <a href="deleteLeaveType.jsp?ltid=<%=ltid%>"><button  class='btn btn-danger btn-xs pull-right'style="background:#d11a2a; color:whitesmoke;border: none;"> Delete <i class="fa fa-trash"></i></button></a></td>
                      </tr>
                      <%}
          %>
                    </table>              
                </div>
            </div>
        </div>
        </div>
        </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>