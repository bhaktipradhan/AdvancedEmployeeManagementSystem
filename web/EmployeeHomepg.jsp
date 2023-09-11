<%-- 
    Document   : EmployeeHomepg
    Created on : Dec 24, 2022, 2:41:06 PM
    Author     : DC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Home Page</title>
        <script>
		history.pushState(null, null, elogin.jsp);
		window.onpopstate = function () {
		    history.go(1);
		};
	</script>
                <style>
                        .cards{
               display: grid;
                grid-template-columns: repeat(4, 1fr);
  grid-gap: 2rem;
            }
            .block1 , .block2, .block3, .block4, .block5{
  display: block;
  height: 170px;
  width: 250px;
  border: none;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
    text-decoration: none;
}
.block1{
    background-color: #001a4d;
    color: white;  
}
.block1:hover {
  background-color: whitesmoke;
  color: #001a4d;
}
.block2{
    background-color: blueviolet;
    color: whitesmoke;
}
.block2:hover {
  background-color: whitesmoke;
  color: blueviolet;
}
.block3{
    background-color: #cc2900;
    color: whitesmoke;
}
.block3:hover {
  background-color: whitesmoke;
  color: #cc2900;
}
.block4{
    background-color: #ff9933;
    color: whitesmoke;
}
.block4:hover {
  background-color: whitesmoke;
  color: #ff9933;
}
.block5{
    background-color: #04AA6D;
    color: whitesmoke;
}
.block5:hover {
  background-color: whitesmoke;
  color: #04AA6D;
}
a:active{
    text-decoration: none;
}
a:hover{
    text-decoration: none;
}
        </style>
    </head>
    <body>
        <%
         
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Progma", "no-cache");
            response.setHeader("Expires", "0");
            session= request.getSession(false);
            if(session.getAttribute("username")==null)
            {
                response.sendRedirect("elogin.jsp");
            }
            
        %>
        
        <% Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");  
           String username = (String)session.getAttribute("username"); 
           String post = (String)session.getAttribute("post");
                  Statement stmt = con.createStatement();                
                  String u = "select * from empinfo where  EUsername='"+username+"'";
                  ResultSet rs = stmt.executeQuery(u);
                  while(rs.next()){
                      //Checking if the user is manager or not
       if(rs.getString("EPost").equals("Manager"))
       { 
//if user is manager
        %>
        <jsp:include page="navbar.jsp"></jsp:include>
        <jsp:include page="eDashboard.jsp"></jsp:include>
        
             <div class="container">
        <div class="ccontent">
            <center>
            </br>
            <h1>Hello, Manager <%out.print(username);%> !</h1></br></br>
  
 <%
     
             String md = rs.getString("EDepartment");
    Statement stm = con.createStatement();
    String up = "select *,count(EID) as ec from empinfo where EDepartment='"+md+"' and EUsername!='"+username+"'";
    ResultSet rs2 = stm.executeQuery(up);
    while (rs2.next()){
    String ed = rs2.getString("EID");   
    String ide = rs.getString("EID");
    Statement tmt = con.createStatement();
    String at = "select count(TID) as at from task where AssignTo='"+ed+"' and AssignTo!='"+ide+"'";
    ResultSet rs3 = tmt.executeQuery(at);
    while (rs3.next()){
      
        Statement st = con.createStatement();
        String tk = "select count(TID) as tk from task where AssignTo ='"+ide+"'";
        ResultSet rs4 = st.executeQuery(tk);
        while(rs4.next()){  
        Statement sta = con.createStatement();
        String pyc = "select count(PayID) as pyc from payroll where EID='"+ide+"'";
        ResultSet rs5 = sta.executeQuery(pyc);
        while(rs5.next()){        
            %>
            <div class="cards">
                <div class="card-single">
                     <a style="text-decoration:none;" href="mEmployees.jsp"><button class="block1"><span style="margin-left:-150px; font-size:45px;"><b><%=rs2.getString("ec")%></b><br></span><span style="">Employees  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><i style="font-size:80px; padding-bottom:-90px;" class="fa fa-user"></i></button></a>
                </div>
                    <div class="card-single">
                 <a style="text-decoration:none;" href="mAssignedTasks.jsp"><button class="block2"><span style="margin-left:-150px; font-size:45px;"><b><%=rs3.getString("at")%></b><br></span><span style="">Assigned Tasks &nbsp;&nbsp;&nbsp;</span><i style="font-size:55px; padding-bottom:-90px;" class="fas fa-tasks"></i></button></a>
                </div>
                <div class="card-single">
                     <a style="text-decoration:none;" href="tasks.jsp"><button class="block4"><span style="margin-left:-150px; font-size:45px;"><b><%=rs4.getString("tk")%></b><br></span><span style="">Tasks  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><i style="font-size:80px; padding-bottom:-90px;" class="fas fa-tasks"></i></button></a>
                </div>
                <div class="card-single">
                    <a style="text-decoration:none;" href="payrolls.jsp"><button class="block5"><span style="margin-left:-150px; font-size:45px;"><b><%=rs5.getString("pyc")%></b><br></span><span style="">Payroll  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><i style="font-size:80px; padding-bottom:-90px;" class="fa fa-rupee"></i></button></a>
                </div>
            </div>    
            <%}}}}
%>
            </center>
        </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <% } 
//if user is not manager
        else
{ 
        %>
        <jsp:include page="navbar.jsp"></jsp:include>
        <jsp:include page="eDashboard.jsp"></jsp:include>
        <div class="container">
        <div class="ccontent">
            <center>
            </br>
            <h1>Hello, Employee <%out.print(username);%> !</h1></br></br>
  
 <%    
        String ide = rs.getString("EID");     
        Statement st = con.createStatement();
        String tk = "select count(TID) as tk from task where AssignTo ='"+ide+"'";
        ResultSet rs4 = st.executeQuery(tk);
        while(rs4.next()){  
        Statement sta = con.createStatement();
        String pyc = "select count(PayID) as pyc from payroll where EID='"+ide+"'";
        ResultSet rs5 = sta.executeQuery(pyc);
        while(rs5.next()){        
            %>
            <div class="cards">
                <div class="card-single">
                     <a style="text-decoration:none;" href="tasks.jsp"><button class="block4"><span style="margin-left:-150px; font-size:45px;"><b><%=rs4.getString("tk")%></b><br></span><span style="">Tasks  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><i style="font-size:80px; padding-bottom:-90px;" class="fas fa-tasks"></i></button></a>
                </div>
                <div class="card-single">
                    <a style="text-decoration:none;" href="payrolls.jsp"><button class="block5"><span style="margin-left:-150px; font-size:45px;"><b><%=rs5.getString("pyc")%></b><br></span><span style="">Payroll  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><i style="font-size:80px; padding-bottom:-90px;" class="fa fa-rupee"></i></button></a>
                </div>
            </div>    
            <%}}
%>
            </center>
        </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <% }} %>
    </body>
</html>