package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class navbar_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>nav</title>       \n");
      out.write("        <style type=\"text/css\">\n");
      out.write("#d1{\n");
      out.write("  overflow: hidden;\n");
      out.write("  background-color: black;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#dd1 a {\n");
      out.write("  float: right;\n");
      out.write("  color: #f2f2f2;\n");
      out.write("  text-align: center;\n");
      out.write("  padding: 14px 16px;\n");
      out.write("  text-decoration: none;\n");
      out.write("  font-size: 17px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#dd1 a:hover {\n");
      out.write("  background-color: whitesmoke;\n");
      out.write("  color: black;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#d1 a:active {\n");
      out.write("  background-color: black;\n");
      out.write("  color: white;\n");
      out.write("}\n");
      out.write("nav{\n");
      out.write("    margin: 0px;\n");
      out.write("   \n");
      out.write("}\n");
      out.write("nav font{\n");
      out.write("    margin-left: 10px;\n");
      out.write("    margin-top: 10px;\n");
      out.write("}\n");
      out.write(".nav-right{\n");
      out.write("   float: left;\n");
      out.write("   text-align: center;\n");
      out.write("  padding: 14px 16px;\n");
      out.write("  text-decoration: none;\n");
      out.write("  font-size: 20px;\n");
      out.write("  font-family: verdana;\n");
      out.write("}\n");
      out.write("#d1 a{\n");
      out.write("    \n");
      out.write("  color: #f2f2f2;\n");
      out.write("  text-align: center;\n");
      out.write("  padding: 14px 16px;\n");
      out.write("  text-decoration: none;\n");
      out.write("  font-size: 17px\n");
      out.write("}\n");
      out.write("#n a:hover{\n");
      out.write("    background: black;\n");
      out.write("    color: white; \n");
      out.write("}\n");
      out.write("#n a{\n");
      out.write("    padding-right: 50px;\n");
      out.write("        margin-right: 90px;\n");
      out.write("}\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("        <div id=\"d1\">\n");
      out.write("        <nav>\n");
      out.write("            <div class=\"nav-right\">\n");
      out.write("                <a id=\"n\" style=\"text-align:center\" color=\"white\" size='5px'>Advanced Employee Management System</a>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"dd1\">\n");
      out.write("            <a href=\"login.html\">About</a>\n");
      out.write("            <a href=\"index.jsp\">Home</a>\n");
      out.write("            </div>\n");
      out.write("        </nav> \n");
      out.write("        </div>\n");
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
