package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class allLeaveTypes_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body></br>\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("        <h1>Leave Types</h1>\n");
      out.write("        </br>\n");
      out.write("        <a href=\"addLeaveType.jsp\"><button class=\"btn btn-primary\">Add Leave Type <i class=\"fa fa-plus\"></i></button></a>\n");
      out.write("        </br></br>\n");
      out.write("        <div class=\"row\">         \n");
      out.write("             <div class=\"col-sm-4\">\n");
      out.write("                 <div class=\"panel-body\">\n");
      out.write("                     <table id=\"tbl-deldep\" class=\"table table-responsive table-bordered\" cellpadding =\"0\"  width=\"100%\">\n");
      out.write("                         <thead>\n");
      out.write("                             <tr>   <th width=\"35%\">Leave Type ID</th>\n");
      out.write("                                    <th width=\"44%\">Leave Type</th>\n");
      out.write("                                    <th>Delete  </th>\n");
      out.write("                             </tr>\n");
      out.write("                 \n");

    Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");    
            Statement stmt = con.createStatement();                
                 String slt = "select * from leavetype order by LTID";
                  ResultSet rs = stmt.executeQuery(slt);
                  while(rs.next())
                  {
                     String ltid = rs.getString("LTID");
                      
      out.write("  \n");
      out.write("                      <tr>\n");
      out.write("                           <td>");
      out.print(rs.getString("LTID"));
      out.write("</td>\n");
      out.write("                           <td>");
      out.print(rs.getString("leaveType"));
      out.write("</td>\n");
      out.write("                           <td> <a href=\"deleteLeaveTypes.jsp?ltid=");
      out.print(ltid);
      out.write("\"><button  class='btn btn-danger btn-xs pull-right'style=\"background:#d11a2a; color:whitesmoke;border: none;\"> Delete <i class=\"fa fa-trash\"></i></button></a></td>\n");
      out.write("                      </tr>\n");
      out.write("                      ");
}
          
      out.write("\n");
      out.write("                    </table>              \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
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
