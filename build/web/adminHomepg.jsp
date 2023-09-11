<%-- 
    Document   : admimHomepg
    Created on : Jan 13, 2023, 6:24:19 PM
    Author     : DC
--%>
<jsp:include page="footer.jsp"></jsp:include>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Admin Home page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            div{
                margin: 0;
                text-align: center;
                
            }
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
        <script>
		history.pushState(null, null, Admin.jsp);
		window.onpopstate = function () {
		    history.go(1);
		};
	</script>
    </head>
    <body>
        <%
         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Progma", "no-cache");
            response.setHeader("Expires", "0");
            session= request.getSession(false);
            if(session.getAttribute("ausername")==null)
            {
                response.sendRedirect("Admin.jsp");
            }
        %>
        <jsp:include page="navbar.jsp"></jsp:include>
        <jsp:include page="dashboard.jsp"></jsp:include>
        <div class="container">
        <div class="ccontent">
            <center>
            </br>
            <h1>Welcome Admin!</h1></br></br>
            <%
                Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
    Statement stm = con.createStatement();
    String up = "select count(EID) as em from empinfo";
    ResultSet rs = stm.executeQuery(up);
    while (rs.next()){
            Statement stmt = con.createStatement();
    String dc = "select count(DID) as dc from addDepartment";
    ResultSet rs1 = stmt.executeQuery(dc);
    while (rs1.next()){
        Statement st = con.createStatement();
        String pl = "select count(LID) as pl from leaveemp where Status ='Pending'";
        ResultSet rs2 = st.executeQuery(pl);
        while(rs2.next()){  
        Statement sta = con.createStatement();
        String tc = "select count(TID) as tac from task";
        ResultSet rs3 = sta.executeQuery(tc);
        while(rs3.next()){ 
        Statement stat = con.createStatement();
        String pc = "select count(PayID) as pc from payroll";
        ResultSet rs4 = stat.executeQuery(pc);
        while(rs4.next()){ 
            %>
            <div class="cards">
                <div class="card-single">
                     <a href="AEdit.jsp"><button class="block1"><span style="margin-left:-150px; font-size:45px;"><b><%=rs.getString("em")%></b><br></span><span style="">Employees  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><i style="font-size:80px; padding-bottom:-90px;" class="fa fa-user"></i></button></a>
                </div>
                    <div class="card-single">
                 <a href="allDepartment.jsp"><button class="block2"><span style="margin-left:-150px; font-size:45px;"><b><%=rs1.getString("dc")%></b><br></span><span style="">Department  &nbsp;&nbsp;</span><i style="font-size:80px; padding-bottom:-90px;" class="fas fa-home"></i></button></a>
                </div>
                <div class="card-single">
                    <a href="PendingLeave.jsp"><button class="block3"><span style="margin-left:-150px; font-size:45px;"><b><%=rs2.getString("pl")%></b><br></span><span style="margin-left: -20px; text-align: left">Pending Leaves &nbsp;&nbsp;</span><span style="margin-right:-25px;"><i style="font-size:80px;   padding-bottom:-90px;" class="fas fa-business-time"></i></span></button></a>
                </div>
                <div class="card-single">
                     <a href="allAssignedTask.jsp"><button class="block4"><span style="margin-left:-150px; font-size:45px;"><b><%=rs3.getString("tac")%></b><br></span><span style="">Tasks  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><i style="font-size:80px; padding-bottom:-90px;" class="fas fa-tasks"></i></button></a>
                </div>
                <div class="card-single">
                     <a href="allPayslips.jsp"><button class="block5"><span style="margin-left:-150px; font-size:45px;"><b><%=rs4.getString("pc")%></b><br></span><span style="">Payroll  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><i style="font-size:80px; padding-bottom:-90px;" class="fa fa-rupee"></i></button></a>
                </div>
            </div>    
            <%}}}}}
%>
            </center>
        </div>
        </div>
    </body>
</html>