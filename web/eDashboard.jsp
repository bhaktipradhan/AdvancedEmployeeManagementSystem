<%-- 
    Document   : eDashboard
    Created on : Apr 3, 2023, 4:15:41 AM
    Author     : DC
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: sans-serif;
}
.bttn{
  position: absolute;
  top: 60px;
  left: 20px;
  height: 45px;
  width: 45px;
  text-align: center;
  background: #1b1b1b;
  border-radius: 3px;
  cursor: pointer;
  transition: left 0.4s ease;
}
.bttn.click{
  left: 260px;
}
.bttn.click .mai{
  transition: margin-left 0.5s;
}
.bttn span{
  color: white;
  font-size: 28px;
  line-height: 45px;
}
.bttn.click span:before{
  content: '\f00d';
}
.sidebar{
  position: fixed;
  width: 250px;
  height: 100%;
  left: -250px;
  background: #1b1b1b;
  transition: left 0.4s ease;
}
.sidebar.show{
  left: 0px;
}
.sidebar .text{
  color: white;
  font-size: 25px;
  font-weight: 600;
  line-height: 65px;
  text-align: center;
  background: #1e1e1e;
  letter-spacing: 1px;
}
nav ul{
  background: #1b1b1b;
  height: 100%;
  width: 100%;
  list-style: none;
}
nav ul li{
  line-height: 60px;
  border-top: 1px solid rgba(255,255,255,0.1);
}
nav ul li:last-child{
  border-bottom: 1px solid rgba(255,255,255,0.05);
}
nav ul li a{
  position: relative;
  color: white;
  text-decoration: none;
  font-size: 18px;
  padding-left: 40px;
  font-weight: 500;
  display: block;
  width: 100%;
  border-left: 3px solid transparent;
}
nav ul li.active a{
  color: cyan;
  background: #1e1e1e;
  border-left-color: cyan;
}
nav ul li a:hover{
  background: #1e1e1e;
  color: cyan;
}
nav ul ul{
  position: static;
  display: none;
}
nav ul .feat-show.show{
  display: block;
}
nav ul .three-show.show2{
  display: block;
}
nav ul .serv-show.show1{
  display: block;
}
nav ul ul li{
  line-height: 42px;
  border-top: none;
}
nav ul ul li a{
  font-size: 17px;
  color: #e6e6e6;
  padding-left: 80px;
}
nav ul li.active ul li a{
  color: #e6e6e6;
  background: #1b1b1b;
  border-left-color: transparent;
}
nav ul ul li a:hover{
  color: cyan!important;
  background: #1e1e1e!important;
}
nav ul li a span{
  position: absolute;
  top: 50%;
  right: 20px;
  transform: translateY(-50%);
  font-size: 22px;
  transition: transform 0.4s;
}
nav ul li a span.rotate{
  transform: translateY(-50%) rotate(-180deg);
}
.bttn:focus ~ .content {
  margin-left: 17rem;
  transition-delay: .25s;
}
 .content{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
  color: #202020;
  z-index: -1;
  text-align: center;
}
.content h1{
    top: 20%;
    margin-top: 30px;
    margin-bottom: 20px;
    left: 50%
}
.bttn.click .content{
  margin-left: 17rem;
  transition-delay: .25s;
}
.content .header{
  font-size: 45px;
  font-weight: 600;
}
.content p{
  font-size: 30px;
  font-weight: 500;
}

