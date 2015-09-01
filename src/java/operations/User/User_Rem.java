/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operations.User;

/**
 *
 * @author Sergios
 */
import DBcomm.ConnPoolInit;
import java.sql.PreparedStatement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class User_Rem extends HttpServlet {

    private Connection connection;
    private PreparedStatement statement;

    /**
     * Deletes the user from the database
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

	    String username = (String) request.getParameter("username");
	    String where = (String) request.getParameter("where");

	    String query;
	    if (Integer.parseInt(where) == 2) {
		query = "delete from conf_users where username = ?";
	    } else {
		query = "delete from pend_users where username = ?";
	    }

	    connection = ConnPoolInit.Datasource.getConnection();
	    statement = connection.prepareStatement(query);

	    statement.setString(1, username);

	    // execute the java preparedstatement
	    statement.executeUpdate();
	    statement.close();
	    connection.close();

	} catch (SQLException e) {
	    e.printStackTrace();
	}

	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/manage_users.jsp");
	dispatcher.forward(request, response);
    }
}
