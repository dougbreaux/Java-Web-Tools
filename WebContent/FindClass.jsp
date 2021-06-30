<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Servlet Container Class Finder</title>
</head>
<body>
<h2>Servlet Container Class Finder</h2>
<p>Enter the fully-qualified name of a Java class
(e.g. org.apache.oro.text.regex.Perl5Compiler) in the field below. The
servlet will attempt to load the class and, if successful, query the
class' <em>java.security.CodeSource</em> for the location of the class
using the following methods:
</p>
<pre>
Class.forName(className).getProtectionDomain().getCodeSource()
</pre>
<p>
<%
    String className = request.getParameter("className");
    String prefill = "";
    if (className != null) {
        prefill = className;
        request.setAttribute("prefill", prefill);
        if (className.trim().length() != 0) {
            try {
                java.security.ProtectionDomain pd = Class.forName(className).getProtectionDomain();
                if (pd != null) {
                    java.security.CodeSource cs = pd.getCodeSource();
                    if (cs != null) {
                        out.println(cs);
                    }
                    else {
                        out.println("No CodeSource found");
                    }
                }
                else {
                    out.println("No ProtectionDomain found");
                }
            }
            catch (Throwable t) {
                out.println(t);
            }
        }
    }
%>
</p>
<form method="post" action="<c:out value="${pageContext.request.requestURI}"/>">
    <p>
    Class Name: <input type="text" name="className" value="<c:out value="${prefill}"/>" size="40"/>
    <input type="submit" value="Submit"/>
    </p>
</form>
<p>
    Code taken from
    <a href="http://www.ibm.com/developerworks/websphere/techjournal/0406_brown/0406_brown.html">
    this DeveloperWorks article</a>.
</p>
</body>
</html>