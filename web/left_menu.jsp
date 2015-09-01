<!-- left menu starts -->
<div class="span2 main-menu-span" style="margin-top:10px;">
	<div class="well nav-collapse sidebar-nav">
		<ul class="nav nav-tabs nav-stacked main-menu">
			<li class="nav-header hidden-tablet">System</li>
			<%
			    session = request.getSession(false);
			    
			    String prod_perm = (String) session.getAttribute("prod_perm");
			    String usr_perm= (String) session.getAttribute("usr_perm");
			    String wh_perm= (String) session.getAttribute("wh_perm");
			    String role_perm= (String) session.getAttribute("role_perm");
			    String suppl_perm= (String) session.getAttribute("suppl_perm");
			    
			    if( usr_perm != null && Integer.parseInt(usr_perm) >0 )
				out.println("<li><a href=\"manage_users.jsp\" ><span class=\"hidden-tablet\"> Manage Users</span></a></li>");
			    if( role_perm != null && Integer.parseInt(role_perm) >0 )
				out.println("<li><a href=\"manage_system_roles.jsp\" ><span class=\"hidden-tablet\"> Manage System Roles</span></a></li>");
			    if( wh_perm != null && Integer.parseInt(wh_perm) >0 )
				out.println("<li><a href=\"manage_warehouses.jsp\" ><span class=\"hidden-tablet\"> Manage Warehouses</span></a></li>");
			    if( suppl_perm != null && Integer.parseInt(suppl_perm) >0 )
				out.println("<li><a href=\"manage_suppliers.jsp\" ><span class=\"hidden-tablet\"> Manage Suppliers</span></a></li>");
			    if( prod_perm != null && Integer.parseInt(prod_perm) >0 )
				out.println("<li><a href=\"manage_products.jsp\" ><span class=\"hidden-tablet\"> Manage Products</span></a></li>");
			    if ( usr_perm == null || role_perm == null || wh_perm == null || suppl_perm == null || prod_perm == null )
				out.println("<li><a>You do not have the required permissions to "
					+ "view the system actions</a></li>");
			    else if ( Integer.parseInt(usr_perm) == 0 && Integer.parseInt(role_perm) == 0 && Integer.parseInt(wh_perm) == 0 && Integer.parseInt(suppl_perm) == 0 && Integer.parseInt(prod_perm) == 0 )
				out.println("<li><a>You do not have the required permissions to "
					+ "view the system actions</a></li>");
			%>
		</ul>
	</div><!--/.well -->
</div><!--/span-->
<!-- left menu ends -->