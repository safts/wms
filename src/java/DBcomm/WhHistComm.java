/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DBcomm;

import entities.WhHistory;
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
public class WhHistComm {

    static private Connection connection;
    static private Statement statement;

    /**
     * Returns the warehouse history for a single product (if p!= null)
     * or for all the products. Also, if w!=null returns the warehouse 
     * history for a specified warehouse otherwise for all the warehouses
     *
     * @param w (String) / null : the name of the desired warehouse
     * @param p (String) / null : the id of the desired product
     * @return
     */
    public static List<WhHistory> getWhHist(String w, String p) {


	LinkedList<WhHistory> history = new LinkedList<WhHistory>();
	try {

	    connection = ConnPoolInit.Datasource.getConnection();

	    statement = connection.createStatement();
	    ResultSet set = null;
	    if (w == null) {
		set = statement.executeQuery("SELECT * FROM warehouse_history ");
	    } else {
		set = statement.executeQuery("SELECT * FROM warehouse_history where warehouse_name='" + w + "'");
	    }

	    if (p == null) {
		set = statement.executeQuery("SELECT * FROM warehouse_history ");
	    } else if (!p.equals("no")) {
		set = statement.executeQuery("SELECT * FROM warehouse_history where pr_serial_number='" + p + "'");
	    }

	    String warehouse_name;
	    String pr_serial_number;
	    String pr_name;
	    String quantity;
	    String price;
	    String date;
	    String type;


	    while (set.next()) {

		warehouse_name = set.getString("warehouse_name");
		pr_serial_number = set.getString("pr_serial_number");
		pr_name = set.getString("pr_name");
		quantity = set.getString("quantity");
		price = set.getString("price");
		date = set.getString("date");
		type = set.getString("type");


		WhHistory h1 = new WhHistory(warehouse_name, pr_serial_number, pr_name, quantity, price, date, type);
		history.add(h1);
	    }
	    statement.close();
	    connection.close();

	} catch (SQLException e) {
	    e.printStackTrace();

	}


	return history;
    }
}