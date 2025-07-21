<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html >

<head>
    
    <title>Login</title>
    
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Inconsolata&family=Mulish&display=swap" rel="stylesheet">
   
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
   
    <link rel="stylesheet" href="stylecss.css" type="text/css">
</head>

<body>
   
    <section id="header">
        <div class="container flex">
            <img src="blood1.png">
            
        </div>
    </section>
<section id="nav">
        <div class="container flex">
            <div class="flex">
                <a href="Home.html" class="link">Home</a>
                <a href="bloodneeds.jsp" class="link">Blood Needs</a>
                <a href="types.html" class="link">Acceptable Types</a>
                <a href="Nearby.html" class="link">Nearby Blood-banks</a>
                
                
			<a href="admin_login.html" class="btn">Admin LOGIN</a>

            <a href="login.html" class="btn">Donor LOGIN</a>
<a href="signup.html" class="btn">Sign up</a>
        </div>
</div>
    </section>
<form action="Display.jsp">
</form>
<table>
        <thead>
            <tr>
                <th>Donor Name</th>
                <th>Email</th>
                <th>Phone no</th>
                <th>Blood Type</th>
            </tr>
        </thead>
        <tbody>
	<%    
	
        
	Connection conn = null;
    PreparedStatement statement= null;

       try {
            // Make a database connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
    String dbUser = "system";
    String dbPassword ="rooter";
           
            conn = DriverManager.getConnection(jdbcUrl,dbUser,dbPassword);

            String query = "SELECT * FROM store";
         		statement = conn.prepareStatement(query);

            // Execute the query and get the ResultSet
            ResultSet resultSet = statement.executeQuery();

            // Generate the table rows dynamically
            while (resultSet.next()) {
                String dname = resultSet.getString("name");
                String demail = resultSet.getString("email");
                String dphone = resultSet.getString("phone");
                String dtype =resultSet.getString("type");
%>
              <tr>
                            <td><%= dname %></td>
                            <td><%= demail %></td>
                            <td><%= dphone %></td>
                            <td><%= dtype %></td>
		</tr>
<%
            }

            // Close the database connection and resources
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Close the PrintWriter
        out.close();	

	%>
</tbody>
</table>
    
 <section id="footer">
        <div class="container flex">
            <div id="subscribe">
                <h1>Subscibe Now</h1>
                <div class="flex">
                    <input type="text" placeholder="Enter your E-mail" class="email" />
                    <a href="#" class="subscribe-btn"> Subscribe</a>
                </div>
               
            </div>
            <div class="contact">
                <h1>Contact with us Now</h1>
                
                
                <div class="social-icons flex">
                    <a href="https://twitter.com/" class="contact-link"><i class="fa fa-twitter"
                            aria-hidden="true"></i></a>
                    <a href="https://facebook.com/" class="contact-link"><i class="fa fa-facebook-square"
                            aria-hidden="true"></i></a>
                    <a href="https://linkedin.com/" class="contact-link"> <i class="fa fa-linkedin-square"
                            aria-hidden="true"></i></a>
                    <a href="https://gmail.com/" class="contact-link"> <i class="fa fa-google"
                            aria-hidden="true"></i></a>
                </div>
                
            </div>
        </div>
    </section>
   
</body>

</html>