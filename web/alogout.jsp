<%-- 
    Document   : alogout
    Created on : Apr 3, 2023, 11:18:00 PM
    Author     : DC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>
		history.pushState(null, null, Admin.jsp);
		window.onpopstate = function () {
		    history.go(-1);
		};
	</script>

        <%  session= request.getSession(false);
            response.setHeader("Pragma","no-cache");
            response.setHeader("Cache-Control","no-store");
            response.setHeader("Expires","0");
            response.setDateHeader("Expires",-1);
            session.setAttribute("ausername",null);
            session.invalidate();
            response.sendRedirect("Admin.jsp");
        %>
    </body>
</html>
