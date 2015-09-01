/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operations.User;

import DBcomm.ConnPoolInit;
import entities.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sergios
 */
public class User_Edit extends HttpServlet {

    private Connection connection;
    private PreparedStatement statement;

    /**
     * Edits the specified user's details (changes the database)
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
    @Override
    protected void doPost(HttpServletRequest request,
	    HttpServletResponse response)
	    throws ServletException, IOException {
	HttpSession session=request.getSession(false);
	User user = new User();
	try {
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	    String name = request.getParameter("name");
	    String surname = request.getParameter("surname");
	    String email = request.getParameter("email");

	    connection = ConnPoolInit.Datasource.getConnection();
  
	    String query = "update conf_users set password=? , "
		    + "name=? , surname=? , email=? "
		    + "where username = '"+username+"'";
	    
	    statement = connection.prepareStatement(query);
	    
	    statement.setString(1,password);
	    statement.setString(2, name);
	    statement.setString(3, surname);
	    statement.setString(4, email);
	    //statement.setString(5, username);

	    // execute the java preparedstatement
	    statement.executeUpdate();

	    Statement statement1=connection.createStatement();
	    ResultSet set=statement1.executeQuery("select * from conf_users where username = '"+username+"'");
	    //System.out.println(username);
	    //System.out.println(name);
	   // System.out.println(surname);
	    //System.out.println(email);
	    //System.out.println(password);
	    set.next();
	    user = new User(set.getString("name"),set.getString("surname"),
				    set.getString("username"),set.getString("password"),
				    set.getString("email"),set.getString("signup_date"),set.getString("last_logged_in"),
				    set.getString("user_role_description"));
	    
	    statement.close();
	    statement1.close();
	    connection.close();
	    
	} catch (SQLException e) {
	    e.printStackTrace();
	}
	    
	    session.setAttribute("user",user);
	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/main_admin.jsp");
	dispatcher.forward(request, response);
    }
}