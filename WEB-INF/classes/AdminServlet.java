import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AdminServlet extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get login form parameters from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");
	Connection conn=null;
	PreparedStatement statement= null;

        try {
            // Register MySQL JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
    String dbUser = "system";
    String dbPassword ="rooter";
            // Establish connection to the MySQL database
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Prepare SQL statement for searching login details
            String sql = "SELECT * FROM signup WHERE name = ? AND password = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            // Execute the SQL statement to search for login details
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // Login successful
                

                // Redirect to a success page or perform further operations
                response.sendRedirect("Donate.html");
            } else {
                // Login failed
                response.sendRedirect("login.html");
            }

            // Close the result set, statement, and connection
            resultSet.close();
            statement.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
