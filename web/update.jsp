<%-- 
    Document   : update
    Created on : Dec 15, 2022, 2:51:58 PM
    Author     : DC
--%>

//INCorrect
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if(request.getParameter("submit")!=null)
    {
        String ID, name, email, nationality, address, DOB, education, post, username, password ;
            
            ID = request.getParameter("id");
            name = request.getParameter("name");
            email = request.getParameter("mid");
            nationality = request.getParameter("nation");
            address = request.getParameter("add");
            DOB = request.getParameter("dob");
            education = request.getParameter("edu");
            post = request.getParameter("post");
            username = request.getParameter("user");
            password = request.getParameter("pass");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
        pst = con.prepareStatement("update empinfo set EID = ?,EName =?,EEmailID= ?,EENationality = ?,EAddress =?,EDOB= ?,EEducation = ?,EPost =?,EUsername= ?,EPassword= ? where EID = ? ");
        
        pst.setString(1,ID);
        pst.setString(2,name);
        pst.setString(3,email);
        pst.setString(4,nationality);
        pst.setString(5,address);
        pst.setString(6,DOB);
        pst.setString(7,education);
        pst.setString(8,post);
        pst.setString(9,username);
        pst.setString(10,password);
        pst.setString(1,ID);
        pst.executeUpdate();  
    
        %>
        <script>
            
            alert("Record Deleted");
            
        </script>
        <% } %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Update Employee's Information</h1>
        
        <% 
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
        
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
            
            String id = request.getParameter("id");
            
            pst = con.prepareStatement("select * from empinfo where EID=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
                        
            while(rs.next())
            {

        %>
        
        <form method="POST" action="#">
            <center>
                             
                <p>Employee ID:  <input type="text" name="id" placeholder="Enter Employee ID" value="<%=rs.getString("EID") %>" required="required"></p>
                
                <p>Name: <input type="text" name="name" placeholder="Employee Name" value="<%=rs.getString("EName") %>" required="required"></p>
                
                <p>Email ID: <input type="email" name="mid" placeholder="Employee Email ID" value="<%=rs.getString("EEmailID") %>" required="required"></p>
                
                <p>Nationality:  <input type="text" name="nation" placeholder="Employee's Nationality" value="<%=rs.getString("EENationality") %>" required="required"></p>
                
                <p>Address: <input type="text" name="add" placeholder="Employee Address" value="<%=rs.getString("EAddress") %>" required="required"></p>
                
                <p>DOB: <input type="date" name="dob" placeholder="Employee's DOB" value="<%=rs.getString("EDOB") %>" required="required"></p>
                
                <p>Education:  <input type="text" name="edu" placeholder="Employee's Education" value="<%=rs.getString("EEducation") %>" required="required"></p>
                
                <p>Post: <input type="text" name="post" placeholder="Employee's Post" value="<%=rs.getString("EPost") %>" required="required"></p>
                
                <p>Username: <input type="text" name="user" placeholder="Enter Username" value="<%=rs.getString("EUsername") %>" required="required"></p>
                
                <p>Password: <input type="password" name="pass" placeholder="Enter Password:" value="<%=rs.getString("EPassword") %>" required="required"></p>
                <% }
                %>
                    
                <input type="submit" value="submit">
                <input type="reset" value="Reset"></br>
                <p><a href="AEdit.jsp"><b>Back TO Edit Page</b></a></p>
            </center>
        </form> 
    </body>
</html>
