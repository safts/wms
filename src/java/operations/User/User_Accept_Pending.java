/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operations.User;

import DBcomm.ConnPoolInit;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 *
 */
public class User_Accept_Pending extends HttpServlet {

    private Connection connection;
    private PreparedStatement statement1;

    /**
     * Accepts the specified pending user and gives him the selected system role
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
	    String username = request.getParameter("username");
	    String role_sel = request.getParameter("role_sel");

	    connection = ConnPoolInit.Datasource.getConnection();

	    Statement statement = connection.createStatement();

	    ResultSet set = statement.executeQuery("select * from pend_users where username='" + username + "'");

	    set.next();


	    String password = set.getString("password");
	    String name = set.getString("name");
	    String surname = set.getString("surname");
	    String email = set.getString("email");
	    String signup_date = set.getString("signup_date");



	    String query = "insert into conf_users values (?,?,?,?,?,?,?,?)";

	    statement1 = connection.prepareStatement(query);
	    statement1.setString(1, username);
	    statement1.setString(2, name);
	    statement1.setString(3, surname);
	    statement1.setString(4, password);
	    statement1.setString(5, email);
	    statement1.setString(6, signup_date);
	    statement1.setString(7, "never");
	    statement1.setString(8, role_sel);




	    // execute the java preparedstatement
	    statement1.executeUpdate();

	    query = "delete from pend_users where username='" + username + "'";

	    statement1 = connection.prepareStatement(query);

	    statement1.executeUpdate();
	    statement.close();
	    statement1.close();
	    connection.close();

	} catch (SQLException e) {
	    e.printStackTrace();
	}

	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/manage_users.jsp");
	dispatcher.forward(request, response);
    }
}