<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h1>Login Test 2</h1>
<form action="authLogin" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>
    <input type="submit" value="Login">
</form>
<%
    String error = request.getParameter("error");
    if ("true".equals(error)) {
        out.println("<p style='color:red;'>Invalid username or password</p>");
    }
%>
</body>
</html>
