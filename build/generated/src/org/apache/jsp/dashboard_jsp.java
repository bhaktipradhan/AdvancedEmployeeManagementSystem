package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class dashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <style>\n");
      out.write("            @import url('https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500');\n");
      out.write("*{\n");
      out.write("  padding: 0;\n");
      out.write("  margin: 0;\n");
      out.write("  list-style: none;\n");
      out.write("  text-decoration: none;\n");
      out.write("}\n");
      out.write("body {\n");
      out.write("  font-family: 'Roboto', sans-serif;\n");
      out.write("}\n");
      out.write(".sidebar {\n");
      out.write("  position: fixed;\n");
      out.write("  left: -250px;\n");
      out.write("  width: 250px;\n");
      out.write("  height: 100%;\n");
      out.write("  background: #042331;\n");
      out.write("  transition: all .5s ease;\n");
      out.write("}\n");
      out.write(".sidebar header {\n");
      out.write("  font-size: 22px;\n");
      out.write("  color: white;\n");
      out.write("  line-height: 70px;\n");
      out.write("  text-align: center;\n");
      out.write("  background: #063146;\n");
      out.write("}\n");
      out.write(".sidebar ul a{\n");
      out.write("  display: block;\n");
      out.write("  height: 100%;\n");
      out.write("  width: 100%;\n");
      out.write("  line-height: 65px;\n");
      out.write("  font-size: 20px;\n");
      out.write("  color: white;\n");
      out.write("  padding-left: 40px;\n");
      out.write("  box-sizing: border-box;\n");
      out.write("  border-bottom: 1px solid black;\n");
      out.write("  border-top: 1px solid rgba(255,255,255,.1);\n");
      out.write("  transition: .4s;\n");
      out.write("}\n");
      out.write("ul li:hover a{\n");
      out.write("  padding-left: 50px;\n");
      out.write("}\n");
      out.write(".sidebar ul a i{\n");
      out.write("  margin-right: 16px;\n");
      out.write("}\n");
      out.write("#check{\n");
      out.write("  display: none;\n");
      out.write("}\n");
      out.write("label #btn,label #cancel{\n");
      out.write("  position: absolute;\n");
      out.write("  background: #042331;\n");
      out.write("  border-radius: 3px;\n");
      out.write("  cursor: pointer;\n");
      out.write("}\n");
      out.write("label #btn{\n");
      out.write("  left: 40px;\n");
      out.write("  top: 25px;\n");
      out.write("  font-size: 35px;\n");
      out.write("  color: white;\n");
      out.write("  padding: 6px 12px;\n");
      out.write("  transition: all .5s;\n");
      out.write("}\n");
      out.write("label #cancel{\n");
      out.write("  z-index: 1111;\n");
      out.write("  left: -195px;\n");
      out.write("  top: 17px;\n");
      out.write("  font-size: 30px;\n");
      out.write("  color: #0a5275;\n");
      out.write("  padding: 4px 9px;\n");
      out.write("  transition: all .5s ease;\n");
      out.write("}\n");
      out.write("#check:checked ~ .sidebar{\n");
      out.write("  left: 0;\n");
      out.write("}\n");
      out.write("#check:checked ~ label #btn{\n");
      out.write("  left: 250px;\n");
      out.write("  opacity: 0;\n");
      out.write("  pointer-events: none;\n");
      out.write("}\n");
      out.write("#check:checked ~ label #cancel{\n");
      out.write("  left: 195px;\n");
      out.write("}\n");
      out.write("#check:checked ~ section{\n");
      out.write("  margin-left: 250px;\n");
      out.write("}\n");
      out.write("section{\n");
      out.write("  background: url(bg.jpeg) no-repeat;\n");
      out.write("  background-position: center;\n");
      out.write("  background-size: cover;\n");
      out.write("  height: 100vh;\n");
      out.write("  transition: all .5s;\n");
      out.write("}\n");
      out.write("        </style>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css\"/>\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("   <body>\n");
      out.write("    <input type=\"checkbox\" id=\"check\">\n");
      out.write("    <label for=\"check\">\n");
      out.write("      <i class=\"fas fa-bars\" id=\"btn\"></i>\n");
      out.write("      <i class=\"fas fa-times\" id=\"cancel\"></i>\n");
      out.write("    </label>\n");
      out.write("    <div class=\"sidebar\">\n");
      out.write("    <header>My App</header>\n");
      out.write("    <ul>\n");
      out.write("     <li><a href=\"#\"><i class=\"fas fa-qrcode\"></i>Dashboard</a></li>\n");
      out.write("     <li><a href=\"#\"><i class=\"fas fa-link\"></i>Shortcuts</a></li>\n");
      out.write("     <li><a href=\"#\"><i class=\"fas fa-stream\"></i>Overview</a></li>\n");
      out.write("     <li><a href=\"#\"><i class=\"fas fa-calendar-week\"></i>Events</a></li>\n");
      out.write("     <li><a href=\"#\"><i class=\"far fa-question-circle\"></i>About</a></li>\n");
      out.write("     <li><a href=\"#\"><i class=\"fas fa-sliders-h\"></i>Services</a></li>\n");
      out.write("     <li><a href=\"#\"><i class=\"far fa-envelope\"></i>Contact</a></li>\n");
      out.write("    </ul>\n");
      out.write("   </div>\n");
      out.write("   <section></section>\n");
      out.write("  </body>\n");
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
