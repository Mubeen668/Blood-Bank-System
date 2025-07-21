<%@ page import="java.sql.*" %>
<%@ include file="needs.html" %>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>

<%
 String name = request.getParameter("name");
        String email = request.getParameter("email");
        String bloodtype=request.getParameter("blood-type");
	  String quantity= request.getParameter("quantity");

        
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
            String query = "INSERT INTO bloodneeds (name,email,bloodtype,quantity) VALUES (?, ?, ?, ?)";
            statement = conn.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, bloodtype);
            statement.setString(4, quantity);
		
            // Execute the insert query
            statement.executeUpdate();

            // Close the database connection and resources
            statement.close();
            conn.close();
response.sendRedirect("needs.html");

        }
 catch (SQLException e) {
            e.printStackTrace();
        // Redirect to the page showing the donation data
    }
%>