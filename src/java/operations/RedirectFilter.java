/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operations;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sergios
 */
public class RedirectFilter implements Filter {

	public void init(FilterConfig filterConfig) throws ServletException {
	}

	public void destroy() {
	}
	/**
	 * Checks if the user session has expired and redirects the user to the index page
	 * @param req
	 * @param res
	 * @param chain
	 * @throws ServletException
	 * @throws IOException 
	 */
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession(false);

		if (request.getRequestedSessionId() != null && !request.isRequestedSessionIdValid()) {
		    
		    request.setAttribute("message", "expired");
		    response.sendRedirect(request.getContextPath() + "/index.jsp");
		    return;
		}
		if (session == null || session.getAttribute("username") == null) {
		    request.setAttribute("message", "expired");
		    response.sendRedirect(request.getContextPath() + "/index.jsp");
		    return;
		} else {
			chain.doFilter(request, response);
		}
	}
}
