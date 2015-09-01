/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DBcomm;

import entities.Warehouse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Sergios
 */
public class Pr_H_WhComm {

    static private Connection connection;
    static private Statement statement;

    /**
     * Returns a list with the warehouses of the given product if pr!=null
     * otherwise it returns all the products_has_warehouses relations
     * 
     * @param pr (String) / null : the id of the desired product
     * @return 
     */
    public static List<Warehouse> getWh(String pr) {


	LinkedList<Warehouse> warehouses = new LinkedList<Warehouse>();
	try {

	    connection = ConnPoolInit.Datasource.getConnection();

	    statement = connection.createStatement();
	    ResultSet set = null;
	    if (pr == null) {
		set = statement.executeQuery("SELECT * FROM products_has_warehouse ");
	    } else {
		set = statement.executeQuery("SELECT * FROM products_has_warehouse where "
			+ "products_serial_number='" + pr + "'");
	    }

	    Statement statement1 = connection.createStatement();

	    ResultSet set1 = null;

	    String location;
	    String name;
	    String description;
	    boolean is_open;
	    boolean has_products;

	    while (set.next()) {

		int found = 0;

		set1 = statement1.executeQuery("SELECT * FROM warehouse WHERE name ='" + set.getString("warehouse_name") + "'");
		set1.next();
		name = set1.getString("name");
		description = set1.getString("description");
		location = set1.getString("location");
		is_open = set1.getBoolean("is_open");

		has_products = true;

		Warehouse wh1 = new Warehouse(name, location, description, is_open, has_products, set.getInt("amount"));
		warehouses.add(wh1);
	    }
	    statement1.close();
	    connection.close();

	} catch (SQLException e) {
	    e.printStackTrace();

	}

	return warehouses;
    }
}