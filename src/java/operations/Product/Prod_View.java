/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operations.Product;

import DBcomm.ConnPoolInit;
import entities.Warehouse;
import entities.Supplier;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Prod_View extends HttpServlet {

    private Connection connection;
    private Statement statement;

    /**
     * Returns the product details from the database (cross-references multiple
     * tables)
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

	List<Warehouse> warehouses = new LinkedList<Warehouse>();
	List<Supplier> suppliers = new LinkedList<Supplier>();
	List<Integer> quantities = new LinkedList<Integer>();
	List<String> prices = new LinkedList<String>();

	int wh_n = 0;
	int s_n = 0;
	try {

	    connection = ConnPoolInit.Datasource.getConnection();

	    ResultSet set = null;
	    String name;
	    String location;
	    String descr;
	    boolean is_open;

	    String s_name;
	    String s_address;
	    String s_email;
	    String s_phone_number;
	    String s_national_insurance_number;


	    String prod_sn = (String) request.getParameter("prod_sn");
	    //statement = connection.createStatement();
	    //set = statement.executeQuery("select * from warehouse where name = '"+prod_sn+"'");
	    //set.next();
	    //set.previous();
	    //String location = set.getString("location");
	    //String description = set.getString("description");
	    //boolean is_open = set.getBoolean("is_open");
	    String wh_name;

	    Statement statement1 = connection.createStatement();
	    Statement statement2 = connection.createStatement();
	    ResultSet set1 = statement1.executeQuery("select * from products_has_warehouse where products_serial_number = '" + prod_sn + "'");
	    ResultSet set2;
	    while (set1.next()) {

		wh_name = set1.getString("warehouse_name");
		int quantity = set1.getInt("amount");
		quantities.add(quantity);
		set2 = statement2.executeQuery("select * from warehouse where name = '" + wh_name + "'");
		set2.next();
		name = set2.getString("name");
		location = set2.getString("location");
		descr = set2.getString("description");
		is_open = set2.getBoolean("is_open");
		Warehouse wh1 = new Warehouse(name, location, descr, is_open);
		warehouses.add(wh1);
		wh_n++;
	    }
	    Statement statement3 = connection.createStatement();
	    Statement statement4 = connection.createStatement();
	    ResultSet set3 = statement3.executeQuery("select * from products_has_suppliers where products_serial_number = '" + prod_sn + "'");
	    ResultSet set4;
	    while (set3.next()) {

		s_name = set3.getString("suppliers_name");
		String price = set3.getString("price");
		prices.add(price);
		set4 = statement4.executeQuery("select * from suppliers where name = '" + s_name + "'");
		set4.next();
		s_address = set4.getString("address");
		s_email = set4.getString("email");
		s_phone_number = set4.getString("phone_number");
		s_national_insurance_number = set4.getString("national_insurance_number");
		Supplier s1 = new Supplier(s_name, s_address, s_email, s_phone_number, s_national_insurance_number);
		suppliers.add(s1);
		s_n++;
	    }
	    statement1.close();
	    statement2.close();
	    statement3.close();
	    statement4.close();
	    connection.close();

	} catch (SQLException e) {
	    e.printStackTrace();
	}

	request.setAttribute("wh_n", wh_n);
	request.setAttribute("s_n", s_n);
	request.setAttribute("warehouses", warehouses);
	request.setAttribute("suppliers", suppliers);
	request.setAttribute("quantities", quantities);
	request.setAttribute("prices", prices);


	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/view_product.jsp");
	dispatcher.forward(request, response);
    }
}