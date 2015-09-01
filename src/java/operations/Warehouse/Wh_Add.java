/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operations.Warehouse;

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
public class Wh_Add extends HttpServlet {

    private Connection connection;
    private PreparedStatement statement;

    /**
     * Adds the warehouse in the database
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
	    String location = request.getParameter("location");
	    String is_open = request.getParameter("optionsRadios");
	    String description = request.getParameter("description");
	    String name = request.getParameter("name");

	    connection = ConnPoolInit.Datasource.getConnection();


	    String query = "insert into warehouse values (?,?,?,?)";
	    statement = connection.prepareStatement(query);
	    statement.setString(1, name);
	    statement.setString(2, location);
	    statement.setString(3, description);
	    if (Integer.parseInt(is_open) == 1) {
		statement.setBoolean(4, true);
	    } else {
		statement.setBoolean(4, false);
	    }

	    // execute the java preparedstatement
	    statement.executeUpdate();
	    statement.close();
	    connection.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	}

	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/manage_warehouses.jsp");
	dispatcher.forward(request, response);
    }
}
