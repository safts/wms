/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DBcomm;

/**
 *
 * @author Sergios
 */
import entities.Supplier;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class SupplComm {

    static private Connection connection;
    static private Statement statement;

    /**
     * Returns a list of suppliers or a single supplier (depends on whether the
     * "suppl_name" parameter contains a supplier name or null) from the
     * database
     *
     * @param suppl_name (String) / null : the name of the desired supplier
     * @return
     */
    public static List<Supplier> getSuppliers(String suppl_name) {


	LinkedList<Supplier> suppliers = new LinkedList<Supplier>();
	try {

	    connection = ConnPoolInit.Datasource.getConnection();
	    statement = connection.createStatement();

	    ResultSet set = null;

	    statement = connection.createStatement();
	    
	    if(suppl_name==null)
		set = statement.executeQuery("SELECT * FROM suppliers ");
	    else
		set = statement.executeQuery("SELECT * FROM suppliers where name='"+suppl_name+"'");
	    
	    ///System.out.println(suppl_name);
	    
	    String name;
	    String address;
	    String email;
	    String phone_number;
	    String n_i_n;

	    while (set.next()) {
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
