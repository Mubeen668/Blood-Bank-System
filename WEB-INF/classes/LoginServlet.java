import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class LoginServlet extends HttpServlet{
public void service(HttpServletRequest request, HttpServletResponse response) throws  IOException
 {
	response.setContentType("text/html");
 String username = request.getParameter("name");
String password = request.getParameter("password");
 String uname="admin";
 String pass="admin123";
 if(username.equals(uname) && password.equals(pass))
 {
response.sendRedirect("adonate.html");
 }
 else
 {
response.sendRedirect("admin_login.html");
 }
 }
}
