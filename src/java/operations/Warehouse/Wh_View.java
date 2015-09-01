/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operations.Warehouse;

import java.sql.ResultSet;
import java.util.List;
import java.util.LinkedList;

import DBcomm.ConnPoolInit;
import entities.Product;

import entities.WhHistory;


import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sergios
 */
public class Wh_View extends HttpServlet {

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
	List<Integer> quantities = new LinkedList<Integer>();
	List<WhHistory> history = new LinkedList<WhHistory>();
	int prod_n = 0;
	try {

	    connection = ConnPoolInit.Datasource.getConnection();

	    ResultSet set = null;
	    String serialN;
	    String name;
	    String descr;
	    String cat;
	    String weight;
	    String dim;


	    String wh_name = (String) request.getParameter("wh_name");
	    statement = connection.createStatement();
	    set = statement.executeQuery("select * from warehouse where name = '" + wh_name + "'");
	    set.next();
	    //set.previous();
	    String location = set.getString("location");
	    String description = set.getString("description");
	    boolean is_open = set.getBoolean("is_open");
	    String product_sn;

	    Statement statement1 = connection.createStatement();
	    ResultSet set1 = statement1.executeQuery("select * from products_has_warehouse where warehouse_name = '" + wh_name + "'");
	    Statement statement2 = connection.createStatement();
	    ResultSet set2;
	    while (set1.next()) {

		product_sn = set1.getString("products_serial_number");
		int quantity = set1.getInt("amount");
		quantities.add(quantity);
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
		prod_n++;
	    }
	    //ResultSet set3;
	    //Statement statement3 = connection.createStatement();
	    //set3=statement.executeQuery("select * from warehouse_history where warehouse_name = '"+wh_name+"'");
	    //while(set3.next()){
	    //  WhHistory h1 = new WhHistory(set.getString("warehouse_name"),set.getString("pr_serial_number"),set.getString("pr_name"),
	    //	    set.getString("quantity"),set.getString("price"),set.getString("date"),set.getString("type"));
	    //}
	    statement.close();
	    statement1.close();
	    statement2.close();
	    connection.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	}

	request.setAttribute("prod_n", prod_n);
	request.setAttribute("products", products);
	request.setAttribute("quantities", quantities);

	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/view_warehouse.jsp");
	dispatcher.forward(request, response);
    }
}