#m1{
    transition: margin-left 0.5s;
    padding: 16px;
}
</style>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
  </head>
  <body>
      <%Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");  
           String username = (String)session.getAttribute("username"); 
           String post = (String)session.getAttribute("post");
                  Statement stmt = con.createStatement();                
                  String u = "select * from empinfo where EUsername='"+username+"'";
                  ResultSet rs = stmt.executeQuery(u);
                  while(rs.next()){
       if(rs.getString("EPost").equals("Manager"))
       { %>
      <div class="bttn">
         <span class="fas fa-bars"></span>
      </div>
      <nav class="sidebar">
         <ul>
            <li class="active"><a href="EmployeeHomepg.jsp">Dashboard</a></li>
            <li>
               <a href="#" class="feat-btn">Profile
               <span class="fas fa-caret-down first"></span>
               </a>
               <ul class="feat-show">
                  <li><a href="profile.jsp">Profile</a></li>
                  <li><a href="ProfileUpdate.jsp">Edit Profile</a></li> 
                  <li><a href="mEmployees.jsp">Edit Employees</a></li> 
               </ul>
            </li>
            <li><a href="#" class="three-btn">Leave
                <span class="fas fa-caret-down second"></span>
               </a>
               <ul class="three-show">
                  <li><a href="leaveEmp.jsp">Leave Application</a></li>
                  <li><a href="ViewStatus.jsp">Leave Status</a></li>
               </ul></a></li>
            <li>
               <a href="#" class="serv-btn">Task
               <span class="fas fa-caret-down second"></span>
               </a>
               <ul class="serv-show">
                  <li><a href="tasks.jsp">Tasks</a></li>
                  <li><a href="assignTask.jsp">Assign Task</a></li>
                  <li><a href="mAssignedTasks.jsp">Assigned Tasks</a></li>
               </ul>
            </li>
               <li><a href="payrolls.jsp">Payroll</a></li>
            <li><a href="logout.jsp">Logout</a></li>
         </ul>
      </nav>
      
      <script>
         $('.bttn').click(function(){
           $(this).toggleClass("click");
           $('.sidebar').toggleClass("show");
         });
           $('.feat-btn').click(function(){
             $('nav ul .feat-show').toggleClass("show");
             $('nav ul .first').toggleClass("rotate");
           });
           $('.three-btn').click(function(){
             $('nav ul .three-show').toggleClass("show2");
             $('nav ul .second').toggleClass("rotate");
           });
             $('.serv-btn').click(function(){
             $('nav ul .serv-show').toggleClass("show1");
             $('nav ul .second').toggleClass("rotate");
           });
           $('nav ul li').click(function(){
             $(this).addClass("active").siblings().removeClass("active");
           });
      </script>
      <%
          }
else{
 %>
 <div class="bttn">
         <span class="fas fa-bars"></span>
      </div>
      <nav class="sidebar">
         <ul>
            <li class="active"><a href="EmployeeHomepg.jsp">Dashboard</a></li>
            <li>
               <a href="#" class="feat-btn">Profile
               <span class="fas fa-caret-down first"></span>
               </a>
               <ul class="feat-show">
                  <li><a href="profile.jsp">Profile</a></li>
                  <li><a href="ProfileUpdate.jsp">Edit Profile</a></li>                 
               </ul>
            </li>
            <li><a href="#" class="three-btn">Leave
                <span class="fas fa-caret-down second"></span>
               </a>
               <ul class="three-show">
                  <li><a href="leaveEmp.jsp">Leave Application</a></li>
                  <li><a href="ViewStatus.jsp">Leave Status</a></li>
               </ul></a></li>
               <li><a href="tasks.jsp">Task</a></li>
               <li><a href="payrolls.jsp">Payroll</a></li>
            <li><a href="logout.jsp">Logout</a></li>
         </ul>
      </nav>
      
      <script>
         $('.bttn').click(function(){
           $(this).toggleClass("click");
           $('.sidebar').toggleClass("show");
         });
           $('.feat-btn').click(function(){
             $('nav ul .feat-show').toggleClass("show");
             $('nav ul .first').toggleClass("rotate");
           });
           $('.three-btn').click(function(){
             $('nav ul .three-show').toggleClass("show2");
             $('nav ul .second').toggleClass("rotate");
           });
           $('nav ul li').click(function(){
             $(this).addClass("active").siblings().removeClass("active");
           });
      </script>
<%
}    
    }
%>
   </body>
</html>
