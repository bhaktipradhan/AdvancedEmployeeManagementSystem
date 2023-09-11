<%-- 
    Document   : leaveAction
    Created on : Jan 19, 2023, 11:01:58 AM
    Author     : DC
--%>

//INCorrect
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

                        


 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
         <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        
        
    </head>
    <body>
        <center>
        <h1>Leave Status Updatation</h1>
        
        <div class="row">
            <div class="col-sm-4">
            
                    
                    <%    
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/mysql","root","12345"); 
                        String ID = request.getParameter("id");                        
                        pst = con.prepareStatement("select * from `leave` where EID = '"+ ID+"'");                                                
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                              String id= rs.getString("EID");
                    
                    %>
                    <table class="table">
                        <tr><td>Employee ID: </td><input type="text" name ="id" value="<%out.println(rs.getString("EID"));%>"</td></tr>
                        <tr>
                        <td>Employee's Name: </td>
                            <td><%out.println(rs.getString("EName"));%></td>
                        </tr>
                        <tr>
                            <td>Leave Type: </td>
                            <td><%out.println(rs.getString(3));%></td>
                        </tr>
                        <tr>
                            <td>Start Date: </td>
                            <td><%out.println(rs.getString("StartDate"));%></td>
                        </tr>
                        <tr>
                            <td>End Date: </td>
                            <td><%out.println(rs.getString("EndDate"));%></td>
                        </tr>
                        <tr>
                            <td>Reason of Leave: </td>
                            <td><%= rs.getString("Reason")%></td>
                        </tr>
                        <tr>
                            <td>Time Stamp: </td>
                            <td><%out.println(rs.getString(7));%></td>
                        </tr>
                        <tr>
                            <td>Leave Status: </td>
                            <td><select name="Status">
                          <option value="<%out.println(rs.getString("Status"));%>">Pending</option>
                         <option value="Accepted">Accept</option>
                         <option value="Rejected">Reject</option>      
                         </select></td>
                        </tr>
                                              
                    <% }  %>
                    
                    
                    
                         </br>
                        
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                        
                         <div align="right">
                            
                             <p><b><a href="LeaveApplicant.jsp">Click Back</a></b></p>         
                         </div>
                    </center>
   
                
            </div>          
        </div>
  
    </body>
</html>   