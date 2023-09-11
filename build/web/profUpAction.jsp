<%-- 
    Document   : profUpAction
    Created on : Dec 29, 2022, 1:20:50 PM
    Author     : DC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update profile</title>       
    </head>
       <% 
        if(session.getAttribute("username")==null)
        {
           response.sendRedirect("elogin.jsp");    
        }
       %>
    <body>
        <form>
            <%
                 if(request.getParameter("submit")!=null)
    {
                String username = (String)session.getAttribute("username");
                
       
                
            String name, email, nationality, address, DOB, password ;
            
            
            name = request.getParameter("name");
            email = request.getParameter("mid");
            nationality = request.getParameter("nation");
            address = request.getParameter("add");
            DOB = request.getParameter("dob");
            username = request.getParameter("user");
            password = request.getParameter("pass"); 

           Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/mysql","root","12345");
        pst = con.prepareStatement("update empinfo set EName =?,EEMailID = ?,ENationality =?,EAddress= ?,EDOB = ?,EUsername= ?,EPassword= ? where EUsername = ?");

        pst.setString(1, name);
        pst.setString(2, email);
        pst.setString(3, nationality);
        pst.setString(4, address);
        pst.setString(5, DOB);
        pst.setString(6, username);
        pst.setString(7, password);
        pst.setString(8, username);
        pst.executeUpdate(); 
           %>
            <script>
            
            alert("Profile Updated");
            
        </script>
        <jsp:include page="profile.jsp"></jsp:include> 
        <% } %>
        </form>
        
    </body>
</html>
