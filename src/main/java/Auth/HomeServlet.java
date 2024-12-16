package Auth;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@WebServlet("/welcome")
public class HomeServlet extends HttpServlet {
    private static final String API_URL = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1";
    private static final String AUTHORIZATION_TOKEN = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZTlkNzc3MmEwZGVmODg0ZDhhZmM1ZjkzY2Q4NmViMyIsIm5iZiI6MTcxOTUwNjMyMy45MzQsInN1YiI6IjY2N2Q5NTkzZGY5MzE4ZGEzMmFmOWExOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0IsOO2AOdlM2oZY9mfqmXY3vUGOAf-3nV524lIyoF4A";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OkHttpClient client = new OkHttpClient();

        // Construire la requête HTTP
        Request httpRequest = new Request.Builder()
                .url(API_URL)
                .get()
                .addHeader("accept", "application/json")
                .addHeader("Authorization", AUTHORIZATION_TOKEN)
                .build();

        // Exécuter la requête
        try (Response httpResponse = client.newCall(httpRequest).execute()) {
            if (!httpResponse.isSuccessful()) {
                throw new IOException("Erreur HTTP : " + httpResponse.code());
            }

            // Lire la réponse
            String responseBody = httpResponse.body().string();

            // Parser la réponse JSON
            JsonReader jsonReader = Json.createReader(new java.io.StringReader(responseBody));
            JsonObject jsonResponse = jsonReader.readObject();
            jsonReader.close();

            // Extraire les films
            JsonArray movies = jsonResponse.getJsonArray("results");

            // Convertir les films en une liste de maps pour JSP
            List<Map<String, Object>> movieList = new ArrayList<>();
            for (JsonObject movie : movies.getValuesAs(JsonObject.class)) {
                Map<String, Object> movieMap = new HashMap<>();
                movieMap.put("title", movie.getString("title", "Unknown")); // Titre par défaut "Unknown"
                movieMap.put("poster_path", movie.getString("poster_path", "")); // Image par défaut vide
                movieMap.put("vote_average", movie.getJsonNumber("vote_average").toString());
                movieList.add(movieMap);
            }

            // Ajouter la liste des films comme attribut
            request.setAttribute("movies", movieList);
        } catch (IOException e) {
            throw new ServletException("Erreur lors de l'appel à l'API : " + e.getMessage(), e);
        }

        // Transférer vers la JSP
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
