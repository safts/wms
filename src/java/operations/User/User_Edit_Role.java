/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operations.User;

import DBcomm.ConnPoolInit;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sergios
 */
public class User_Edit_Role extends HttpServlet {

    private Connection connection;
    private PreparedStatement statement;

    /**
     * Edits the specified user's system role details (changes the database)
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
	    String username = request.getParameter("username");
	    String role_sel = request.getParameter("role_sel");

	    connection = ConnPoolInit.Datasource.getConnection();


	    String query = "update conf_users set user_role_description = ? "
		    + "where username = ?";
	    statement = connection.prepareStatement(query);
	    statement.setString(1, role_sel);
	    statement.setString(2, username);


	    // execute the java preparedstatement
	    statement.executeUpdate();
	    statement.close();
	    connection.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	}

	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/view_user.jsp");
	dispatcher.forward(request, response);
    }
}
