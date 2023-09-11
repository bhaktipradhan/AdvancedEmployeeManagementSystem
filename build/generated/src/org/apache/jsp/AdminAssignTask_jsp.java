package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class AdminAssignTask_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Assign Task</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("        <form action=\"AAssignTask.jsp\">  \n");
      out.write("            </br>\n");
      out.write("            <h1>Assign Task</h1></br>\n");
      out.write("            <p>Task: <input type=\"text\" name=\"task\" placeholder=\"Enter Task\" required=\"required\"></p>\n");
      out.write("            <p>Task Description: <textarea  name=\"description\" placeholder=\"Enter Description\" required=\"required\"></textarea></p>\n");
      out.write("            <p>Assign To:\n");
      out.write("                <select name=\"assignTo\" id=\"assignTo\" required=\"required\">\n");
      out.write("                <option>Select Employee</option>\n");
      out.write("                 ");
Class.forName("com.mysql.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");  
                   Statement stmt = con.createStatement();                            
                   String query1 = "select * from empinfo";
                   ResultSet rs = stmt.executeQuery(query1);
                 
                  while(rs.next()) {          
      out.write("\n");
      out.write("                <option value=\"");
      out.print(rs.getString("EID"));
      out.write('"');
      out.write('>');
      out.print(rs.getString("EID"));
      out.write(" - ");
      out.print(rs.getString("EName"));
      out.write("</option>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("                </select></p>\n");
      out.write("                <p>Deadline Time: <input type=\"datetime-local\" name=\"deadLine\" required=\"required\"</p>\n");
      out.write("                <p>Priority:\n");
      out.write("                <select name=\"priority\" id=\"priority\" required=\"required\">\n");
      out.write("                <option>Select Priority</option>\n");
      out.write("                <option value=\"Low\">Low</option>\n");
      out.write("                <option value=\"Medium\">Medium</option>\n");
      out.write("                <option value=\"Urgent\">Urgent</option>\n");
      out.write("                </select></p>\n");
      out.write("            <input type=\"submit\" value=\"Assign\" style=\"color: whitesmoke;\" class=\"btn btn-primary\" name=\"assignTask\">                 \n");
      out.write("        </form>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
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
