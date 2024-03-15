<html>
<head><title>JNDI Lookup</title></head>
<body>
<%
String url = request.getParameter("url");
String prefill = "";
if (url == null) {
    url = "";
}
else {
    prefill = url;
}
%>
<p>Enter a URL to try to reach:</p>
<form method="post" action="<%= request.getRequestURI()%>">
    <p>
    URL: <input type="text" name="url" value="<%= url %>" size="40">
    <input type="submit" value="Submit">
    </p>
</form>
<%
if (url.trim().length() != 0) {
    try {
        java.net.HttpURLConnection con = (java.net.HttpURLConnection) new java.net.URL(url).openConnection();
        con.setRequestMethod("GET");
        con.getInputStream();
    }
    catch (Exception e) {
        out.println(e);
    }
}
%>
</body>
</html>