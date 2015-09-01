<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

    <head>
	<meta charset="utf-8" />
	<title>View System Role Users</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template." name="description" />
	<meta content="Muhammad Usman" name="author" />

	<!-- The styles -->
	<link id="bs-css" href="css/bootstrap-united.css" rel="stylesheet" />
	<style type="text/css">
	    body {
		padding-bottom: 40px;
	    }
	    .sidebar-nav {
		padding: 9px 0;
	    }
	</style>
	<link href="css/bootstrap-responsive.css" rel="stylesheet" />
	<link href="css/charisma-app.css" rel="stylesheet" />
	<link href="css/jquery-ui-1.8.21.custom.css" rel="stylesheet" />
	<link href="css/fullcalendar.css" rel="stylesheet" />
	<link href="css/fullcalendar.print.css" media="print" rel="stylesheet" />
	<link href="css/chosen.css" rel="stylesheet" />
	<link href="css/uniform.default.css" rel="stylesheet" />
	<link href="css/colorbox.css" rel="stylesheet" />
	<link href="css/jquery.cleditor.css" rel="stylesheet" />
	<link href="css/jquery.noty.css" rel="stylesheet" />
	<link href="css/noty_theme_default.css" rel="stylesheet" />
	<link href="css/elfinder.min.css" rel="stylesheet" />
	<link href="css/elfinder.theme.css" rel="stylesheet" />
	<link href="css/jquery.iphone.toggle.css" rel="stylesheet" />
	<link href="css/opa-icons.css" rel="stylesheet" />
	<link href="css/uploadify.css" rel="stylesheet" />


	<link href="css/my_css.css" rel="stylesheet" />

	<!--MY LINKS FOR jQuery SLIDER-->


	<link href="nivo-slider/themes/default/default.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="nivo-slider/themes/light/light.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="nivo-slider/themes/dark/dark.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="nivo-slider/themes/bar/bar.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="nivo-slider/nivo-slider.css" media="screen" rel="stylesheet" type="text/css" />
	<!-- <link rel="stylesheet" href="nivo-slider/demo/style.css" type="text/css" media="screen" /> -->
	<!--END OF LINKS FOR jQuery SLIDER-->




	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- The fav icon -->
	<link href="img/favicon.ico" rel="shortcut icon" />

	<title>Applying JQuery DataTables plugin in the Java Server application</title>
	<!--    <link href="media/dataTables/demo_page.css" rel="stylesheet" type="text/css" />
		<link href="media/dataTables/demo_table.css" rel="stylesheet" type="text/css" /> -->
        <link href="media/dataTables/demo_table_jui.css" rel="stylesheet" type="text/css" /> 
        <link href="media/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
        <link href="media/themes/smoothness/jquery-ui-1.7.2.custom.css" rel="stylesheet" type="text/css" media="all" />
        <link href="media/dataTables/ColumnFilterWidgets.css" rel="stylesheet" type="text/css" />

    </head>

    <body>
	<%@include file="header.jsp" %> 

	<div class="container-fluid">
	    <div class="row-fluid">


		<!--main menu starts-->
		<%@include file="main_menu.jsp" %>


		<div class="row-fluid"> <!--row-fluid gia left menu kai content-->
		    <!-- left menu starts -->
		    <%@include file="left_menu.jsp" %>

		    <%@include file="no_script.jsp" %>

		    <!--whole content starts-->
		    <div id="content" class="span10" >


			<!--main-content admin starts-->
			<div class="row-fluid">
			    <div class="box span12">
				<div class="box-header well" data-original-title="">
				    <%@ page import="entities.User" %>
				    <h2><i><span class="icon-user"></span>&nbsp;</i><%= ((User)session.getAttribute("user")).getUserRole()%></h2>
				</div>
				<div class="box-content">
				    <ul class="breadcrumb">
					<li>
					    <span class="divider"><i>Current:</i> </span><a href="#"><%= ((User)session.getAttribute("user")).getUserRole()%></a>
					</li>
					<li>
					    <span class="divider">/</span><a href="#">Manage System Roles</a>
					</li>
					<li>
					    <span class="divider">/</span><a href="#">View System Role Users</a>
					</li>

				    </ul>


				    <div class="page-header">
					<%out.println("<h1>\"" + request.getParameter("sys_role") + "\" Users Details");%>
					<span class="my_back_button">
					    <a class="back_link" href="manage_system_roles.jsp">
						<button class="btn btn-primary" >
						    <span title=".icon32  .icon-white  .icon-arrowthick-w " class="icon icon-white icon-arrowthick-w">
						    </span>
						    <span>Back to "Manage System Roles"
						    </span>
						</button>
					    </a>
					</span>

					</h1>
				    </div>     
				    <div class="row-fluid ">            



					<div class="box span12">
					    <div class="box-header well" data-original-title>
						<%out.println("<h2>User List</h2>");%>
					    </div>
					    <div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable " id="users_roles">
						    <thead>
							<tr>
							    <th>Username</th>
							    <th>Name</th>
							    <th>Surname</th>
							    <th>Email</th>
							    <th>Date registered</th>
							    <th>Last Logged in</th>
							</tr>
						    </thead>   
						    <tbody>
							<%@ page import="entities.User" %>
							<%@ page import="DBcomm.UserComm" %>
							<% for (User c : UserComm.getRoleUsers((String) request.getParameter("sys_role"))) {%>
							<tr>
							    <td><%=c.getUsername()%></td>
							    <td class="center"><%=c.getName()%></td>
							    <td class="center"><%=c.getSurname()%></td>
							    <td class="center"><%=c.getEmail()%></td>
							    <td class="center"><%=c.getSignupDate()%></td>
							    <td class="center"><%=c.getLastloggedin()%></td>
							    <!--<td class="center">
								    <form style='display:inline' action="#" method="post">
									<input type="hidden" name="username" value="<%=c.getUsername()%>" />
							    <%/*if ( Integer.parseInt(usr_perm) > 0 ) 
								 out.println("<button type=\"submit\" "
								 +	"<a class=\"btn btn-sucess\" > "
								 +	    "<i class=\"icon-zoom-in icon-white\"></i> "
								 +	    "View Details "
								 +	"</a>"
								 +   "</button>");*/
							    %>
							    </form>
							    <form style='display:inline' action="#" method="post">
							    <input type="hidden" name="username" value="<%=c.getUsername()%>" />
							    <%/*if ( Integer.parseInt(usr_perm) == 2 ) 
								 out.println("<button type=\"submit\" "
								 +	"<a class=\"btn btn-info\" > "
								 +	    "<i class=\"icon-edit icon-white\"></i> "
								 +	    "Edit Role"
								 +	"</a>"
								 +   "</button>");*/
							    %>
							    </form>
							    <form style='display:inline' action="#" method="post">
								<input type="hidden" name="username" value="<%=c.getUsername()%>" />

							    <%/*if ( Integer.parseInt(usr_perm) == 2 ) 
								 out.println("<button type=\"submit\" "
								 +	"<a class=\"btn btn-danger\" > "
								 +	    "<i class=\"icon-trash icon-white\"></i> "
								 +	    "Delete Account"
								 +	"</a>"
								 +   "</button>");*/
							    %>
							    </form>
						    </td>-->
							</tr>
							<% }%>
						    </tbody>
						</table>            
					    </div>
					</div><!--/span-->					


				    </div><!--/row -->   
				</div> <!--box-content ends-->
			    </div> <!--box span12 ends-->
			</div> <!--gia row-fluid ends-->
			<!--main-content admin ends-->


		    </div>
		    <!--whole content ends (#content.span10)-->

		</div> 
		<!-- row-fluid gia left menu kai content ends-->

	    </div>
	    <!--row-fluid-->

	    <hr />

	    <%@include file="footer.jsp" %>

	</div>
	<!--container-fluid ends-->




	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery -->
	<script src="js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->


	<script src="nivo-slider/jquery.nivo.slider.js" type="text/javascript"></script>
	<script type="text/javascript">
	    $(window).load(function() {
		$('#slider').nivoSlider();
	    });
	</script>

	<!--<script src="scripts/jquery.js" type="text/javascript"></script>-->
        <script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
	<!--        <script src="js/ColumnFilterWidgets.js" type="text/javascript"></script>-->
        <script src="js/jquery.dataTables.rowGrouping.js" type="text/javascript"></script>
        <script type="text/javascript">
	    $(document).ready(function() {
		$("#users_roles").dataTable({
		    "sPaginationType": "full_numbers",
		    "bJQueryUI": true,
		    "sDom": 'W<"clear">lfrtip'
		});
	    });
        </script>


	<script src="js/ask_confirmation_action.js" type="text/javascript"></script>


	<script src="js/change_role_form.js" type="text/javascript"></script>


	<script src="js/jquery-ui-1.8.21.custom.min.js"></script>

	<!-- transition / effect library -->
	<script src="js/bootstrap-transition.js"></script>
	<!-- alert enhancer library -->
	<script src="js/bootstrap-alert.js"></script>
	<!-- modal / dialog library -->
	<script src="js/bootstrap-modal.js"></script>
	<!-- custom dropdown library -->
	<script src="js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="js/bootstrap-scrollspy.js"></script>
	<!-- library for creating tabs -->
	<script src="js/bootstrap-tab.js"></script>
	<!-- library for advanced tooltip -->
	<script src="js/bootstrap-tooltip.js"></script>
	<!-- popover effect library -->
	<script src="js/bootstrap-popover.js"></script>
	<!-- button enhancer library -->
	<script src="js/bootstrap-button.js"></script>
	<!-- accordion library (optional, not used in demo) -->
	<script src="js/bootstrap-collapse.js"></script>
	<!-- carousel slideshow library (optional, not used in demo) -->
	<script src="js/bootstrap-carousel.js"></script>
	<!-- autocomplete library -->
	<script src="js/bootstrap-typeahead.js"></script>
	<!-- tour library -->
	<script src="js/bootstrap-tour.js"></script>
	<!-- library for cookie management -->
	<script src="js/jquery.cookie.js"></script>
	<!-- calander plugin -->
	<script src="js/fullcalendar.min.js"></script>
	<!-- data table plugin -->
	<!--<script src="js/jquery.dataTables.min.js"></script>-->

	<!-- chart libraries start -->
	<script src="js/excanvas.js"></script>
	<script src="js/jquery.flot.min.js"></script>
	<script src="js/jquery.flot.pie.min.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.resize.min.js"></script>
	<!-- chart libraries end -->

	<!-- select or dropdown enhancer -->
	<script src="js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="js/jquery.uniform.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="js/jquery.colorbox.min.js"></script>
	<!-- rich text editor library -->
	<script src="js/jquery.cleditor.min.js"></script>
	<!-- notification plugin -->
	<script src="js/jquery.noty.js"></script>
	<!-- file manager library -->
	<script src="js/jquery.elfinder.min.js"></script>
	<!-- star rating plugin -->
	<script src="js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="js/charisma.js"></script>





    </body>
</html>