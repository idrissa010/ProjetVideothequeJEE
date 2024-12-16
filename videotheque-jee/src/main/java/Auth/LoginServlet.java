package Auth ;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/authLogin")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        request.getSession().setAttribute("user", username);
        response.sendRedirect("home.jsp");
//        if ("admin".equals(username) && "password".equals(password)) {
//            request.getSession().setAttribute("user", username);
//            response.sendRedirect("welcome.jsp");
//        } else {
//            response.sendRedirect("login.jsp?error=true");
//        }
    }
}
