<%-- 
    Document   : allDepartment
    Created on : Mar 27, 2023, 8:31:04 AM
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
        <title>Departments</title>
        <style>
            .center{
                margin-left: auto;
  margin-right: auto;
            }

        </style>
        
    </head>
    <body>
        <%if(session.getAttribute("ausername")==null)
            {
                response.sendRedirect("Admin.jsp");
            }
        %>
        <div>
        <jsp:include page="navbar.jsp"></jsp:include>
        <jsp:include page="dashboard.jsp"></jsp:include>
        </div>
        </br>
        <div class="content">
        <h1>All Departments</h1>
        </br>
        <a href="AddDepartment.jsp"><button id="ad" class="btn btn-primary ad"> Add Department <i class="fa fa-plus"></i></button></a>
        </br></br>
        <div class="row">         
             <div class="col-sm-11">
                 <div class="panel-body">
                     <table id="tbl-deldep" class="table table-responsive table-bordered center" cellpadding ="0"  width="100%">
                         <thead>
                             <tr>   <th width="35%">Department ID</th>
                                    <th width="44%">Department Name</th>
                                    <th>Delete  </th>
                             </tr>
                 
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");    
    Statement stmt = con.createStatement();                
                 String s = "select * from adddepartment order by DID";
                  ResultSet rs = stmt.executeQuery(s);
                  while(rs.next())
                  {
                     String did = rs.getString("DID");
                      %>  
                      <tr>
                           <td><%=rs.getString("DID")%></td>
                           <td><%=rs.getString("DepartmentName")%></td>
                           <td> <a href="deleteDepartment.jsp?did=<%=did%>"><button  class='btn btn-danger btn-xs pull-right'style="background:#d11a2a; color:whitesmoke;border: none;"> Delete <i class="fa fa-trash"></i></button></a></td>
                      </tr>
                      <%}
          %>
                    </table>              
                </div>
            </div>
        </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
