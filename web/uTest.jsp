<%-- 
    Document   : uTest
    Created on : Dec 16, 2022, 7:55:22 PM
    Author     : DC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 
        <jsp:include page="navbar.jsp"></jsp:include>
        <% if(session.getAttribute("ausername")!= null){%>
        <jsp:include page="dashboard.jsp"></jsp:include>
        <%
        }
else if(session.getAttribute("username")!= null){%>
<jsp:include page="eDashboard.jsp"></jsp:include>
        <%
        }
%>
<%
     if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("mid");
        String nationality = request.getParameter("nation");
        String address = request.getParameter("add");
        String dob = request.getParameter("dob");
        String department = request.getParameter("department");
        String post = request.getParameter("post");
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/mysql","root","12345");
        pst = con.prepareStatement("update empinfo set EID = ?,EName =?,EEMailID = ?,ENationality =?,EAddress= ?,EDOB = ?,EDepartment =?,EPost= ?,EUsername= ?,EPassword= ? where EID = ?");
        pst.setString(1, id);
        pst.setString(2, name);
        pst.setString(3, email);
        pst.setString(4, nationality);
        pst.setString(5, address);
        pst.setString(6, dob);
        pst.setString(7, department);
        pst.setString(8, post);
        pst.setString(9, username);
        pst.setString(10, password);
        pst.setString(11, id);
        pst.executeUpdate();  
    
    %>
        <script>
            
            alert("Record Updated");
            
        </script>
        <% } %>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>       
        <link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            td{
                padding-top: .5em;
                padding-bottom: .5em;
            }
        </style>                
    </head>
    <body>
     
             <form  method="POST" action="#" >
                 <center>
                     <h1>Employee's Information Update</h1></br>   
                    <%    
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/mysql","root","12345");
                          
                        String id = request.getParameter("id");
                          
                        pst = con.prepareStatement("select * from empinfo where EID = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                        while(rs.next())
                        {
                    
                    %>
                    <table>
                        <tr>
                            <td>Employee's ID: </td>
                            <td><input type="text" disabled class="form-control" placeholder="ID" value="<%= rs.getString("EID")%>" name="sname" id="sname" required ></td>
                        </tr>
                        
                        <tr>
                            <td>Employee's Name: </td>
                            <td><input type="text" class="form-control" placeholder="name" name="name" value="<%= rs.getString("EName")%>" id="name" required ></td>
                        </tr>
                        
                        <tr>
                            <td>Employee's Email: </td>
                            <td><input type="email" class="form-control" placeholder="email ID" name="mid" id="mid" value="<%= rs.getString("EEmailID")%>" required ></td>
                        </tr>
                        <tr>
                            <td>Nationality: </td>
                            <td><input type="text" class="form-control" placeholder="nationality" value="<%= rs.getString("ENationality")%>" name="nation" id="nation" required ></td>
                        </tr>
                        
                        <tr>
                            <td>Address: </td>
                        <td><input type="text" class="form-control" placeholder="address" name="add" value="<%= rs.getString("EAddress")%>" id="add" required ></td>
                        </tr>
                        
                        <tr>
                            <td>Employee's DOB: </td>
                            <td><input type="date" class="form-control" placeholder="DOB" name="dob" id="dob" value="<%= rs.getString("EDOB")%>" required ></td>
                        </tr>
                        <tr>
                            <td>Employee's Department: </td>                  
                <td><select name="department" class="form-control" id="department" required="required" value="<%= rs.getString("EDepartment")%>" >
                <option>Select Department</option>
                 <%Class.forName("com.mysql.jdbc.Driver");                
        
                   Statement stm = con.createStatement();                
                   String u = "select * from adddepartment";
                   ResultSet rs1 = stm.executeQuery(u);
                 
                  while(rs1.next()) { 
                    Statement st = con.createStatement();  

                  String ddepartment=rs.getString("EDepartment");
%>
<option value="<%=rs1.getString("DepartmentName")%>" <%if(rs1.getString("DepartmentName").equals(ddepartment)) { %>selected="<%=rs.getString("EDepartment")%>"<%}%>><%=rs1.getString("DepartmentName")%></option>
                <%
}

%>
                    </select></td>
                        </tr>
                        
                        <tr>
                            <td>Post: </td>
                            <td><input type="text" class="form-control" placeholder="post" name="post" value="<%= rs.getString("EPost")%>" id="post" required ></td>
                        </tr>
                        
                        <tr>
                            <td>Username: </td>
                            <td><input type="text" class="form-control" placeholder="username" name="user" id="user" value="<%= rs.getString("EUsername")%>" required ></td>
                        </tr>
                        <tr>
                            <td>Password </td>
                            <td><input type="password" class="form-control" placeholder="password" name="pass" id="pass" value="<%= rs.getString("EPassword")%>" required ></td>
                        </tr>
                        
                    </table>
                    
                    <% }  %>                           
                         </br>
                        
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                        
                         <div align="right">                           
                             <p><b><a href="AEdit.jsp">Click Back</a></b></p>         
                         </div>
                    </center>
                         <br><br><br><br></br>
  <jsp:include page="footer.jsp"></jsp:include> 
    </body>
</html>   