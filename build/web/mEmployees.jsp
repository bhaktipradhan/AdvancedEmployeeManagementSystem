<%-- 
    Document   : mEmployees
    Created on : 28 Mar, 2023, 5:39:38 PM
    Author     : rajan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <title>Admin Page to Edit</title>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            * {
  box-sizing: border-box;
}

form.example input[type=text] {
  padding: 10px;
  font-size: 13px;
  border: 1px solid grey;
  float: left;
  width: 50%;
  background: #f1f1f1;
  margin-left: 45px;
}

form.example button {
  float: left;
  width: 6%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 13px;
  border: 1px solid grey;
  border-left: none; 
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}
.ccontent{
    margin-right: 10px;
    position: absolute;
    margin-left: 45px;
}
.ccontent table{
   align-content: center;
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
    <center><h1>Employees</h1></center>
        </div>
        </br>
        </br>
         <div class="container">
            <form id="form" method="post" action="mEmployees.jsp" class="example">
                       <div class="form-group col-md-6">                          
       <input type="text" placeholder="Employee ID or Name or Username" name="empid">
  <button type="submit"><i class="fa fa-search"></i></button>
              
                        </div>
            </form>
        </div>
        </br>
        <div class="container">
        <div class="row">
            <div class="ccontent">
                
             <div class="col-sm-11">
                 <div class="panel-body">
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0"  width="100%">
                         <thead>
                             <tr>
                                    <th>Employee ID</th>
                                    <th>Employee Name</th>
                                    <th>Email ID</th>
                                    <th>Nationality</th>
                                    <th>Address</th>
                                    <th>DOB</th>
                                    <th>Department</th>
                                    <th>Post</th>
                                    <th>Username</th>
                                    <th>Password</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                            
                             <%  
String empid = request.getParameter("empid");
Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");    
            String username = (String)session.getAttribute("username"); 
                                 if (empid == null || empid.isEmpty()){
            String et = "select * from empinfo where EUsername='"+username+"'";
            Statement stm = con.createStatement();
            ResultSet rs1 = stm.executeQuery(et);
                  while(rs1.next()){
            Statement stmt = con.createStatement();
            String eidt = rs1.getString("EDepartment");
            String s = "select * from empinfo where EDepartment='"+eidt+"' and EUsername!='"+username+"'";
                  ResultSet rs = stmt.executeQuery(s);
                  while(rs.next())
                                        {
                                            String id = rs.getString("EID");
                                   %>           
                             <tr>
                                 <td><%=rs.getString("EID") %></td>
                                 <td><%=rs.getString("EName") %></td>
                                 <td><%=rs.getString("EEmailID") %></td>
                                 <td><%=rs.getString("ENationality") %></td>
                                 <td><%=rs.getString("EAddress") %></td>
                                 <td><%=rs.getString("EDOB") %></td>
                                 <td><%=rs.getString("EDepartment")%></td>
                                 <td><%=rs.getString("EPost") %></td>
                                 <td><%=rs.getString("EUsername") %></td>
                                 <td><%=rs.getString("EPassword") %></td>
                                 <td><a href="uTest.jsp?id=<%=id%>"><button style="background:#009EFF; color: whitesmoke; border: none;" class="btn btn-primary">Edit <i class="fa fa-pencil-square-o"></i></button></a></td>
                                 <td><a href="delete.jsp?id=<%=id%>"><button  class='btn btn-danger btn-xs pull-right'style="background:#d11a2a; color:whitesmoke;border: none;"> Delete <i class="fa fa-trash"></i></button></a></td>
                             </tr>                                                       
                                <%                               
                                 }
}
}
else{
String et = "select * from empinfo where EUsername='"+username+"'";
Statement stm = con.createStatement();
            ResultSet rs1 = stm.executeQuery(et);
                  while(rs1.next()){
            Statement stmt = con.createStatement();
            String eidt = rs1.getString("EDepartment");
            String s = "select * from empinfo where EDepartment='"+eidt+"' and EUsername!='"+username+"' and (EID like '%"+empid+"%' or EName like '%"+empid+"%' or EUsername like '%"+empid+"%')";
                  ResultSet rs = stmt.executeQuery(s);
                  while(rs.next())
                                        {
                                            String id = rs.getString("EID");
                                   %>           
                             <tr>
                                 <td><%=rs.getString("EID") %></td>
                                 <td><%=rs.getString("EName") %></td>
                                 <td><%=rs.getString("EEmailID") %></td>
                                 <td><%=rs.getString("ENationality") %></td>
                                 <td><%=rs.getString("EAddress") %></td>
                                 <td><%=rs.getString("EDOB") %></td>
                                 <td><%=rs.getString("EDepartment")%></td>
                                 <td><%=rs.getString("EPost") %></td>
                                 <td><%=rs.getString("EUsername") %></td>
                                 <td><%=rs.getString("EPassword") %></td>
                                 <td><a href="uTest.jsp?id=<%=id%>"><button style="background:#009EFF; color: whitesmoke; border: none;" class="btn btn-primary">Edit <i class="fa fa-pencil-square-o"></i></button></a></td>
                                 <td><a href="delete.jsp?id=<%=id%>"><button  class='btn btn-danger btn-xs pull-right'style="background:#d11a2a; color:whitesmoke;border: none;"> Delete <i class="fa fa-trash"></i></button></a></td>
                             </tr>                                                       
                                <%                               
                                 }
}
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