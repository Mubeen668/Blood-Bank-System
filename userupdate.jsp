<%@ page import="java.io.*, java.sql.*" %>
<%@ page import="oracle.jdbc.OracleDriver" %>

<%
    String email = request.getParameter("email");
    String name = request.getParameter("name");
    String  quantity= request.getParameter("quantity");
    String type = request.getParameter("blood-type");

    String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
    String dbUser = "system";
    String dbPassword = "rooter";

    Connection connection = null;
    PreparedStatement statement = null;

    try {
        DriverManager.registerDriver(new OracleDriver());
        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        String sql = "UPDATE bloodneeds SET name=?, bloodtype=?, quantity=? WHERE email=?";
        statement = connection.prepareStatement(sql);
        statement.setString(1, name);
        statement.setString(2, type);
        statement.setString(3, quantity);
statement.setString(4, email);
        
        int rowsUpdated = statement.executeUpdate();

        if (rowsUpdated > 0) {
            
            response.sendRedirect("needs.html");
        } else {
            
            response.sendRedirect("Userupdate.html");
        }
    } catch (SQLException e) {
        out.println("An error occurred while updating the engineer: " + e.getMessage());
    } finally {
        try {
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            out.println("An error occurred while closing the connection: " + e.getMessage());
        }
    }
%>