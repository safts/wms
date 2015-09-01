/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operations.Product;

import DBcomm.ConnPoolInit;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
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
/**
 * 
 * @author Sergios
 */
public class Prod_Add extends HttpServlet {

    private Connection connection;
    private PreparedStatement statement;

    /**
     * Adds the product in the database
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
    @Override
    protected void doPost(HttpServletRequest request,
	    HttpServletResponse response)
	    throws ServletException, IOException {

	Calendar calendar = Calendar.getInstance();
	String formattedDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar.getTime());


	try {

	    connection = ConnPoolInit.Datasource.getConnection();

	    String name = request.getParameter("name");
	    String serial_n = request.getParameter("serial_n");
	    String description = request.getParameter("description");
	    String amount = request.getParameter("amount");
	    String wh_sel = request.getParameter("wh_sel");
	    String suppl_sel = request.getParameter("suppl_sel");
	    String price = request.getParameter("price");
	    String dimensions = request.getParameter("dimensions");
	    String weight = request.getParameter("weight");
	    String category = request.getParameter("category");

	    String query;
	    query = "insert into products values (?,?,?,?,?,?)";
	    statement = connection.prepareStatement(query);
	    statement.setString(1, serial_n);
	    statement.setString(2, name);
	    statement.setString(3, description);
	    statement.setString(4, category);
	    statement.setString(5, weight);
	    statement.setString(6, dimensions);
	    statement.executeUpdate();


	    String query0 = "insert into products_has_warehouse values (?,?,?,?)";
	    statement = connection.prepareStatement(query0);
	    statement.setString(1, serial_n);
	    statement.setString(2, name);
	    statement.setString(3, wh_sel);
	    statement.setInt(4, Integer.parseInt(amount));
	    statement.executeUpdate();

	    if (suppl_sel != null) {

		String query1 = "insert into products_has_suppliers values (?,?,?,?)";
		statement = connection.prepareStatement(query1);
		statement.setString(1, serial_n);
		statement.setString(2, name);
		statement.setString(3, suppl_sel);
		statement.setString(4, price);
		statement.executeUpdate();

	    }

	    String query2 = "insert into warehouse_history values (?,?,?,?,?,?,?)";
	    statement=connection.prepareStatement(query2);
	    statement.setString(1, wh_sel);
	    statement.setString(2, serial_n);
	    statement.setString(3, name);
	    statement.setString(4, amount);
	    statement.setString(5, price);
	    statement.setString(6, formattedDate);
	    statement.setString(7, "added");

	    statement.executeUpdate();

	    statement.close();
	    connection.close();


	} catch (SQLException e) {
	    e.printStackTrace();
	}



	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/manage_products.jsp");
	dispatcher.forward(request, response);
    }
}