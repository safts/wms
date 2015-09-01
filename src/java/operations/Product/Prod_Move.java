/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operations.Product;

import DBcomm.ConnPoolInit;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

public class Prod_Move extends HttpServlet {

    private Connection connection;
    private Statement statement;

    /**
     * Moves the product between warehouses
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
    @Override
    protected void doPost(HttpServletRequest request,
	    HttpServletResponse response)
	    throws ServletException, IOException {
	String url = "/move_product.jsp";
	Calendar calendar = Calendar.getInstance();
	String formattedDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar.getTime());
	try {

	    connection = ConnPoolInit.Datasource.getConnection();
	    statement = connection.createStatement();
	    ResultSet set;

	    String prod_sn = request.getParameter("prod_sn");
	    String wh_sel1 = request.getParameter("wh_sel1");
	    String wh_sel2 = request.getParameter("wh_sel2");
	    Integer amount;
	    //System.out.println(prod_sn);
	    System.out.println("Whsel1:" +wh_sel1);
	    if (wh_sel1 != null  && wh_sel2 == null) {

		set = statement.executeQuery("select * from products_has_warehouse where "
			+ "products_serial_number = '" + prod_sn + "' and warehouse_name = '" + wh_sel1 + "'");
		set.next();
		amount = set.getInt("amount");
		request.setAttribute("amount", amount);
		request.setAttribute("prod_sn", prod_sn);
		request.setAttribute("wh_name", wh_sel1);
		url = "/move_product.jsp";
	    }
	    if (wh_sel1 != null && wh_sel2 != null && !wh_sel1.equals("all")) {
		amount = Integer.parseInt(request.getParameter("amount"));
		String query1 = "select * from products_has_warehouse "
			+ "where products_serial_number = '" + prod_sn + "' and "
			+ "warehouse_name ='" + wh_sel1 + "'";


		Statement statement1 = connection.createStatement();
		ResultSet set1 = statement1.executeQuery(query1);
		set1.next();

		if (amount > Integer.parseInt(set1.getString("amount"))) {
		    amount = Integer.parseInt(set1.getString("amount"));
		}

		String wh_hist = "insert into warehouse_history values (DEFAULT,?,?,?,?,?,?,?)";
		PreparedStatement statement3 = connection.prepareStatement(wh_hist);
		statement3.setString(1, set1.getString("warehouse_name"));
		statement3.setString(2, prod_sn);
		statement3.setString(3, set1.getString("products_name"));
		statement3.setString(4, Integer.toString(amount));
		statement3.setString(5, "");
		statement3.setString(6, formattedDate);
		statement3.setString(7, "move_removed");
		statement3.executeUpdate();
		statement3.close();

		String name = set1.getString("products_name");
		String serial_n1 = set1.getString("products_serial_number");

		if (amount == Integer.parseInt(set1.getString("amount"))) {
		    //amount = Integer.parseInt(set1.getString("amount"));
		    String query2 = "delete from products_has_warehouse where "
			    + "warehouse_name = '" + wh_sel1 + "' and products_serial_number = '" + prod_sn + "'";
		    PreparedStatement statement2 = connection.prepareStatement(query2);
		    statement2.executeUpdate();
		    statement2.close();

		} else {
		    String query2 = "update products_has_warehouse set amount = ? where "
			    + "warehouse_name = ? and products_serial_number = ? ";
		    Integer amount1 = Integer.parseInt(set1.getString("amount")) - amount;
		    PreparedStatement statement2 = connection.prepareStatement(query2);
		    statement2.setString(1, Integer.toString(amount1));
		    statement2.setString(2, wh_sel1);
		    statement2.setString(3, serial_n1);
		    statement2.executeUpdate();
		    statement2.close();
		}

		Statement statement5;
		statement5 = connection.createStatement();
		ResultSet set2;
		set2 = statement5.executeQuery("select * from products_has_warehouse where "
			+ "warehouse_name = '"+wh_sel2+"' and products_serial_number = '"+serial_n1+ "'");

			
		int found = 0;
		while (set2.next()) {
		    found++;
		}
		
		if (found > 0) {
		    
		    set2.previous();
		    String query2 = "update products_has_warehouse set amount = ? where "
			    + "warehouse_name = ? and products_serial_number = ? ";
		    Integer amount1 = Integer.parseInt(set2.getString("amount")) + amount;
		    PreparedStatement statement2 = connection.prepareStatement(query2);
		    statement2.setString(1, Integer.toString(amount1));
		    statement2.setString(2, wh_sel2);
		    statement2.setString(3, serial_n1);
		    statement2.executeUpdate();
		    statement2.close();
		    
		} else {
		    String query2 = "insert into products_has_warehouse values (?,?,?,?)";
		    PreparedStatement statement2 = connection.prepareStatement(query2);
		    statement2.setString(1, serial_n1);
		    statement2.setString(2, name);
		    statement2.setString(3, wh_sel2);
		    statement2.setInt(4, amount);
		    statement2.executeUpdate();
		    statement2.close();
		}


		String hist1 = "insert into warehouse_history values (DEFAULT,?,?,?,?,?,?,?)";
		PreparedStatement statement4 = connection.prepareStatement(hist1);
		statement4.setString(1, wh_sel2);
		statement4.setString(2, serial_n1);
		statement4.setString(3, name);
		statement4.setString(4, Integer.toString(amount));
		statement4.setString(5, "");
		statement4.setString(6, formattedDate);
		statement4.setString(7, "move_added");
		statement4.executeUpdate();
		url = "/manage_products.jsp";
		statement4.close();
		statement5.close();
	    }
	    else{
		
	    }
	    statement.close();
	   
	    connection.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	}

	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
	dispatcher.forward(request, response);
    }
}