<html>
<head><title>Email Tester</title></head>
<body>
<p>Email Tester</p>
<%
String jndiName = request.getParameter("jndiName");
String from = request.getParameter("from");
String to = request.getParameter("to");
String subject = request.getParameter("subject");
String body = request.getParameter("body");

if (jndiName == null) jndiName = "mail/TestSession";
if (from == null) from = "";
if (to == null) to = "";
if (subject == null) subject = "Test from EmailTest.jsp";
if (body == null) body = "Message body";
%>
<form method="post" action="<%= request.getRequestURI()%>">
    <table>
    <tr><td>Mail Session JNDI Name: <input type="text" name="jndiName" value="<%= jndiName %>" size="40"/></td></tr>
        <tr><td>From Address: <input type="text" name="from" value="<%= from %>" size="20"/></td></tr>
        <tr><td>To Address: <input type="text" name="to" value="<%= to %>" size="20"/></td></tr>
        <tr><td>Subject: <input type="text" name="subject" value="<%= subject %>" size="20"/></td></tr>
        <tr><td>Body: <input type="text" name="body" value="<%= body %>" size="60"/></td></tr>
    <tr><td><input type="submit" value="Submit"/></td></tr>
    </table>
</form>
<%
if (jndiName.trim().length() != 0 && from.trim().length() != 0 && to.trim().length() != 0 &&
    subject.trim().length() != 0 && body.trim().length() != 0)
{
    try
    {
        javax.naming.InitialContext ctx = new javax.naming.InitialContext();
        javax.mail.Session msession = (javax.mail.Session) ctx.lookup(jndiName);
        javax.mail.internet.MimeMessage message =
            new javax.mail.internet.MimeMessage(msession);
        message.setText(body);
        message.setSubject(subject);
        message.setRecipient(javax.mail.Message.RecipientType.TO, new javax.mail.internet.InternetAddress(to));
        message.setFrom(new javax.mail.internet.InternetAddress(from));
        org.springframework.mail.javamail.JavaMailSenderImpl msender =
            new org.springframework.mail.javamail.JavaMailSenderImpl();
        msender.setSession(msession);
        msender.send(message);
    }
    catch (Exception e)
    {
        out.println(e);
    }
}
%>
</body>
</html>
