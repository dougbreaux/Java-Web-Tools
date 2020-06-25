<html>
<head>
    <title>Servlet Container Class Finder</title>
</head>
<body>
<h2>Servlet Container Class Finder</h2>
<p>Enter the fully-qualified name of a Java class
(e.g. java.lang.String) in the field below. The
JSP will attempt to locate the class in the current classloader:
</p>
<pre>
Thread.currentThread().getContextClassLoader().getResource(full-path-class-resource)
</pre>
<p>
<%
    String className = request.getParameter("className");
    String prefill = "";
    if (className != null) {
        prefill = className;
		
		// convert to resource path
        String resource = "/" + className.replace('.', '/') + ".class";
		
        if (className.trim().length() != 0) {
            try {
                Object c = Thread.currentThread().getContextClassLoader().getResource(resource);
				if (c != null) {
					out.println(c);
				}
				else {
					out.println("Class " + className + " not found.");
				}
            }
            catch (Throwable t) {
                out.println(t);
            }
        }
    }
%>
</p>
<form method="post" action="<%= request.getRequestURI()%>">
    <p>
    Class Name: <input type="text" name="className" value="<%= prefill %>" size="40"/>
    <input type="submit" value="Submit"/>
    </p>
</form>
</body>
</html>
