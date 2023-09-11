package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import project.ConnectionProvider;

public final class table_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
 
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

    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
