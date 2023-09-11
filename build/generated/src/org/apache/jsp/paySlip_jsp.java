package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class paySlip_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"bootstrap-4.0.0-dist/css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"bootstrap-4.0.0-dist/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <title>Payroll Slip</title>\n");
      out.write("        <style>\n");
      out.write("            .center{\n");
      out.write("                align-content: center;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"head\">\n");
      out.write("                </br>\n");
      out.write("                <table class=\"table container center\">\n");
      out.write("                    <center><h2>AEMS Company</h2></center></br>\n");
      out.write("           ");

               try
               {
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
                  Statement stmt = con.createStatement();
                  String username = (String)session.getAttribute("username");
                  String esl = "select * from empinfo where EUsername = '"+username+"'";
                  ResultSet rs = stmt.executeQuery(esl);
                  if(rs.next())
                  {
                     String pseid = rs.getString("EID");
                     String psl = "select *, Date_Format(FromDate, '%M %Y') as MY from payroll where EID = '"+pseid+"' order by PayID desc limit 1";
                     Statement stm = con.createStatement();
                     ResultSet rs1 = stm.executeQuery(psl);
                     if(rs1.next()){
                    
      out.write("\n");
      out.write("                    <center><h5>Pay Slip for: ");
out.println(rs1.getString("MY"));
      out.write("</h5></center>\n");
      out.write("                        <tr><td>Employee ID: </td><td>");
out.println(rs.getString(1));
      out.write("</td></tr>\n");
      out.write("                        <tr><td>Name: </td><td>");
out.println(rs.getString(2));
      out.write("</td></tr>\n");
      out.write("                        <tr><td>Email ID: </td><td>");
out.println(rs.getString(3));
      out.write("</td></tr>\n");
      out.write("                        <tr><td>Post: </td><td>");
out.println(rs.getString(8));
      out.write("</td></tr>\n");
      out.write("                        <tr><td>Department: </td><td>");
out.println(rs.getString(7));
      out.write("</td></tr>\n");
      out.write("\n");
      out.write("<table class=\"table table-bordered\" id=\"silp\">\n");
      out.write("  <thead>\n");
      out.write("    <tr>\n");
      out.write("      <th scope=\"col\" colspan=\"2\">Allowance(in ₹)</th>\n");
      out.write("      <th scope=\"col\" colspan=\"2\">Deduction(in ₹)</th>\n");
      out.write("    </tr>\n");
      out.write("  </thead>\n");
      out.write("  <tbody>\n");
      out.write("    <tr>\n");
      out.write("      <td scope=\"row\">Basic Salary: ");
out.println(rs1.getString("BasicSalary"));
      out.write("</td>\n");
      out.write("      <td>Tax: ");
out.println(rs1.getString("Tax"));
      out.write("</td>\n");
      out.write("    </tr>\n");
      out.write("    <tr>\n");
      out.write("      <td scope=\"row\">2</td>\n");
      out.write("      <td>Jacob</td>\n");
      out.write("    </tr>\n");
      out.write("    <tr>\n");
      out.write("      <td scope=\"row\">3</td>\n");
      out.write("      <td>Larry the Bird</td>\n");
      out.write("\n");
      out.write("    </tr>\n");
      out.write("  </tbody>\n");
      out.write("</table>\n");
      out.write("                    \n");
      out.write("                  ");
}}
                  
               }
               catch(Exception e)
               {
                   out.println(e);
               }                       
           
      out.write("    \n");
      out.write("       </table>\n");
      out.write("       </div>\n");
      out.write("            </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
