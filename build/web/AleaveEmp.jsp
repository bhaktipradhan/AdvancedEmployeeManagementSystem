<%-- 
    Document   : AleaveEmp
    Created on : Jan 11, 2023, 4:17:01 PM
    Author     : DC
--%>

<%@page import="java.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
   <%            
       try {
            String username = (String)session.getAttribute("username");   
            String id,name,leaveType, startDate, endDate, reason, status;
            leaveType = request.getParameter("leaveType");
            startDate = request.getParameter("StartDate");
            endDate = request.getParameter("EndDate");
            reason = request.getParameter("reason");
            status="Pending";
                         
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
            username = (String)session.getAttribute("username");    
            Statement stmt = con.createStatement();
                  
            String u = "select * from empinfo where EUsername = '"+username+"'";
            ResultSet rs = stmt.executeQuery(u);
            while(rs.next())
            {
            id= rs.getString("EID");
            name= rs.getString(2);
                  
            PreparedStatement pst = con.prepareStatement("insert into leaveemp (EID,EName,leaveType,StartDate,EndDate,Reason,Status) values (?,?,?,?,?,?,?)");
            
            pst.setString(1, id);
            pst.setString(2, name);
            pst.setString(3, leaveType);
            pst.setString(4, startDate);
            pst.setString(5, endDate);
            pst.setString(6, reason);
            pst.setString(7, status);
            
           
            int row = pst.executeUpdate();
                  
            if(row==1)
            {
               %>
           <script>
            
            alert("Leave Applied");
            
        </script>
        <jsp:include page="ViewStatus.jsp"></jsp:include> 
        <% }       
       }
}
 catch(Exception e)
{
   out.println(e);
}




%>
    </body>
</html>
