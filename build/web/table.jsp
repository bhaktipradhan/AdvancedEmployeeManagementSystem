<%-- 
    Document   : table
    Created on : Jan 15, 2023, 12:49:18 PM
    Author     : DC
--%>

<%@page import="java.sql.*"%>
<%@page import="project.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
try{
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    String q0 = "create table empinfo (EID int primary key AUTO_INCREMENT, EName varchar(30), EEMailID varchar(100) unique key, ENationality varchar(30),EAddress varchar(100), EDOB date, EDepartment varchar(100), EPost varchar(30), EUsername varchar(30) unique key, EPassword varchar(30))";
    String ql= "create table leaveemp (LID int primary key AUTO_INCREMENT, EID int NOT NULL, EName varchar(100) NOT NULL, leaveType varchar(50) NOT NULL, StartDate date NOT NULL, EndDate date NOT NULL, Reason varchar(500), Status varchar(100) NOT NULL, TimeEntry timestamp NOT NULL)";
    String q3 = "create table leavetype (LTID int primary key AUTO_INCREMENT, leaveType varchar(200) unique key)";
   // String q4 = "create table infoemp (EID int primary key AUTO_INCREMENT, EName varchar(100) NOT NULL, EEMailID varchar(200) NOT NULL unique key, ENationality varchar(100) NOT NULL, EAddress varchar(200) NOT NULL, EDOB date NOT NULL, EDepartment varchar(200) NOT NULL, EPost varchar(200) NOT NULL, EUsername varchar(200) NOT NULL unique key, EPassword varchar(50) NOT NULL)";
    String q5 = "create table adddepartment (DID int primary key AUTO_INCREMENT, DepartmentName varchar(200) NOT NULL unique key)";
    //String q6 = "create table project (PID int primary key AUTO_INCREMENT, ProjectName varchar(100) NOT NULL unique key, MID int NOT NULL, MName varchar(100) NOT NULL)";
    String q7 = "create table task (TID int primary key AUTO_INCREMENT, TaskName varchar(200) NOT NULL, Description varchar(400), AssignTo varchar(100) NOT NULL, AssignTime timestamp NOT NULL, DeadLine datetime NOT NULL, Priority varchar(50) NOT NULL, Status varchar(100) NOT NULL)";
    String q8 = "create table payroll (PayID int primary key AUTO_INCREMENT, EID varchar(200), FromDate date, ToDate date, BasicSalary int, MedicalAllow int, FoodAllow int, OtherAllow int, TotalAllow int, Tax int, OtherDe int, TotalDe int, Total int, TimeEntry timestamp)";
    //System.out.println (ql);
    //System.out.println (q3);
    //System.out.println (q4);
    //System.out.println (q5);
    st.execute(q0);
    st.execute(ql);
    st.execute(q3);
    //st.execute(q4);
    st.execute(q5);
    //st.execute(q6);
    st.execute(q7);
    st.execute(q8);
    System.out.print ("table created");
    Statement stmt = con.createStatement();
    //String q2="create table project (PID int primary key AUTO_INCREMENT, ProjectTittle varchar(200) NOT NULL, EID int NOT NULL, CreateDate timestamp NOT NULL, DeadLine timestamp NOT NULL,";
    con.close();
    
}
catch(Exception e){
    System.out.print(e);   
}
%>