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
import java.sql.Statement;
import java.sql.SQLException;
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
public class Prod_Edit extends HttpServlet {

    private Connection connection;
    private PreparedStatement statement;
    /**
     * Edits the specified product details (changes the database)
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
    @Override
    protected void doPost(HttpServletRequest request,
	    HttpServletResponse response)
	    throws ServletException, IOException {
	try {
	    String name = request.getParameter("name");
	    String description = request.getParameter("description");
	    String serial_n = request.getParameter("serial_n");
	    String wh_sel = request.getParameter("wh_sel");
	    String old_wh_sel = request.getParameter("old_wh_sel");

	    String suppl_sel = request.getParameter("suppl_sel");
	    String price = request.getParameter("price");
	    String dimensions = request.getParameter("dimensions");
	    String weight = request.getParameter("weight");

	    connection = ConnPoolInit.Datasource.getConnection();

	    Calendar calendar = Calendar.getInstance();
	    String formattedDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar.getTime());

	    String query = "update products set description = ? ,"
		    + "weight = ? , dimensions = ?  where serial_number = '" + serial_n + "'";

	    statement = connection.prepareStatement(query);
	    statement.setString(1, description);
	    statement.setString(2, weight);
	    statement.setString(3, dimensions);

	    // execute the java preparedstatement
	    statement.executeUpdate();

	    if (wh_sel != null) {
		Statement statement1;

		String query1; 
			if(old_wh_sel!=null)
			    query1= "select * from products_has_warehouse "
				    + "where products_serial_number = '" + serial_n + "' and "
				    + "warehouse_name ='"+ old_wh_sel+"'";
			else
			    query1 = "select * from products_has_warehouse "
				    + "where products_serial_number = '" + serial_n + "'";


		statement1 = connection.createStatement();
		ResultSet set1 = statement1.executeQuery(query1);
		int amount = 0;
		while (set1.next()) {
		    amount += set1.getInt("amount");
		    String wh_hist="insert into warehouse_history values (DEFAULT,?,?,?,?,?,?,?)";
		    PreparedStatement statement3=connection.prepareStatement(wh_hist);
		    statement3.setString(1,set1.getString("warehouse_name"));
		    statement3.setString(2,serial_n);
		    statement3.setString(3,name);
		    statement3.setString(4,Integer.toString(set1.getInt("amount")));
		    statement3.setString(5,price);
		    statement3.setString(6,formattedDate);
		    statement3.setString(7,"move_removed");
		    statement3.executeUpdate();
		    statement3.close();

		}
		set1.previous();
		name = set1.getString("products_name");
		String serial_n1 = set1.getString("products_serial_number");

		String query2;
		if( old_wh_sel == null)
		   query2 = "delete from products_has_warehouse where products_serial_number = '" + serial_n + "'";
		else
		    query2 = "delete from products_has_warehouse where "
			+ "products_serial_number = '" + serial_n + "' and warehouse_name ='" +old_wh_sel+ "'";
		PreparedStatement statement2 = connection.prepareStatement(query2);
		statement2.executeUpdate();
		//statement2.close();
		Statement statement4=connection.createStatement();
		ResultSet set2=statement4.executeQuery("select * from products_has_warehouse where "
			+ "products_serial_number = '"+serial_n1+"' and warehouse_name='"+wh_sel+"'");
		
		int found=0;
		while(set2.next())
		    found++;
		if(found==0){
		    
		    query2 = "insert into products_has_warehouse values (?,?,?,?)";
		    statement2 = connection.prepareStatement(query2);
		    statement2.setString(1, serial_n1);
		    statement2.setString(2, name);
		    statement2.setString(3, wh_sel);
		    statement2.setInt(4, amount);
		    statement2.executeUpdate();
		    //statement2.close();
		}
		else{
		    set2.previous();
		    query2 = "update products_has_warehouse set amount = ? where "
			    + "products_serial_number = ? and warehouse_name=?";
		    PreparedStatement statement3=connection.prepareStatement(query2);
		    statement3.setInt(1,set2.getInt("amount")+amount);
		    statement3.setString(2,serial_n1);
		    statement3.setString(3,wh_sel);
		    statement3.executeUpdate();
		    statement3.close();
		}
		
		
		
		String wh_hist="insert into warehouse_history values (DEFAULT,?,?,?,?,?,?,?)";
		PreparedStatement statement3=connection.prepareStatement(wh_hist);
		statement3.setString(1,wh_sel);
		statement3.setString(2,serial_n1);
		statement3.setString(3,name);
		statement3.setString(4,Integer.toString(amount));
		statement3.setString(5,price);
		statement3.setString(6,formattedDate);
		statement3.setString(7,"move_added");
		statement3.executeUpdate();
		statement1.close();
		statement2.close();
		statement3.close();
		statement4.close();

	    }
	    if (suppl_sel != null) {
		Statement statement1;

		String query1 = "select * from products_has_suppliers where products_serial_number = '" + serial_n + "'";

		statement1 = connection.createStatement();
		ResultSet set1 = statement1.executeQuery(query1);
		
		//while (set1.next()) {
		set1.next();
		name = set1.getString("products_name");
		//serial_n = set1.getString("products_serial_number");

		    
		//}
		String query2 = "delete from products_has_suppliers where products_serial_number = '" + serial_n + "'";
		PreparedStatement statement2 = connection.prepareStatement(query2);
		statement2.executeUpdate();

		query2 = "insert into products_has_suppliers values (?,?,?,?)";

//		System.out.println(serial_n);
//		System.out.println(name);
//		System.out.println(suppl_sel);
//		System.out.println(price);
		
		
		statement2 = connection.prepareStatement(query2);
		statement2.setString(1, serial_n);
		statement2.setString(2, name);
		statement2.setString(3, suppl_sel);
		statement2.setString(4, price);
		statement2.executeUpdate();
		statement1.close();
		statement2.close();

	    }
	    statement.close();
	    connection.close();

	} catch (SQLException e) {
	    e.printStackTrace();
	}

	//System.out.println(wh_sel+"  keno  "+suppl_sel+"  keno  "+dimensions);
	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/manage_products.jsp");
	dispatcher.forward(request, response);
    }
}
