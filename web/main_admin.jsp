<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

    <head>
	<meta charset="utf-8" />
	<title>Main logged in page</title>
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

    </head>


    <%

	// get attributes from the request
	String message = (String) session.getAttribute("username");

	// handle null values
	if (message == null) {
	    message = "";
	}
    %>

    <body>
	<%@include file="header.jsp" %> 
	<!-- topbar ends -->

	<div class="container-fluid">
	    <div class="row-fluid">


		<!--main menu starts-->
		 <%@ include file="main_menu.jsp" %>
		<!--main menu ends-->

		<div class="row-fluid"> <!--row-fluid gia left menu kai content-->
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
				    </ul>
				    <%@ page import="entities.User" %>
				    <%User user = (User) session.getAttribute("user");%>
				    <div class="page-header">
					<h1>Welcome! <small>(Last Logged in: <%=user.getLastloggedin()%>)</small></h1>
				    </div>     
				    <div class="row-fluid ">            
					<div class="box span6">
					    <div class="box-header well" data-original-title>
						<h2>Personal Account</h2>
					    </div>
					    <div class="box-content">
						<br/>
						<form class="form-horizontal" method="post" action="user_edit">
						    <!--fieldset for personal information--> 
						    <fieldset style="float:left;">

							<!--Name field-->
							<div class="control-group">
							    <label class="control-label" for="focusedInput" >Username:</label>
							    <div class="controls">
								<input id="focusedInput" class="input-xlarge focused" type="text" name="username" value=<%=user.getUsername() %> readonly="readonly"/>
							    </div>
							</div>

							<div class="control-group">
							    <label class="control-label font_change" for="focusedInput" >Password:</label>
							    <div class="controls">
								<input class="input-xlarge focused disabled_input" id="first_input" type="password" name="password" value=<%=user.getPassword() %> />
							    </div>
							</div>
							    
							<div class="control-group">
							    <label class="control-label font_change" for="focusedInput" >Name:</label>
							    <div class="controls">
								<input class="input-xlarge focused disabled_input" id="first_input" type="text" name="name" value=<%=user.getName() %> />
							    </div>
							</div>

							<!--Surname field-->
							<div class="control-group">
							    <label class="control-label font_change" for="focusedInput" >Surname:</label>
							    <div class="controls">
								<input class="input-xlarge focused disabled_input" id="first_input" type="text" name="surname" value=<%=user.getSurname() %> />
							    </div>
							</div>

							<!--Surname field-->
							<div class="control-group">
							    <label class="control-label font_change" for="focusedInput" >Email:</label>
							    <div class="controls">
								<input class="input-xlarge focused disabled_input" id="first_input" type="text" name="email" value=<%=user.getEmail() %> />
							    </div>
							</div>

							<!--Surname field-->
							<div class="control-group">
							    <label class="control-label" for="focusedInput" >Sign up Date:</label>
							    <div class="controls">
								<input id="focusedInput" class="input-xlarge focused" type="text" value=<%=user.getSignupDate()%> disabled="disabled"/>
							    </div>
							</div>

							<!--Surname field-->
							<div class="control-group">
							    <label class="control-label" for="focusedInput" >User Role:</label>
							    <div class="controls">
								<input id="focusedInput" class="input-xlarge focused" type="text" value=<%=user.getUserRole()%> disabled="disabled"/>
							    </div>
							</div>
							<div class="form-actions">
							    <button class="btn btn-primary" id= "submit_but" type="submit" style="box-shadow: 0px 2px 5px 2px grey;display:none;">Submit Changes </button>
							    <button class="btn" id="cancel_but" type="reset" style="box-shadow: 0px 2px 5px 2px grey;display:none;">Cancel</button>
							</div>
						    </fieldset>
						</form>
					    </div>
					</div><!--/span-->
					<div   class="span6" id="my_vertical_align_box">
					    <div style="margin-top: 10%; margin-right: 10%;">
						<button class="btn btn-large btn-info" id="edit_pers_info_but" type="submit" style="box-shadow: 0px 2px 5px 2px grey;">Edit Personal Information</button>
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

	<script src="js/jquery-ui-1.8.21.custom.min.js"></script>

	<script src="js/main_admin.js"></script>

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
	<script src="js/jquery.dataTables.min.js"></script>

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