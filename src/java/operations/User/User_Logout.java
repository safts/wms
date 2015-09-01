/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operations.User;

import java.io.IOException;
import javax.servlet.http.HttpSession;


import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class User_Logout extends HttpServlet {

    /**
     * Logs the user out
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
    @Override
    protected void doPost(HttpServletRequest request,
	    HttpServletResponse response)
	    throws ServletException, IOException {

	HttpSession session = request.getSession(false);

	if (session != null && session.getAttribute("username") != null) {
	    session.invalidate();
	    //session.setAttribute("username",null);
	    //response.sendRedirect("/index.jsp");

	}
	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
	dispatcher.forward(request, response);
    }
}
