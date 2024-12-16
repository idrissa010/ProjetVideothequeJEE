<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.json.JsonArray, javax.json.JsonObject" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
<h1>Bienvenue, ${user}!</h1>

<h2>Films actuellement à l'affiche</h2>
<ul>
    <%-- Vérifier si la liste de films existe --%>
    <%
        JsonArray movies = (JsonArray) request.getAttribute("movies");
        if (movies != null && !movies.isEmpty()) {
            for (JsonObject movie : movies.getValuesAs(JsonObject.class)) {
                String title = movie.getString("title");
                String overview = movie.getString("overview");
    %>
    <li>
        <h3><%= title %></h3>
        <p><%= overview %></p>
    </li>
    <%
            }
        } else {
            out.println("<p>Aucun film trouvé.</p>");
        }
    %>
</ul>
</body>
</html>
