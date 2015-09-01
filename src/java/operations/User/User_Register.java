/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operations.User;

import DBcomm.ConnPoolInit;


import entities.User;

import java.util.Calendar;


import java.sql.PreparedStatement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.SimpleDateFormat;

public class User_Register extends HttpServlet {
//    private DataSource dataSource;

    private Connection connection;
    private Statement statement;

    /**
     * Creates a new user account (registers the new user)
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
    @Override
    protected void doPost(HttpServletRequest request,
	    HttpServletResponse response)
	    throws ServletException, IOException {

	// get parameters from the form
	String name = request.getParameter("name");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String surname = request.getParameter("surname");
	String email = request.getParameter("email");
	boolean error = false;
	// create user from the parameters
	User user = new User(name, surname, username, password, email, "", "");
	//public User(String name, String surname, String username, String password, String email, String signup_date, String last_logged_in)
	// validate the parameters
	String message = "pend";
	String url = "/index.jsp";
	try {
	    connection = ConnPoolInit.Datasource.getConnection();
	    // Elegxoi:
	    // 01. Yparxei to username?
	    int found = 0;
	    ResultSet set = null;
	    statement = connection.createStatement();
	    set = statement.executeQuery("SELECT * FROM pend_users WHERE username like '" + username + "'");
	    while (set.next()) {
		found++;
	    }
	    if (found > 0) {
		message = "wu";
		url = "/signup_form.jsp";
		error = true;
	    }
	    if (!error) {
		found = 0;
		set = null;
		statement = connection.createStatement();
		set = statement.executeQuery("SELECT * FROM conf_users WHERE username like '" + username + "'");
		while (set.next()) {
		    found++;
		}
		if (found > 0) {
		    message = "wu";
		    url = "/signup_form.jsp";
		    error = true;
		}
	    }
	    // 02. Yparxei to email?
	    if (!error) {
		found = 0;
		set = null;
		statement = connection.createStatement();
		set = statement.executeQuery("SELECT * FROM pend_users WHERE email like '" + email + "'");
		while (set.next()) {
		    found++;
		}
		if (found > 0) {
		    message = "we";
		    url = "/signup_form.jsp";
		    error = true;
		}
	    }
	    if (!error) {
		found = 0;
		set = null;
		statement = connection.createStatement();
		set = statement.executeQuery("SELECT * FROM conf_users WHERE email like '" + email + "'");
		while (set.next()) {
		    found++;
		}
		if (found > 0) {
		    message = "we";
		    url = "/signup_form.jsp";
		    error = true;
		}
	    }
	    if (!error) {
		statement = connection.createStatement();
		PreparedStatement statement = null;
		statement = null;
		String sql;
		sql = "INSERT INTO pend_users (username,name,surname,password,"
			+ "email,signup_date,last_logged_in) "
			+ "VALUES (?,?,?,?,?,?,?)";
		Calendar calendar = Calendar.getInstance();
		java.sql.Date startDate = new java.sql.Date(calendar.getTime().getTime());
		String formattedDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar.getTime());
		statement = connection.prepareStatement(sql);
		statement.setString(1, username/*+String.valueOf(i)*/);
		statement.setString(2, name/*+String.valueOf(i)*/);
		statement.setString(3, surname/*+String.valueOf(i)*/);
		statement.setString(4, password/*+String.valueOf(i)*/);
		statement.setString(5, email/*+String.valueOf(i)*/);
		statement.setString(6, formattedDate);
		statement.setString(7, formattedDate);
		statement.executeUpdate();
		statement.close();
	    }
	    statement.close();
	    connection.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	}
	request.setAttribute("user", user);
	request.setAttribute("message", message);
	// forward request and response to the view
	RequestDispatcher dispatcher =
		getServletContext().getRequestDispatcher(url);
	dispatcher.forward(request, response);
    }
}
