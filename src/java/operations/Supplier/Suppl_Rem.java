/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operations.Supplier;

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


public class Suppl_Rem extends HttpServlet {

    private Connection connection;
    private PreparedStatement statement;

    /**
     * Deletes the specified supplier
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
	    String name = request.getParameter("name");

	    connection = ConnPoolInit.Datasource.getConnection();


	    String query = "delete from suppliers where name='" + name + "'";

	    statement = connection.prepareStatement(query);

	    //System.out.println(name);

	    // execute the java preparedstatement
	    statement.executeUpdate();
	    statement.close();
	    connection.close();

	} catch (SQLException e) {
	    e.printStackTrace();
	}

	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/manage_suppliers.jsp");
	dispatcher.forward(request, response);
    }
}
