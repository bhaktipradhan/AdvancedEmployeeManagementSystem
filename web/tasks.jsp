<%-- 
    Document   : tasks
    Created on : Feb 22, 2023, 2:33:02 PM
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
        <title>Tasks</title>
        <style>
            .ccontent{
    margin-left: 250px;
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
    <div class="scrollbar">
    <div class="hcontent">
        <center><h1>Tasks</h1></center>
    </div>
    </br></br>
<div class="ccontent">  
    <div class="container">
         <div class="row">           
             <div class="col-lg-10">
                 <div class="panel-body">
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0"  width="100%">
                         <thead>
                             <tr>   <th>Task ID</th>
                                 <th style="width:25%">Task</th>
                                    <th style="width:25%">Assign At</th>
                                    <th style="width:25%">Deadline</th>
                                    <th>Priority</th>
                                    <th style="width:10%">Status</th>
                                    <th style="width:28%">Update Status</th>
                             </tr>
                 
<%
    Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");    
            String username = (String)session.getAttribute("username"); 
            String et = "select * from empinfo where EUsername='"+username+"'";
            Statement stm = con.createStatement();
            ResultSet rs1 = stm.executeQuery(et);
                  while(rs1.next()){
            Statement stmt = con.createStatement();
            String eidt = rs1.getString("EID");
            String s = "select * from task where AssignTo='"+eidt+"' order by TID desc";
                  ResultSet rs = stmt.executeQuery(s);
                  while(rs.next())
                  {
                     String tid = rs.getString("TID");
                      %>  
                      <tr>
                           <td><%=rs.getString("TID")%></td>
                           <td><h6><b><%=rs.getString("TaskName")%></b></h6>
                               <p><%=rs.getString("Description")%></p>
                           </td>
                           <td><%=rs.getString("AssignTime")%></td>
                           <td><%=rs.getString("DeadLine")%></td>
                           <td><%=rs.getString("Priority")%></td>                      
                           <td><%=rs.getString("Status")%></td>
                           <td><a href="TaskDone.jsp?tid=<%=tid%>"><button class="btn btn-primary" style="background:#009EFF; color: whitesmoke; border: none;">Completed <i class="fa fa-check"></i></i></button></a></td>
                      </tr>
                      <%}
}

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
