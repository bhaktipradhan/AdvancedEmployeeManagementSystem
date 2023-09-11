<%-- 
    Document   : APayroll
    Created on : Feb 28, 2023, 9:18:14 AM
    Author     : DC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
     try {

            String employee, fromdate, todate;
            
            employee = request.getParameter("employee");
            fromdate = request.getParameter("fromdate");
            todate = request.getParameter("todate");
            int basicSalary = Integer.parseInt(request.getParameter("basicSalary")); 
            int mediallow = Integer.parseInt(request.getParameter("mediallow"));
            int foodallow = Integer.parseInt(request.getParameter("foodallow"));
            int otherallow = Integer.parseInt(request.getParameter("otherallow"));
            int totalallow = basicSalary + mediallow + foodallow + otherallow;
            int tax = Integer.parseInt(request.getParameter("tax"));
            int deduction = Integer.parseInt(request.getParameter("deduction"));
            int totalded = tax + deduction;
            int total = totalallow - totalded;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
            PreparedStatement pst = con.prepareStatement("insert into payroll(EID,FromDate,ToDate,BasicSalary,MedicalAllow,FoodAllow,OtherAllow,TotalAllow,Tax,OtherDe,TotalDe,Total) values (?,?,?,?,?,?,?,?,?,?,?,?)");
            
            pst.setString(1, employee);
            pst.setString(2, fromdate);
            pst.setString(3, todate);
            pst.setInt(4, basicSalary);
            pst.setInt(5, mediallow);
            pst.setInt(6, foodallow);
            pst.setInt(7, otherallow);
            pst.setInt(8, totalallow);
            pst.setInt(9, tax);
            pst.setInt(10, deduction);
            pst.setInt(11, totalded);
            pst.setInt(12, total);
                    
            int row = pst.executeUpdate();
                  
            if(row==1)
            {    
      
%>
<script>
    alert("Payroll is added successfully!");
</script>
<jsp:include page="payroll.jsp"></jsp:include> 
<%
 
    }       
       }

 catch(Exception e)
{
   out.println(e);
}

%>