<html>
<head><title>Show HTTP Headers</title></head>
<body>
<h3>HTTP Headers</h3>
<pre>
<%
    java.util.Enumeration<String> e = request.getHeaderNames();
    while (e.hasMoreElements())
    {
        String name = e.nextElement();
        String value = request.getHeader(name);
        out.println(name + ": " + value);
    }
%>
</pre>
</body>
</html>