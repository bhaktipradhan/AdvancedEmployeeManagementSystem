<%-- 
    Document   : mAssignedTasks
    Created on : Mar 18, 2023, 7:15:58 AM
    Author     : DC
--%>

<% // Task Assigned by Manager %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Task Assigned To</title>
        <style>
            .ccontent{
    margin-right: 8px;
    position: absolute;
    margin-left: 45px;
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
    <center><h1>Task Assigned</h1></center>
        </br></br>
        <div class="container">
            <div class="ccontent">
            <center>
            <div class="scrollbar">
        <div class="row">
            
             <div class="col-xl-12">
                 <div class="panel-body">
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0"  width="100%">
                         <thead>
                             <tr>   <th>Task ID</th>
                                 <th style="width:25%">Task</th>
                                    <th>Employee ID</th>
                                    <th>Assign To</th>
                                    <th style="width:23%">Assign At</th>
                                    <th style="width:23%">Deadline</th>
                                    <th style="width:8%">Priority</th>
                                    <th style="width:8%">Status</th>
                                    <th style="width:20%">Update Status</th>
                             </tr>
                 
<%
    Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");    
            String username = (String)session.getAttribute("username"); 
            Statement stmt = con.createStatement();   
            String mdep = "select * from empinfo where EUsername='"+username+"'";
            ResultSet rs = stmt.executeQuery(mdep);
            while(rs.next()){
                String mdepartment = rs.getString("EDepartment");
                Statement st = con.createStatement();
                String meid = "select * from empinfo where EDepartment='"+mdepartment+"'";
                ResultSet rs1 = st.executeQuery(meid);
                while(rs1.next()){
                    Statement sta = con.createStatement();
                    String teid = rs1.getString("EID");
                    String emd = rs.getString("EID");
                 String se = "select * from task where AssignTo='"+teid+"' and AssignTo!='"+emd+"' order by TID desc";
                  ResultSet rs2 = sta.executeQuery(se);
                  while(rs2.next())
                  {
                     String tid = rs2.getString("TID");
                     String aeid = rs2.getString("AssignTo");
                     Statement stm = con.createStatement();
                     String qe = "select EName from empinfo where EID='"+aeid+"'";
                     ResultSet rs3 = stm.executeQuery(qe);
                     while(rs3.next()){
                      %>  
                      <tr>
                           <td><%=rs2.getString("TID")%></td>
                           <td><h6><b><%=rs2.getString("TaskName")%></b></h6></br>
                               <p><%=rs2.getString("Description")%></p>
                           </td>
                           <td><%=rs2.getString("AssignTo")%></td>
                           <td><%=rs3.getString("EName")%></td>
                           <td><%=rs2.getString("AssignTime")%></td>
                           <td><%=rs2.getString("DeadLine")%></td>
                           <td><%=rs2.getString("Priority")%></td>                      
                           <td><%=rs2.getString("Status")%></td>
                           <td><p><a href="TaskDone.jsp?tid=<%=tid%>"><button class="btn btn-primary" style="color: whitesmoke; border: none;">Completed <i class="fa fa-check"></i></i></button></a></p>
                      </tr>
                      <%
                      }
}
}
}
          %>
            </div>
            </div>
        </div>
        </div>
            </center>
       </div>
        </div>
          <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
