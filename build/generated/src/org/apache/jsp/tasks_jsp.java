package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class tasks_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Task Assigned</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Task Assigned</h1>\n");
      out.write("        \n");
      out.write("         <div class=\"row\">\n");
      out.write("            \n");
      out.write("             <div class=\"col-sm-6\">\n");
      out.write("                 <div class=\"panel-body\">\n");
      out.write("                     <table id=\"tbl-student\" class=\"table table-responsive table-bordered\" cellpadding =\"0\"  width=\"100%\">\n");
      out.write("                         <thead>\n");
      out.write("                             <tr>   <th>Task ID</th>\n");
      out.write("                                 <th style=\"width:25%\">Task</th>\n");
      out.write("                                    <th>Assign At</th>\n");
      out.write("                                    <th>Deadline</th>\n");
      out.write("                                    <th>Priority</th>\n");
      out.write("                                    <th>Status</th>\n");
      out.write("                                    <th>Update Status</th>\n");
      out.write("                             </tr>\n");
      out.write("                 \n");

    Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");    
            String username = (String)session.getAttribute("username"); 
            String et = "select * from empinfo where EUsername='"+username+"'";
            Statement stm = con.createStatement();
            ResultSet rs1 = stm.executeQuery(et);
                  while(rs1.next()){
            Statement stmt = con.createStatement();
            String eidt = rs1.getString("EID");
            String s = "select * from task where AssignTo='"+eidt+"'";
                  ResultSet rs = stmt.executeQuery(s);
                  while(rs.next())
                  {
                     String tid = rs.getString("TID");
                      
      out.write("  \n");
      out.write("                      <tr>\n");
      out.write("                           <td>");
      out.print(rs.getString("TID"));
      out.write("</td>\n");
      out.write("                           <td><p>");
      out.print(rs.getString("TaskName"));
      out.write("</p>\n");
      out.write("                               <h6>");
      out.print(rs.getString("Description"));
      out.write("</h6>\n");
      out.write("                           </td>\n");
      out.write("                           <td>");
      out.print(rs.getString("AssignTime"));
      out.write("</td>\n");
      out.write("                           <td>");
      out.print(rs.getString("DeadLine"));
      out.write("</td>\n");
      out.write("                           <td>");
      out.print(rs.getString("Priority"));
      out.write("</td>                      \n");
      out.write("                           <td>");
      out.print(rs.getString("Status"));
      out.write("</td>\n");
      out.write("                           <td><a href=\"TaskDone.jsp?tid=");
      out.print(tid);
      out.write("\">Update Status</a></td>\n");
      out.write("                      </tr>\n");
      out.write("                      ");
}
}

          
      out.write("\n");
      out.write("                    </table>              \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
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
