/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operations.User;

import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;

import DBcomm.ConnPoolInit;


import javax.servlet.http.*;
import java.sql.PreparedStatement;
import java.util.Calendar;
import entities.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sergios
 */
public class User_Login extends HttpServlet {

    private Connection connection;
    private Statement statement;

    /**
     * Checks the user's information (username, password) and loads his 
     * permissions in the session
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
    @Override
    protected void doPost(HttpServletRequest request,
	    HttpServletResponse response)
	    throws ServletException, IOException {

	HttpSession session = request.getSession(false);
	int found = 0;
	boolean pending = true;
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String message = new String();
	String url = "/log_sucess.jsp";
	message = username;
	User user = new User();
	try {
	    connection = ConnPoolInit.Datasource.getConnection();
	    statement = connection.createStatement();
	    ResultSet set = null;
	    //statement = connection.createStatement();
	    set = statement.executeQuery("SELECT * FROM pend_users WHERE username like '" + username + "'");
	    while (set.next()) {
		found++;
	    }
	    set.previous();
	    if (found == 1) {
		if (set.getString("password").equals(password)) {
		    url = "/index.jsp";
		    pending = true;
		    message = "pend";
		} else {
		    message = "Wrong password";
		    url = "/index.jsp";
		    pending = true;
		}
	    } else {

		pending = false;
		set = null;
		statement = connection.createStatement();
		set = statement.executeQuery("SELECT * FROM conf_users WHERE username like '" + username + "'");
		while (set.next()) {
		    found++;
		}
		if (found == 0) {
		    message = "Username not found in the database";
		    url = "/index.jsp";
		} else {
		    set.previous();
		    if (set.getString("username").equals(username)) {
			if (set.getString("password").equals(password)) {
			    url = "/main_admin.jsp";
			    pending = false;
			    session.setAttribute("username", username);
			    message = "ok";
			    user = new User(set.getString("name"), set.getString("surname"),
				    set.getString("username"), set.getString("password"),
				    set.getString("email"), set.getString("signup_date"), set.getString("last_logged_in"),
				    set.getString("user_role_description"));
			} else {
			    message = "Wrong password";
			    url = "/index.jsp";
			    pending = true;
			}
		    }
		}
	    }
	    if (found > 0 && !pending) {

		String query = "update conf_users set last_logged_in = ? where username = ?";
		PreparedStatement preparedStmt = connection.prepareStatement(query);
		Calendar calendar = Calendar.getInstance();
		String formattedDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar.getTime());
		preparedStmt.setString(1, formattedDate);
		preparedStmt.setString(2, username);
		// execute the java preparedstatement
		preparedStmt.executeUpdate();
		if (set.getString("user_role_description") == null) {
		    session.setAttribute("prod_perm", null);
		    session.setAttribute("wh_perm", null);
		    session.setAttribute("role_perm", null);
		    session.setAttribute("suppl_perm", null);
		    session.setAttribute("usr_perm", null);
		} else {
		    Statement statement1 = connection.createStatement();
		    ResultSet set1;
		    set1 = statement1.executeQuery("SELECT * FROM user_role WHERE description like '" + set.getString("user_role_description") + "'");
		    while (set1.next()) {
		    }
		    set1.previous();
		    session.setAttribute("prod_perm", Integer.toString(set1.getInt("products_permissions")));
		    session.setAttribute("wh_perm", Integer.toString(set1.getInt("warehouses_permissions")));
		    session.setAttribute("role_perm", Integer.toString(set1.getInt("roles_permissions")));
		    session.setAttribute("suppl_perm", Integer.toString(set1.getInt("suppliers_permissions")));
		    session.setAttribute("usr_perm", Integer.toString(set1.getInt("users_permissions")));
		}
		preparedStmt.close();

	    }
	    statement.close();
	    connection.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	}
	session.setAttribute("user", user);
	session.setAttribute("message", "nexp");
	request.setAttribute("message", message);

	// forward request and response to the view
	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
	dispatcher.forward(request, response);
    }
}
