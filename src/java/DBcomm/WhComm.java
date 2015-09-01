/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DBcomm;

/**
 *
 * @author Sergios
 */
import entities.Warehouse;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class WhComm {

    static private Connection connection;
    static private Statement statement;

    public static List<Warehouse> getWh(String wh) {

	/**
	 * Returns a list of warehouses or a single warehouse (depends on 
	 * whether the "warehouse" parameter contains a wh_name or null) 
	 * from the database
	 * @param wh (String) / null : the name of the desired warehouse
	 * @return
	 */
	LinkedList<Warehouse> warehouses = new LinkedList<Warehouse>();
	try {

	    connection = ConnPoolInit.Datasource.getConnection();

	    statement = connection.createStatement();
	    ResultSet set = null;
	    if (wh == null) {
		set = statement.executeQuery("SELECT * FROM warehouse ");
	    } else {
		set = statement.executeQuery("SELECT * FROM warehouse where name='" + wh + "'");
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

		name = set.getString("name");
		description = set.getString("description");
		location = set.getString("location");
		is_open = set.getBoolean("is_open");

		set1 = statement1.executeQuery("SELECT * FROM products_has_warehouse WHERE warehouse_name like '" + name + "'");

		while (set1.next()) {
		    found++;
		}

		if (found > 0) {
		    has_products = true;
		} else {
		    has_products = false;
		}

		Warehouse wh1 = new Warehouse(name, location, description, is_open, has_products);
		warehouses.add(wh1);
	    }
	    statement.close();
	    statement1.close();
	    connection.close();

	} catch (SQLException e) {
	    e.printStackTrace();

	}


	return warehouses;
    }
}
