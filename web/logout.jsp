<%-- 
    Document   : logout
    Created on : Mar 1, 2023, 10:51:13 AM
    Author     : DC
--%>

<%@page language="java"%>
<%@page import="javax.servlet.http.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Page</title>

    </head>
    <body>
	<script>
		history.pushState(null, null, elogin.jsp);
		window.onpopstate = function () {
		    history.go(1);
		};
	</script>

        <%
            response.setHeader("Pragma","no-cache");
            response.setHeader("Cache-Control","no-store");
            response.setHeader("Expires","0");
            response.setDateHeader("Expires",-1);
            session.setAttribute("name",null);
            session.setAttribute("email",null);
            session.setAttribute("post",null);
            session.setAttribute("department",null);
            session.setAttribute("username",null);
            session.setAttribute("password",null);
            session.invalidate();
            response.sendRedirect("elogin.jsp");
        %>
        
    </body>
</html>
