/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DBcomm;

/**
 *
 * @author Sergios
 */
import entities.Product;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.http.HttpSession;

public class ProdComm {

    static private Connection connection;
    static private Statement statement;

    /**
     * Returns a list of products or a single product (depends on whether the
     * "product" parameter contains a product id or null) from the database
     *
     * @param product (String) / null : the name of the desired supplier
     * @return
     */
    public static List<Product> getProducts(String product) {


	LinkedList<Product> products = new LinkedList<Product>();
	try {

	    connection = ConnPoolInit.Datasource.getConnection();
	    statement = connection.createStatement();

	    ResultSet set = null;

	    statement = connection.createStatement();
	    if (product == null) {
		set = statement.executeQuery("SELECT * FROM products ");
	    } else {
		set = statement.executeQuery("SELECT * FROM products where serial_number = '" + product + "'");
	    }

	    String serialN;
	    String name;
	    String descr;
	    String cat;
	    String weight;
	    String dim;

	    while (set.next()) {
		serialN = set.getString("serial_number");
		name = set.getString("name");
		descr = set.getString("description");
		cat = set.getString("category");
		weight = set.getString("weight");
		dim = set.getString("dimensions");
		Product prod1 = new Product(serialN, name, descr, cat, weight, dim);
		products.add(prod1);
	    }

	    statement.close();
	    connection.close();
	} catch (SQLException e) {
	    e.printStackTrace();

	}
	

	return products;
    }
}
