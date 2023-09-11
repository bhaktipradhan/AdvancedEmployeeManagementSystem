package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class payroll_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Payroll</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <form action=\"APayroll.jsp\" onsubmit=\"check()\">\n");
      out.write("        <p>\n");
      out.write("        <label>Employee Id - Name :</label>\n");
      out.write("                <select name=\"employee\" id=\"employee\" required=\"required\">\n");
      out.write("                <option>Select Employee</option>\n");
                 
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
                   Statement stmt = con.createStatement();
                   String u = "select * from empinfo";
                   ResultSet rs = stmt.executeQuery(u);              
                   while(rs.next()) {          
      out.write("\n");
      out.write("                   <option value=\"");
      out.print(rs.getString("EID"));
      out.write('"');
      out.write('>');
      out.print(rs.getString("EID"));
      out.write(" - ");
      out.print(rs.getString("EName"));
      out.write("</option>\n");
      out.write("                ");

                }

      out.write("   \n");
      out.write("        </select></p>\n");
      out.write("        <p><label>From:</label>\n");
      out.write("            <input type=\"date\" id=\"fromdate\" name=\"fromdate\" required=\"required\"></p>\n");
      out.write("         <p><label>To:</label>\n");
      out.write("             <input type=\"date\" id=\"todate\" name=\"todate\" required=\"required\"></p>\n");
      out.write("        <p><label>Basic Salary: </label>\n");
      out.write("        <input type=\"text\" id=\"basicSalary\" name=\"basicSalary\" placeholder=\"Enter Basic Salary\">\n");
      out.write("        <br></p>\n");
      out.write("        <p><label>Medical Allowance: </label>\n");
      out.write("        <input type=\"text\" id=\"mediallow\" name=\"mediallow\" placeholder=\"Enter Medical Allowance\">\n");
      out.write("        <br></p>\n");
      out.write("        <p><label>Food Allowance: </label>\n");
      out.write("            <input type=\"text\" id=\"foodallow\" name=\"foodallow\" placeholder=\"Enter Food Allowance\">\n");
      out.write("        <br></p>\n");
      out.write("        <p><label>Other Allowance: </label>\n");
      out.write("            <input type=\"text\" id=\"otherallow\" name=\"otherallow\" placeholder=\"Enter Allowance\">\n");
      out.write("        <br></p>\n");
      out.write("        <p><label>Tax: </label>\n");
      out.write("            <input type=\"text\" id=\"tax\" name=\"tax\" placeholder=\"Enter Tax\">\n");
      out.write("        <br></p>\n");
      out.write("        <p><label>Other Deduction: </label>\n");
      out.write("            <input type=\"text\" id=\"deduction\" name=\"deduction\" placeholder=\"Enter Other Deduction\">\n");
      out.write("        <br></p>\n");
      out.write("        <input type=\"submit\" name=\"submit\" id=\"pay\">        \n");
      out.write("    </form>\n");
      out.write("        </div>       \n");
      out.write("        <script>\n");
      out.write("       function check() {\n");
      out.write("       var basicSalary = document.getElementById('basicSalary').value;\n");
      out.write("       var mediallow = document.getElementById('mediallow').value;\n");
      out.write("       var foodallow = document.getElementById('foodallow').value;\n");
      out.write("       var otherallow = document.getElementById('otherallow').value;\n");
      out.write("       var tax = document.getElementById('tax').value;\n");
      out.write("       var deduction = document.getElementById('deduction').value;\n");
      out.write("       if (basicSalary === \"\"){\n");
      out.write("       basicSalary = \"0\";\n");
      out.write("}\n");
      out.write("       if (mediallow === \"\"){\n");
      out.write("       mediallow = \"0\";\n");
      out.write("}\n");
      out.write("       if (foodallow === \"\"){\n");
      out.write("       foodallow = \"0\";\n");
      out.write("}\n");
      out.write("       if (otherallow === \"\"){\n");
      out.write("       otherallow = \"0\";\n");
      out.write("}\n");
      out.write("       if (tax === \"\"){\n");
      out.write("       tax = \"0\";\n");
      out.write("}\n");
      out.write("       if (deduction === \"\"){\n");
      out.write("       deduction = \"0\";\n");
      out.write("}\n");
      out.write("\n");
      out.write("}\n");
      out.write("        </script>    \n");
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
