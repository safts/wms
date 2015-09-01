/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operations.SysRole;

import DBcomm.ConnPoolInit;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author Sergios
 */
public class Sys_Role_Add extends HttpServlet {

    private Connection connection;
    private PreparedStatement statement;

    /**
     * Adds the system_role in the database
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
	try {
	    String wh_sel = request.getParameter("wh_sel");
	    String usr_sel = request.getParameter("usr_sel");
	    int rl_sel = Integer.parseInt(request.getParameter("rl_sel"));
	    int pr_sel = Integer.parseInt(request.getParameter("pr_sel"));
	    int suppl_sel = Integer.parseInt(request.getParameter("suppl_sel"));
	    String description = request.getParameter("description");

	    connection = ConnPoolInit.Datasource.getConnection();


	    String query = "insert into user_role VALUES(?,?,?,?,?,?)";
	    statement = connection.prepareStatement(query);
	    statement.setInt(2, pr_sel);
	    statement.setInt(3, Integer.parseInt(wh_sel));
	    statement.setInt(4, rl_sel);
	    statement.setInt(5, suppl_sel);
	    statement.setInt(6, Integer.parseInt(usr_sel));
	    statement.setString(1, description);

	    // execute the java preparedstatement
	    statement.executeUpdate();

	    statement.close();
	    connection.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	}

	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/manage_system_roles.jsp");
	dispatcher.forward(request, response);
    }
}
