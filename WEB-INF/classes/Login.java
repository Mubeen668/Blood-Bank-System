import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/bloodbank"; // Replace with your database URL
    private static final String DB_USER = "root"; // Replace with your database username
    private static final String DB_PASS = "rooter"; // Replace with your database password

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM signup WHERE username = ? AND password = ?")) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Login successful
                response.sendRedirect("Donate.html"); // Replace with the name of the welcome page
            } else {
                // Login failed
                response.sendRedirect("login.html"); // Replace with the name of the login page
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.sendRedirect("error.html"); // Replace with the name of the error page
        }
    }
}