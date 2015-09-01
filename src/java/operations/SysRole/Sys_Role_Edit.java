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

import DBcomm.UserComm;

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
import javax.servlet.http.HttpSession;

/**
 * Edits the specified system_role's details (changes the database)
 *
 * @author Sergios
 */
public class Sys_Role_Edit extends HttpServlet {

    private Connection connection;
    private PreparedStatement statement;

    /**
     * Edits the specified system_role's details (changes the database)
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
	    String wh_sel = request.getParameter("wh_sel");
	    String usr_sel = request.getParameter("usr_sel");
	    int rl_sel = Integer.parseInt(request.getParameter("rl_sel"));
	    int pr_sel = Integer.parseInt(request.getParameter("pr_sel"));
	    int suppl_sel = Integer.parseInt(request.getParameter("suppl_sel"));
	    String old_description = request.getParameter("old_description");
	    String description = request.getParameter("description");

	    connection = ConnPoolInit.Datasource.getConnection();


	    String query = "update user_role set products_permissions = ? , "
		    + "warehouses_permissions = ? , roles_permissions = ? , "
		    + "suppliers_permissions = ? , users_permissions = ? , "
		    + "description = ? where description = ?";
	    statement = connection.prepareStatement(query);
	    statement.setInt(1, pr_sel);
	    statement.setInt(2, Integer.parseInt(wh_sel));
	    statement.setInt(3, rl_sel);
	    statement.setInt(4, suppl_sel);
	    statement.setInt(5, Integer.parseInt(usr_sel));
	    statement.setString(6, description);
	    statement.setString(7, old_description);

	    // execute the java preparedstatement
	    statement.executeUpdate();
	    statement.close();
	    connection.close();

	} catch (SQLException e) {
	    e.printStackTrace();
	}

	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/manage_system_roles.jsp");
	dispatcher.forward(request, response);
    }
}
