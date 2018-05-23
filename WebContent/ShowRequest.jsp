<html>
<head><title>Show HTTP Request</title></head>
<body>
<h3>HTTP Request</h3>
<pre>
<%
    out.println("AuthType: " + request.getAuthType());
    out.println("CharacterEncoding: " + request.getCharacterEncoding());
    out.println("ContentLength: " + request.getContentLength());
    out.println("ContentType: " + request.getContentType());
    out.println("ContextPath: " + request.getContextPath());
    out.println("LocalAddr: " + request.getLocalAddr());
    out.println("LocalName: " + request.getLocalName());
    out.println("LocalPort: " + request.getLocalPort());
    out.println("Method: " + request.getMethod());
    out.println("PathInfo: " + request.getPathInfo());
    out.println("PathTranslated: " + request.getPathTranslated());
    out.println("Protocol: " + request.getProtocol());
    out.println("QueryString: " + request.getQueryString());
    out.println("RemoteAddr: " + request.getRemoteAddr());
    out.println("RemoteHost: " + request.getRemoteHost());
    out.println("RemotePort: " + request.getRemotePort());
    out.println("RemoteUser: " + request.getRemoteUser());
    out.println("RequestedSessionId: " + request.getRequestedSessionId());
    out.println("RequestURI: " + request.getRequestURI());
    out.println("RequestURL: " + request.getRequestURL());
    out.println("Scheme: " + request.getScheme());
    out.println("ServerName: " + request.getServerName());
    out.println("ServerPort: " + request.getServerPort());
    out.println("ServletPath: " + request.getServletPath());

    out.println("\nHeaders:\n");
    java.util.Enumeration<String> e = request.getHeaderNames();
    while (e.hasMoreElements())
    {
        String name = e.nextElement();
        String value = request.getHeader(name);
        out.println(" " + name + ": " + value);
    }
%>
</pre>
</body>
</html>
