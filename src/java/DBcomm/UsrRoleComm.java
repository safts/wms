/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DBcomm;

/**
 *
 * @author Sergios
 */
import entities.UsrRole;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class UsrRoleComm {

    static private Connection connection;
    static private Statement statement;

    public static List<UsrRole> getUserRoles(String role) {

	/**
	 * Returns a list of user roles or a single user role (depends on 
	 * whether the "role" parameter contains a system role or null) 
	 * from the database
	 *
	 * @param role (String) / null : the name of the desired role
	 * @return
	 */
	LinkedList<UsrRole> user_roles = new LinkedList<UsrRole>();
	try {

	    connection = ConnPoolInit.Datasource.getConnection();
	    statement = connection.createStatement();

	    ResultSet set = null;

	    statement = connection.createStatement();

	    if (role == null) {
		set = statement.executeQuery("SELECT * FROM user_role ");
	    } else {
		set = statement.executeQuery("SELECT * FROM user_role where description='" + role + "'");
	    }

	    String description;
	    int prod_perm;
	    int wh_perm;
	    int role_perm;
	    int suppl_perm;
	    int usr_perm;

	    while (set.next()) {
		description = set.getString("description");
		prod_perm = set.getInt("products_permissions");
		wh_perm = set.getInt("warehouses_permissions");
		role_perm = set.getInt("roles_permissions");
		suppl_perm = set.getInt("suppliers_permissions");
		usr_perm = set.getInt("users_permissions");
		UsrRole usrrl1 = new UsrRole(description, prod_perm, wh_perm, role_perm, suppl_perm, usr_perm);
		user_roles.add(usrrl1);
	    }
	    statement.close();
	    connection.close();
	} catch (SQLException e) {
	    e.printStackTrace();

	}


	return user_roles;
    }
}
