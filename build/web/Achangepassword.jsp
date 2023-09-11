<%-- 
    Document   : Achangepassword
    Created on : Mar 21, 2023, 4:52:53 PM
    Author     : DC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%String npass =request.getParameter("npassword");
    String rpass =request.getParameter("rpassword");
    Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
    ResultSet rs;
    PreparedStatement pst;
    if(npass.equals(rpass)){
    String eemail = (String)session.getAttribute("eemail");
    String eemailp ="select * from empinfo where EEMailID= '"+eemail+"'";
    Statement st = con.createStatement();
    rs= st.executeQuery(eemailp);
    while(rs.next()){
    String uemail = rs.getString("EUsername");
   pst = con.prepareStatement("update empinfo set EPassword= ? where EUsername = ?");

        pst.setString(1, npass);
        pst.setString(2, uemail);     
        pst.executeUpdate(); 
           %>
            <script>
            
            alert("Password Updated");
            
        </script>
        <jsp:include page="elogin.jsp"></jsp:include> 
        <% } }
%>
    </body>
</html>
