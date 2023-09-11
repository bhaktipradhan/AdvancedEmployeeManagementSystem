<%-- 
    Document   : paySlip
    Created on : Mar 30, 2023, 1:10:06 AM
    Author     : DC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Payroll Slip</title>
        <style>
            .center{
                align-content: center;
            }
            #emdetail{
                border: none;
            }
        </style>
        <script type="text/javascript">
    function printpage() {
        var printButton = document.getElementById("print"); 
        printButton.style.visibility = 'hidden';
        window.print();
        printButton.style.visibility = 'visible';
    }
</script>
    </head>
    <body>
        <div class="container">
            <div class="head">
                </br>

                    <center><h2>AEMS Company</h2></center></br>
           <%
               try
               {  String payid = request.getParameter("payid");
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
                  Statement stmt = con.createStatement();
                  String username = (String)session.getAttribute("username");
                  String esl = "select * from empinfo where EUsername = '"+username+"'";
                  ResultSet rs = stmt.executeQuery(esl);
                  if(rs.next())
                  {
                     String pseid = rs.getString("EID");
                     String psl = "select *, Date_Format(FromDate, '%M %Y') as MY from payroll where EID = '"+pseid+"' and PayID='"+payid+"' order by PayID desc";
                     Statement stm = con.createStatement();
                     ResultSet rs1 = stm.executeQuery(psl);
                     if(rs1.next()){
                    %>
                    <center><h5>Pay Slip for <%out.println(rs1.getString("MY"));%></h5></center></br>
                    Employee ID: </td><td><%out.println(rs.getString(1));%></br>
                    Name: </td><td><%out.println(rs.getString(2));%></br>
                    Email ID: </td><td><%out.println(rs.getString(3));%></br>
                    Post: </td><td><%out.println(rs.getString(8));%></br>
                    Department: </td><td><%out.println(rs.getString(7));%></br>
            </div>
                        </br>
                        </br>
                        <table width="100%" class="table table-bordered" id="silp">
  <thead>
    <tr>
      <th scope="col" colspan="2">Allowance (in ₹)</th>
      <th scope="col" colspan="2">Deduction (in ₹)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td scope="row">Basic Salary: </td>
      <td><%out.println(rs1.getString("BasicSalary"));%></td>
      <td>Tax:</td>
      <td><%out.println(rs1.getString("Tax"));%></td>
    </tr>
    <tr>
      <td scope="row">Medical Allowance: </td>
      <td><%out.println(rs1.getString("MedicalAllow"));%></td>
      <td>Other Deduction: </td>
      <td><%out.println(rs1.getString("OtherDe"));%></td>
    </tr>
    <tr>
      <td scope="row">Food Allowance: </td>
      <td><%out.println(rs1.getString("FoodAllow"));%></td>
      <td></td>
      <td></td>     
    </tr>
    <tr>
      <td scope="row">Other Allowance: </td>
      <td><%out.println(rs1.getString("OtherAllow"));%></td>
      <td></td>
      <td></td>     
    </tr>
    <tr>
      <td scope="row">Total Allowance: </td>
      <td><%out.println(rs1.getString("TotalAllow"));%></td>
      <td>Total: Deduction: </td>
      <td><%out.println(rs1.getString("TotalDe"));%></td>
    </tr>
  </tbody>  
</table>
    </br>
    <b>Net Payment: </b><%out.println(rs1.getString("Total"));%>₹</br>
    <b>Payment ID: </b><%out.println(rs1.getString("PayID"));%></br>
    <b>Payment At: </b><%out.println(rs1.getString("TimeEntry"));%></br>
    </br>
    <input id="print" type="button" value="Print" class="btn btn-primary" onclick="printpage()"/>
    <br><br>
                  <%}}
                  
               }
               catch(Exception e)
               {
                   out.println(e);
               }                       
           %>    
      
       </div>
            </div>
    </body>
</html>