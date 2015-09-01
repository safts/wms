/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operations.Supplier;

import DBcomm.ConnPoolInit;
import entities.Product;
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


public class Suppl_View extends HttpServlet {

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

	List<Product> products = new LinkedList<Product>();
	List<String> prices = new LinkedList<String>();
	int suppl_n = 0;
	String suppliers_name = (String) request.getParameter("name");

	try {

	    connection = ConnPoolInit.Datasource.getConnection();

	    ResultSet set = null;
	    String serialN;
	    String name;
	    String descr;
	    String cat;
	    String weight;
	    String dim;


	    statement = connection.createStatement();
	    set = statement.executeQuery("select * from suppliers where name = '" + suppliers_name + "'");
	    set.next();
	    //set.previous();
	    String address = set.getString("address");
	    String email = set.getString("email");
	    String phone_number = set.getString("phone_number");
	    String nin = set.getString("national_insurance_number");

	    String product_sn;

	    Statement statement1 = connection.createStatement();
	    ResultSet set1 = statement1.executeQuery("select * from products_has_suppliers where suppliers_name = '" + suppliers_name + "'");
	    Statement statement2 = connection.createStatement();
	    ResultSet set2;
	    while (set1.next()) {

		product_sn = set1.getString("products_serial_number");
		String price = set1.getString("price");
		prices.add(price);
		set2 = statement2.executeQuery("select * from products where serial_number = '" + product_sn + "'");
		set2.next();
		serialN = set2.getString("serial_number");
		name = set2.getString("name");
		descr = set2.getString("description");
		cat = set2.getString("category");
		weight = set2.getString("weight");
		dim = set2.getString("dimensions");
		Product prod1 = new Product(serialN, name, descr, cat, weight, dim);
		products.add(prod1);
		suppl_n++;
	    }
	    statement.close();
	    statement1.close();
	    statement2.close();
	    connection.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	}

	request.setAttribute("suppl_n", suppliers_name);
	//System.out.println(suppliers_name);
	request.setAttribute("products", products);
	request.setAttribute("prices", prices);

	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/view_supplier.jsp");
	dispatcher.forward(request, response);
    }
}