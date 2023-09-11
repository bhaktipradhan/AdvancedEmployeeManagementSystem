<%-- 
    Document   : allAssignedTask
    Created on : Feb 22, 2023, 3:22:45 PM
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
        <title>All Assigned Task</title>
        <style>
            .scrollbar{
height: calc(100vh - 100%);
 padding-bottom: 5rem;
 margin-bottom : 50px;
}
.ccontent{
    margin-right: 5px;
    position: absolute;
    margin-left: 43px;
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
        <div class="container">
            </br>
            <center><h1>All Assigned Task</h1></center>
        </br>
        </br>
        <div class="ccontent">
        <div class="row">
            
             <div class="col-sm-12">
                 <div class="panel-body">
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0"  width="100%">
                         <thead>
                             <tr>   <th>Task ID</th>
                                 <th style="width:25%">Task</th>
                                    <th>Employee ID</th>
                                    <th>Assign To</th>
                                    <th>Assign At</th>
                                    <th>Deadline</th>
                                    <th>Priority</th>
                                    <th>Status</th>
                                    <th style="width:11%">Update Status</th>
                             </tr>
                 
<%
    Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");    
            String username = (String)session.getAttribute("username"); 
            Statement stmt = con.createStatement();                
                 String s = "select * from task order by TID desc";
                  ResultSet rs = stmt.executeQuery(s);
                  while(rs.next())
                  {
                     String tid = rs.getString("TID");
                     String aeid = rs.getString("AssignTo");
                     Statement stm = con.createStatement();
                     String qe = "select EName from empinfo where EID='"+aeid+"'";
                     ResultSet rs1 = stm.executeQuery(qe);
                     while(rs1.next()){
                      %>  
                      <tr>
                           <td><%=rs.getString("TID")%></td>
                           <td><h6><b><%=rs.getString("TaskName")%></b></h6></br>
                               <p><%=rs.getString("Description")%></p>
                           </td>
                           <td><%=rs.getString("AssignTo")%></td>
                           <td><%=rs1.getString("EName")%></td>
                           <td><%=rs.getString("AssignTime")%></td>
                           <td><%=rs.getString("DeadLine")%></td>
                           <td><%=rs.getString("Priority")%></td>                      
                           <td><%=rs.getString("Status")%></td>
                           <td><p><a href="TaskDone.jsp?tid=<%=tid%>"><button  class="btn btn-primary"style="background:#009EFF; color: whitesmoke; border: none;">Completed <i class="fa fa-check"></i></button></a></p>
                      </tr>
                      <%
                      }
}
          %>
          </div>
             </div>
        </div>
        </div>
        </div>
    </div>
          <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
