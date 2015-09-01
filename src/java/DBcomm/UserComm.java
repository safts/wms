/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DBcomm;

/**
 *
 * @author Sergios
 */
import entities.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class UserComm {

    static private Connection connection;
    static private Statement statement;
	/**
	 * Returns a list of users or a single user (depends on whether the
	 * "user" parameter contains a username or null) from the database
	 * @param user (String) / null : the username of the desired user
	 * @return 
	 */
    public static List<User> getConfUsers(String user) {


	LinkedList<User> confUsers = new LinkedList<User>();
	try {

	    connection = ConnPoolInit.Datasource.getConnection();
	    statement = connection.createStatement();

	    ResultSet set = null;

	    statement = connection.createStatement();
	    if (user==null)
		set = statement.executeQuery("SELECT * FROM conf_users ");
	    else
		set = statement.executeQuery("SELECT * FROM conf_users where username ='" + user+"'");

	    String username;
	    String name;
	    String surname;
	    String password;
	    String email;
	    String signup_date;
	    String last_logged_in;
	    String user_role;

	    while (set.next()) {
		username = set.getString("username");
		name = set.getString("name");
		surname = set.getString("surname");
		password = set.getString("password");
		email = set.getString("email");
		signup_date = set.getString("signup_date");
		last_logged_in = set.getString("last_logged_in");
		user_role = set.getString("user_role_description");
		User user1 = new User(name, surname, username, password, email, signup_date, last_logged_in, user_role);
		confUsers.add(user1);
	    }
	    statement.close();
	    connection.close();
	} catch (SQLException e) {
	    e.printStackTrace();

	}


	return confUsers;
    }

    public static List<User> getPendUsers(String user) {


	LinkedList<User> pendUsers = new LinkedList<User>();
	try {

	    connection = ConnPoolInit.Datasource.getConnection();
	    statement = connection.createStatement();

	    ResultSet set = null;

	    statement = connection.createStatement();
	    if (user==null)
		set = statement.executeQuery("SELECT * FROM pend_users ");
	    else
		set = statement.executeQuery("SELECT * FROM pend_users where username ='" + user+"'");

	    String username;
	    String name;
	    String surname;
	    String password;
	    String email;
	    String signup_date;
	    String last_logged_in;

	    while (set.next()) {
		username = set.getString("username");
		name = set.getString("name");
		surname = set.getString("surname");
		password = set.getString("password");
		email = set.getString("email");
		signup_date = set.getString("signup_date");
		last_logged_in = set.getString("last_logged_in");
		User user1 = new User(name, surname, username, password, email, signup_date, last_logged_in, null);
		pendUsers.add(user1);
	    }
	} catch (SQLException e) {
	    e.printStackTrace();

	}
	return pendUsers;
    }

    public static List<User> getRoleUsers(String role) {


	LinkedList<User> roleUsers = new LinkedList<User>();
	try {

	    connection = ConnPoolInit.Datasource.getConnection();
	    statement = connection.createStatement();

	    ResultSet set = null;

	    statement = connection.createStatement();
	    set = statement.executeQuery("SELECT * FROM conf_users where user_role_description = '"+role+"'");

	    String username;
	    String name;
	    String surname;
	    String password;
	    String email;
	    String signup_date;
	    String last_logged_in;
	    String user_role;

	    while (set.next()) {
		username = set.getString("username");
		name = set.getString("name");
		surname = set.getString("surname");
		password = set.getString("password");
		email = set.getString("email");
		signup_date = set.getString("signup_date");
		last_logged_in = set.getString("last_logged_in");
		user_role = set.getString("user_role_description");
		User user1 = new User(name, surname, username, password, email, signup_date, last_logged_in, user_role);
		roleUsers.add(user1);
	    }

	} catch (SQLException e) {
	    e.printStackTrace();

	}


	return roleUsers;
    }
}
