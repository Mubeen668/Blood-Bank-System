import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Store extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException ,ClassNotFoundException{
        // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone= request.getParameter("phone");
        String type=request.getParameter("blood-type");
        
	Connection conn = null;
    PreparedStatement statement= null;
        // Store data in the database (example using JDBC)
        // Make a database connection and execute an insert query
        // ...
        // Close the database connection
		try {
            // Make a database connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
    String dbUser = "system";
    String dbPassword ="rooter";
           
            conn = DriverManager.getConnection(jdbcUrl,dbUser,dbPassword);

            // Create a PreparedStatement to execute the insert query
            String query = "INSERT INTO store (name,email,phone,type) VALUES (?, ?, ?, ?)";
            statement = conn.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, phone);
            statement.setString(4, type);

            // Execute the insert query
            statement.executeUpdate();

            // Close the database connection and resources
            statement.close();
            conn.close();
        }
 catch (SQLException e) {
            e.printStackTrace();
        // Redirect to the page showing the donation data
    }
response.sendRedirect("Donate.html");
}
}
