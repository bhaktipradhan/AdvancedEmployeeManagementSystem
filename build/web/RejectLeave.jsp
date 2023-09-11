<%-- 
    Document   : RejectLeave
    Created on : Jan 23, 2023, 8:55:12 PM
    Author     : DC
--%>

<%@page import="java.sql.*"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String result;
 String to = "";
 String from = "";
   String pass = "";
 String messg = "";
 String subject = "";
 String host = "";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","12345");
    String lid =request.getParameter("lid");
    Statement stmt = con.createStatement();                
    String u = "select * from leaveemp ";
    ResultSet rs = stmt.executeQuery(u);
    while(rs.next()){
        String LID = rs.getString(1);
        String Status = rs.getString("Status");
      
    PreparedStatement pst ;
    pst = con.prepareStatement("update leaveemp set Status='Rejected' where LID='"+lid+"'");
    pst.executeUpdate();
%>       
        
        <%
String peid = "select * from leaveemp where LID='"+lid+"'";
            Statement st = con.createStatement();
            ResultSet rs1 = st.executeQuery(peid);
            while(rs1.next()){
            String pemid = rs1.getString("EID");
            String pemaid = "select * from empinfo where EID='"+pemid+"'";
            Statement stm = con.createStatement();
            ResultSet rs2 = stm.executeQuery(pemaid);
            while(rs2.next()){
            String pemaidd = rs2.getString("EEMailID");
            
    
    
    to = pemaidd;
     subject = "Leave Status";
     messg = "Leave Application with leave ID "+lid+" got Rejected";
    from = "youremailid@gmail.com"; //write your email id
     pass = "password";    // write password of your email id
     host = "smtp.gmail.com";
            }}}
    Properties props = new Properties();
    props.put("mail.smtp.host", host);
    props.put("mail.transport.protocol", "smtp");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.user", from);
    props.put("mail.password", pass);
    props.put("mail.port", "443");
            final String fromm= from;
            final String passs= pass;
    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

        @Override

        protected PasswordAuthentication getPasswordAuthentication() {
            
            return new PasswordAuthentication(fromm, passs);
        }

    });

    try {
        MimeMessage message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(from));
        message.addRecipient(Message.RecipientType.TO,
                new InternetAddress(to));
        message.setSubject(subject);
        message.setText(messg);
        Transport.send(message);


    } catch (MessagingException mex) {
        mex.printStackTrace();
        result = "Error: unable to send mail....";
    }
%>
<script>
    alert("Mail Sent");
    history.back();
</script> 
    </body>
</html>
<%%>