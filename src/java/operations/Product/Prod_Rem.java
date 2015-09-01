/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operations.Product;

import DBcomm.ConnPoolInit;
import DBcomm.WhHistComm;
import entities.WhHistory;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sergios
 */
public class Prod_Rem extends HttpServlet {

    private Connection connection;
    private PreparedStatement statement;

    /**
     * Deletes the specified product
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

	    Calendar calendar = Calendar.getInstance();
	    String formattedDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar.getTime());

	    String prod_sn = (String) request.getParameter("prod_sn");

	    connection = ConnPoolInit.Datasource.getConnection();

	    Statement statement2 = connection.createStatement();

	    ResultSet set = statement2.executeQuery("select * from products_has_warehouse where "
		    + "products_serial_number = '" + prod_sn + "'");

	    while (set.next()) {

		String query1 = "insert into warehouse_history values(DEFAULT,?,?,?,?,?,?,?)";
		PreparedStatement statement1 = connection.prepareStatement(query1);
		statement1.setString(1, set.getString("warehouse_name"));
		statement1.setString(2, prod_sn);
		statement1.setString(3, set.getString("products_name"));
		statement1.setString(4, set.getString("amount"));
		statement1.setString(5, "");
		statement1.setString(6, formattedDate);
		statement1.setString(7, "removed");
		statement1.executeUpdate();
		System.out.println(set.getString("products_name") + "error");
		statement1.close();

	    }


	    String query = "delete from products where serial_number = ?";

	    connection = ConnPoolInit.Datasource.getConnection();
	    statement = connection.prepareStatement(query);

	    statement.setString(1, prod_sn);

	    // execute the java preparedstatement
	    statement.executeUpdate();

	    statement2.close();
	    statement.close();
	    connection.close();



	} catch (SQLException e) {
	    e.printStackTrace();
	}

	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/manage_products.jsp");
	dispatcher.forward(request, response);
    }
}
