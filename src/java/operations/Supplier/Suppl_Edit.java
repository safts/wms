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


public class Suppl_Edit extends HttpServlet {

    private Connection connection;
    private PreparedStatement statement;

    /**
     * Edits the specified supplier's details (changes the database)
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
	    String address = request.getParameter("address");
	    String phone_n = request.getParameter("phone_n");
	    String nin = request.getParameter("nin");
	    String email = request.getParameter("email");

	    connection = ConnPoolInit.Datasource.getConnection();


	    String query = "update suppliers set address = ? , "
		    + "phone_number = ? , email = ? , "
		    + "national_insurance_number = ? "
		    + "where name = ? ";
	    statement = connection.prepareStatement(query);
	    statement.setString(1, address);
	    statement.setString(2, phone_n);
	    statement.setString(3, email);
	    statement.setString(4, nin);
	    statement.setString(5, name);

	    //System.out.println( address +"  " + phone_n +"  " + email +"   " + nin + "  " + name);
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
