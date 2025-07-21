import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Signup extends HttpServlet {
  public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Get the input parameters from the HTML form
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
      // Register the JDBC driver
      Class.forName("oracle.jdbc.driver.OracleDriver");

      // Open a connection
      String url = "jdbc:oracle:thin:@localhost:1521:XE";
      String username = "system";
      String password1 = "rooter";
      conn = DriverManager.getConnection(url, username, password1);

      // Prepare the statement to insert the data into the database
      String sql = "INSERT INTO signup (name, email, password) VALUES (?, ?, ?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, name);
      pstmt.setString(2, email);
      pstmt.setString(3, password);

      // Execute the statement and store the data in the database
      pstmt.executeUpdate();

      // Redirect the user to a success page
      response.sendRedirect("login.html");
    } catch (SQLException | ClassNotFoundException ex) {
      // Handle any exceptions that may occur
      ex.printStackTrace();
    } finally {
      // Close the database connection and statement objects
      try {
        if (pstmt != null) {
          pstmt.close();
        }
        if (conn != null) {
          conn.close();
        }
      } catch (SQLException ex) {
        ex.printStackTrace();
      }
    }
  }
}
