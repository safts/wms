/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operations.SysRole;

/**
 *
 * @author Sergios
 */
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

public class Sys_Role_Rem extends HttpServlet {

    private Connection connection;
    private PreparedStatement statement;

    /**
     * Deletes the specified system_role
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request,
	    HttpServletResponse response)
	    throws ServletException, IOException {
	try {

	    String role = (String) request.getParameter("sys_role");

	    connection = ConnPoolInit.Datasource.getConnection();
	    Statement statement1 = connection.createStatement();

	    ResultSet set1 = statement1.executeQuery("select * from conf_users where user_role_description = '" + role + "'");

	    while (set1.next()) {

		String query = "update conf_users set user_role_description = null where username= ?";
		statement = connection.prepareStatement(query);
		statement.setString(1, set1.getString("username"));
		statement.executeUpdate();
	    }

	    String query;
	    query = "delete from user_role where description = ?";
	    statement = connection.prepareStatement(query);
	    statement.setString(1, role);
	    statement.executeUpdate();
	    statement1.close();
	    statement.close();
	    connection.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	}
	//RequestDispatcher dispatcher =
	//		getServletContext().getRequestDispatcher("/manage_system_roles.jsp");
	//dispatcher.forward(request, response);

	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/manage_system_roles.jsp");
	dispatcher.forward(request, response);
    }
}
