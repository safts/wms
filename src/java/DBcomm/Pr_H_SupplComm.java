/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DBcomm;

import entities.Supplier;
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
public class Pr_H_SupplComm {
    
    static private Connection connection;
    static private Statement statement;
    /**
     * Returns a list with the suppliers of the given product if pr_name!=null
     * otherwise it returns all the products_has_suppliers relations
     * 
     * @param pr_name (String) / null : the id of the desired product
     * @return 
     */
    public static List<Supplier> getSuppl(String pr_name) {


	LinkedList<Supplier> suppliers = new LinkedList<Supplier>();
	try {

	    connection = ConnPoolInit.Datasource.getConnection();
	    statement = connection.createStatement();

	    ResultSet set = null;

	    statement = connection.createStatement();
	    if(pr_name == null)
		set = statement.executeQuery("SELECT * FROM products_has_suppliers ");
	    else
		set = statement.executeQuery("SELECT * FROM products_has_suppliers where products_serial_number = '"+pr_name+"'");

	    String name;
	    String address;
	    String email;
	    String phone_number;
	    String n_i_n;

	    while (set.next()) {
		
		set = statement.executeQuery("SELECT * FROM suppliers WHERE name ='" + set.getString("suppliers_name") + "'");
		set.next();
		name = set.getString("name");
		address = set.getString("address");
		email = set.getString("email");
		phone_number = set.getString("phone_number");
		n_i_n = set.getString("national_insurance_number");
		Supplier suppl1 = new Supplier(name, address, email, phone_number, n_i_n);
		suppliers.add(suppl1);
	    }
	    statement.close();
	    connection.close();

	} catch (SQLException e) {
	    e.printStackTrace();
	}
	return suppliers;
    }
}
