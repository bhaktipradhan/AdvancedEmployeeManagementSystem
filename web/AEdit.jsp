<%-- 
    Document   : AEdit
    Created on : Dec 8, 2022, 9:00:45 PM
    Author     : DC
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
.scrollbar{
    height: calc(100vh - 100%);
 padding-bottom: 5rem;
 margin-bottom : 50px;
}

/* Style the search field */
form.example input[type=text] {
  padding: 10px;
  font-size: 13px;
  border: 1px solid grey;
  float: left;
  width: 50%;
  background: #f1f1f1;
  margin-left: 33px;
}

/* Style the submit button */
form.example button {
  float: left;
  width: 6%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 13px;
  border: 1px solid grey;
  border-left: none; /* Prevent double borders */
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

/* Clear floats */
form.example::after {
  content: "";
  clear: both;
  display: table;
}
.ccontent{
    margin-left: 200px;
    margin-right: 5px;
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
        <div class="scrollbar">
            <center><h1><strong>Employees</strong></h1></center>
        </br>
        </br>
         <div class="container">
            <form id="form" method="post" action="AEdit.jsp" class="example">
                       <div class="form-group col-md-7">                          
       <input type="text" placeholder="Employee ID or Name or Username" name="empid">
  <button type="submit"><i class="fa fa-search"></i></button>
              
                        </div>
            </form>
        </div>
        </br>
        <div class="ccontent">
        <div class="row">
            <center> 
             <div class="col-xl-11">
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
                                    <th style="width:8%">Edit</th>
                                    <th>Delete</th>
                             </tr>  
                            
                             <%  
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
                                String empid = request.getParameter("empid");
                                 if (empid == null || empid.isEmpty())
                {
                                  String query = "select * from empinfo order by EID desc";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString(1);
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
else{
String query = "select * from empinfo where EID like '%"+empid+"%' or EName like '%"+empid+"%' or EUsername like '%"+empid+"%' order by EID desc";
                                  Statement stm = con.createStatement();
                                  
                                    ResultSet rs1 =  stm.executeQuery(query);
                                    
                                        while(rs1.next())
                                        {
                                            String id = rs1.getString(1);
                                   %>           
                             <tr>
                                 <td><%=rs1.getString("EID") %></td>
                                 <td><%=rs1.getString("EName") %></td>
                                 <td><%=rs1.getString("EEmailID") %></td>
                                 <td><%=rs1.getString("ENationality") %></td>
                                 <td><%=rs1.getString("EAddress") %></td>
                                 <td><%=rs1.getString("EDOB") %></td>
                                 <td><%=rs1.getString("EDepartment")%></td>
                                 <td><%=rs1.getString("EPost") %></td>
                                 <td><%=rs1.getString("EUsername") %></td>
                                 <td><%=rs1.getString("EPassword") %></td>
                                 <td><a href="uTest.jsp?id=<%=id%>"><button style="background:#009EFF; color: whitesmoke; border: none;" class="btn btn-primary">Edit <i class="fa fa-pencil-square-o"></i></button></a></td>
                                 <td><a href="delete.jsp?id=<%=id%>"><button  class='btn btn-danger btn-xs pull-right'style="background:#d11a2a; color:whitesmoke;border: none;"> Delete <i class="fa fa-trash"></i></button></a></td>
                             </tr> 
                                                      <br><br><br><br>  
                                <%                               
                                 }

}
                               %>
         
                     </table>    
                 </div>
                </div>
            </center>
            </div> 
        </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>