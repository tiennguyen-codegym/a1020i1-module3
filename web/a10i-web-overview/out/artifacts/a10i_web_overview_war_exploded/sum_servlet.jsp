<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        // C2
        int a = Integer.parseInt(request.getParameter("numberOne"));
        int b = Integer.parseInt(request.getParameter("numberTwo"));
        int total = a + b;
    %>

    <p style="color: greenyellow"><%=total%></p>

<%

%>
</body>
</html>
