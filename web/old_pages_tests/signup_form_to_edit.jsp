<!DOCTYPE html>
<html lang="en">
<head>
	<!--
		Charisma v1.0.0

		Copyright 2012 Muhammad Usman
		Licensed under the Apache License v2.0
		http://www.apache.org/licenses/LICENSE-2.0

		http://usman.it
		http://twitter.com/halalit_usman
	-->
	<meta charset="utf-8">
	<title>Free HTML5 Bootstrap Admin Template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
	<meta name="author" content="Muhammad Usman">

	<!-- The styles -->
	<link id="bs-css" href="css/bootstrap-united.css" rel="stylesheet">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
	<link href="css/bootstrap-responsive.css" rel="stylesheet">
	<link href="css/charisma-app.css" rel="stylesheet">
	<link href="css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<link href='css/fullcalendar.css' rel='stylesheet'>
	<link href='css/fullcalendar.print.css' rel='stylesheet'  media='print'>
	<link href='css/chosen.css' rel='stylesheet'>
	<link href='css/uniform.default.css' rel='stylesheet'>
	<link href='css/colorbox.css' rel='stylesheet'>
	<link href='css/jquery.cleditor.css' rel='stylesheet'>
	<link href='css/jquery.noty.css' rel='stylesheet'>
	<link href='css/noty_theme_default.css' rel='stylesheet'>
	<link href='css/elfinder.min.css' rel='stylesheet'>
	<link href='css/elfinder.theme.css' rel='stylesheet'>
	<link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
	<link href='css/opa-icons.css' rel='stylesheet'>
	<link href='css/uploadify.css' rel='stylesheet'>
	
	
	<link href="css/my_css.css" rel='stylesheet'>

	
<%@ page import="entities.User" %>
<%
    // get attributes from the request
    User user = (User) request.getAttribute("user");
    String message = (String) request.getAttribute("message");

    // handle null values
    if (user == null) user = new User();
    if (message == null) message = "";
%>
	
	
	
	<!--MY LINKS FOR jQuery SLIDER-->
	
	
	<link rel="stylesheet" href="nivo-slider/themes/default/default.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="nivo-slider/themes/light/light.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="nivo-slider/themes/dark/dark.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="nivo-slider/themes/bar/bar.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="nivo-slider/nivo-slider.css" type="text/css" media="screen" />
    <!-- <link rel="stylesheet" href="nivo-slider/demo/style.css" type="text/css" media="screen" /> -->
	<!--END OF LINKS FOR jQuery SLIDER-->

	
	

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- The fav icon -->
	<link rel="shortcut icon" href="img/favicon.ico">
	

		
</head>

<body>
		

		<!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="index.html"> <img alt="Charisma Logo" src="img/logo20.png" /> <span>W M S</span></a>
				
				
				
				<!-- theme selector starts -->
				<div class="btn-group pull-right theme-container" >
					<a class="btn" href= "#" >
						<i><span class="icon-folder-close" ></span>&nbsp;</i><span class="hidden-phone"> Create Account</span>
					</a>
				</div>
				<!-- theme selector ends -->

				
				
				
				
				<!-- user dropdown starts -->
				<div class="btn-group pull-right" >
					<a class="btn btn-setting" href="#">
						<i class="icon icon-black icon-key"></i>&nbsp;<span class="hidden-phone "> Login</span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">Profile</a></li>
						<li class="divider"></li>
						<li><a href="login.html">Logout</a></li>
					</ul>
				</div>
				<!-- user dropdown ends -->
				
				<div class="top-nav nav-collapse">
					<ul class="nav">
						<li>
							<form class="navbar-search pull-left">
								<span>Search Site &raquo;</span>
								<input placeholder="Search" class="search-query span2" name="query" type="text">
							</form>
						</li>
					</ul>
				</div><!--/.nav-collapse -->

				

				
			</div>
		</div>
	</div>
	<!-- topbar ends -->
		<div class="container-fluid">
		<div class="row-fluid">
				
			
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<div id="content" style="width: 82.87292817100001%; *width: 82.8197366816383%; margin-left:auto; margin-right:auto;">
			<!--  APOPANW EIXE : class="span10",  KAI DEN EIXE TO STYLE POU EVALA EGW! -->
			<!-- content starts -->
			
			

						<div>
				<div class=" navbar container-fluid" style="padding: 7px 14px;
  margin: 0 0 18px;
  list-style: none;
