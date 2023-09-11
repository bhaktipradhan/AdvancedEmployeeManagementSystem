<%-- 
    Document   : Admin
    Created on : Aug 9, 2022, 3:01:01 PM
    Author     : DC
--%>

<%@page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
    </head>
    <body>
        <%
            String ausername=request.getParameter("ausername");
            String password=request.getParameter("apassword");
            session.setAttribute("ausername",ausername);
            try{
            if(ausername.equals("adminb")&&password.equals("admin12@"))
            {
                %>
                <jsp:include page="adminHomepg.jsp"></jsp:include>
                <%
            }
            else
            {%>
            
<script>
    alert("Wrong Credentials");
</script>

               
                <jsp:include page="Admin.jsp"></jsp:include>
                <%
            }
            }
            catch (Exception e)
           {
               out.println(e);    
           }
                %>
    </body>
</html>