<!--background-color: #fbfbfb;-->
    background-repeat: repeat-x;
	border: 1px solid #ddd;
	border-left-width:0px;
	border-right-width:0px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	-webkit-box-shadow: inset 0 1px 0 #ffffff;
	-moz-box-shadow: inset 0 1px 0 #ffffff;
	box-shadow: 0 1px 0 #ffffff inset;
	background-image: linear-gradient(top, #ffffff, #f5f5f5);
">
					<div class="top-nav ">
						<!-- <div style="float:left; color:black;"> <h2>WAREHOUSE MANAGEMENT SYSTEM</h2></div> -->
						<ul class="nav">
							<li style="margin-right:50px;"><a href="#">About WM Systems</a></li>
							<li style="margin-right:50px;"><a href="#">About Us</a></li>
							<li><a href="#">Contact</a></li>


						</ul>
					</div><!--/.nav-collapse -->
				</div>
				<hr/>
				</div>


			



			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-picture"></i>Create Account</h2>
											</div>
					<div class="box-content">
					<ul class="breadcrumb">
					<li>
						<span class="divider"><i>Current:</i> </span><a href= "index.html">Home</a>
					</li>
					<li>
						<span class="divider">/</span><a href= "#">Create Account</a>
					</li>
				</ul>
				
				
								
				
				
				
					<form class="form-horizontal" action="register" method="post">
						
							<fieldset style="float:left;">
							<legend class=" my_legend">Personal Information <i style="color:red; font-size:13px;"> ( Notice: All fields are required )</i></legend>
	                            <div class="control-group">
									<label class="control-label" for="focusedInput">Name</label>
									<div class="controls">
									  <input class="input-xlarge focused" id="focusedInput" type="text" name="name" value="<%= user.getName() %>">
									</div>
								</div>
							
	                            <div class="control-group">
									<label class="control-label" for="focusedInput">Surname</label>
									<div class="controls">
									  <input class="input-xlarge focused" id="focusedInput" type="text" >
									</div>
								</div>
							  
								<div class="control-group">
									<label class="control-label" for="focusedInput">Username</label>
									<div class="controls">
										<input class="input-xlarge focused" id="focusedInput" type="text" >
									</div>
							 	</div>
							  
                              	<div class="control-group">
									<label class="control-label" for="focusedInput">Password</label>
									<div class="controls">
								  		<input class="input-xlarge focused" id="focusedInput" type="password" />
								  		<span style=" color:red;">&nbsp;*</span>
									</div>
							  	</div>
							  
                              	<div class="control-group">
									<label class="control-label" for="focusedInput">Confirm Password</label>
									<div class="controls">
								  		<input class="input-xlarge focused" id="focusedInput" type="password" >
								  		<span style=" color:red;">&nbsp;*</span>
									</div>
							  	</div>
							  
                              	<div class="control-group">
									<label class="control-label" for="focusedInput">Email address</label>
									<div class="controls">
								  		<input class="input-xlarge focused" id="focusedInput" type="email" >
									</div>
							  	</div>
							  
	                              <div class="control-group">
										<label class="control-label" for="selectError"><span style="color: #0000FF;">Choose your<br/>System Role:</span></label> <br/>										<div class="controls">
									  		<select name="selectRole" id="selectRole" data-rel="chosen">
									  			<option selected >none</option>
												<option >Warehouse Administrator</option>
												<option >Product Supplier</option>
												<option>Warehouse Employee</option>
												
									  		</select>
										</div>
								  </div>								  
								  
								  
                              	<div class="control-group">
								<label class="control-label" for="selectError">System Role</label>
								<div class="controls">
								  <select id="selectRole" data-rel="chosen">
									<option>Warehouse Administrator</option>
									<option>Product Supplier</option>
									<option>Warehouse Employee</option>
								  </select>
								</div>
							  </div>

                              
                              
                              
                              <div class="control-group">
								<label class="control-label" for="selectError">System Role</label>
								<div class="controls">
								  <select class="chzn-done" style="display: none;" id="selectRole" data-rel="chosen">
									<option>Warehouse Administrator</option>
									<option>Product Supplier</option>
									<option>Warehouse Employee</option>
								  </select>
								  <div style="width: 220px;" class="chzn-container chzn-container-single" id="selectRole_chzn">
								  <a tabindex="0" href="javascript:void(0)" class="chzn-single">
								  <span>
								  Warehouse Administrator
								  </span>
								  <div>
								  <b></b>
								  </div>
								  </a>
								  <div class="chzn-drop" style="left: -9000px; width: 218px; top: 24px;">
								  <div class="chzn-search">
								  <input tabindex="-1" style="width: 183px;" autocomplete="off" type="text">
								  </div>
								  <ul class="chzn-results">
								  <li id="selectRole_chzn_o_0" class="active-result result-selected" style="">Warehouse Administrator</li>
								  <li id="selectRole_chzn_o_1" class="active-result" style="">Product Supplier</li>
								  <li id="selectRole_chzn_o_2" class="active-result" style="">Warehouse Employee</li>
								  </ul>
								  </div>
								  </div>
								</div>
							  </div>
                              
                              
                              
                              
                              
                              
                              
                              
                              
								<div class="control-group">
								<label class="control-label">Checkboxes</label>
								<div class="controls">
									<label class="checkbox">
										<div id="uniform-inlineCheckbox1" class="checker">
											<div id="uniform-inlineCheckbox1" class="checker">
												<span>
													<input id="inlineCheckbox1" type="checkbox" style="opacity: 0;" value="option1"/>
												</span>
											</div>
										</div>
       								Confirm personal data
    								</label>
    								
    								
    								<label class="checkbox">
										<div id="uniform-inlineCheckbox2" class="checker">
											<div id="uniform-inlineCheckbox2" class="checker">
												<span>
													<input id="inlineCheckbox2" type="checkbox" style="opacity: 0;" value="option2"/>
												</span>
											</div>
										</div>
       								Accept <a href="#" > terms & conditions </a>
    								</label>
								</div>
							  </div>










                      
                       		</fieldset>                               
                              
                            <fieldset style="float:right; clear:right; font-style: italic;">
                            <legend class=" my_legend"><span style=" color:#0000FF;">System Role:</span>&nbsp;&nbsp;Warehouse Administrator/Product Supplier</legend>
                    		
								<div class="control-group">
									<label class="control-label"  for="focusedInput">Company name</label>
									<div class="controls">
								  		<input  class="input-xlarge focused " id="focusedInput" type="text" disabled="" placeholder="Disabled">
									</div>
							  	</div>
							
                              	<div class="control-group">
									<label class="control-label" for="focusedInput">Address</label>
									<div class="controls">
										<input  class="input-xlarge focused" id="focusedInput" type="text" disabled="" placeholder="Disabled">
									</div>
							  	</div>
							  
                              	<div class="control-group">
									<label class="control-label" for="focusedInput">Phone number</label>
									<div class="controls">
								  		<input  class="input-xlarge focused" id="focusedInput" type="text" disabled="" placeholder="Disabled">
									</div>
							  	</div>
 							  	
							  	<div class="control-group">
									<label class="control-label" for="focusedInput">National Insurance Number</label>
									<div class="controls">
									  	<input  class="input-xlarge disabled" type="text" disabled="" placeholder="Disabled"/>
									</div>
							  	</div>

							  	
                             
                       		</fieldset>  

                          	<fieldset style="float:right; clear:right; margin-top:20px; font-style: italic;">
                          	<legend class=" my_legend"><span style="color: #0000FF;">System Role:</span>&nbsp;&nbsp;Warehouse Employee</legend>
                              
	                          		<div class="control-group">
										<label class="control-label" for="focusedInput">Confirmation ID</label>
										<div class="controls">
									  		<input class="input-xlarge focused" id="focusedInput" type="password" disabled="" placeholder="Disabled">
										</div>
								  	</div>
	                              
								  
	                              	<div class="control-group">
										<label class="control-label" for="selectError">Warehouse</label>
										<div class="controls" id="my_select_option">
									  		<select id="selectError" data-rel="chosen" disabled>
									  			<option selected disabled>none</option>
												<option>Warehouse Administrator</option>
												<option>Product Supplier</option>
												<option>Warehouse Employee</option>
									  		</select>
										</div>
								  	</div>
							</fieldset>
							<fieldset style=" margin-left: 470px; float:left; display:block;  clear:both;">	
							  	<div style="padding-top:10px; padding-bottom:10px;">
									<button type="submit" class="btn btn-primary">Submit</button>
									<button class="btn">Cancel</button>
							  	</div>
							  	
							</fieldset>
						  </form>
				
			</div>

					</div>
				</div><!--/span-->
			
			</div><!--/row-->

    
					<!-- content ends -->
			</div><!--/#content.span10-->
				</div><!--/fluid-row-->
				
		<hr>


		<div class=" modal hide fade" id="myModal">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span class="icon"/>x</button>
				<h3>Login</h3>
			</div>
			
			<div class="modal-body">
				<div class="well span5 center login-box">
					<div class="alert alert-info">
						Please login with your Username and Password.
					</div>
					
					<form class="form-horizontal" action="index.html" method="post">
						<fieldset>
							<div class="input-prepend" title="Username" data-rel="tooltip">
								<span class="add-on"><i class="icon-user"></i></span><input autofocus class="input-large" name="username" id="username" type="text" value="admin" />
							</div>
							<div class="clearfix"></div>

							<div class="input-prepend" title="Password" data-rel="tooltip">
								<span class="add-on"><i class="icon-lock"></i></span><input class="input-large" name="password" id="password" type="password" value="admin123456" />
							</div>
							<div class="clearfix"></div>

							<div class="input-prepend">
							<label class="remember" for="remember"><input type="checkbox" id="remember" />Remember me</label>
							</div>
							<div class="clearfix"></div>

							<p class="center row-fluid span5">
							<button type="submit" class="btn btn-primary">Login</button>
							</p>
						</fieldset>
					</form>
				</div><!--/span-->
				
			</div>	<!--modal-body-->
			
			
		</div><!--/row-->



<footer>
			<p class="pull-left">&copy; <a href="#" target="_blank">Spirou Panagiotis</a>, <a href="#" target="_blank">Aftsidis Sergios</a> 2013</p>
			<p class="pull-right" style="font-size:10px;">Powered by: <a href="#" >Charisma</a></p>
		</footer>

<!--MY LINKS FOR jQuery SLIDER-->

	<!--<script type="text/javascript" src= "nivo-slider/demo/scripts/jquery-1.9.0.min.js" ></script>
    <script type="text/javascript" src= "nivo-slider/jquery.nivo.slider.js"></script>
    <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>-->

<!--END OF LINKS FOR jQuery SLIDER-->


	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery -->
	<script src="js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	
	
	<script type="text/javascript" src= "nivo-slider/jquery.nivo.slider.js"></script>
    <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>


	
	
	
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
	<script src='js/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='js/jquery.dataTables.min.js'></script>

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
