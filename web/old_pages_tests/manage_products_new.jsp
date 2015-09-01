<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta charset="utf-8" />
	<title>Manage Products</title>
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

<body>
	<!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse" data-toggle="collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="index.html"> <img alt="Charisma Logo" src="img/logo20.png" /> <span>W M S</span></a>
				
				<!-- user dropdown starts -->
				<div class="btn-group pull-right" >
					<a class="btn dropdown-toggle my_border_style" data-toggle="dropdown" href="#">
						<i class="icon-user"></i><span class="hidden-phone"> administrator</span>
						<span class="caret"></span>
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
								<input class="search-query span2" name="query" placeholder="Search" type="text" />
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

			
			<!--main menu starts-->
			<div class="row-fluid">
				<div style="width: 82.87292817100001%; *width: 82.8197366816383%; margin-left:auto; margin-right:auto;">
					<div class=" navbar container-fluid" style="padding: 7px 14px;margin: 0 0 18px;list-style: none;&lt;!--background-color: #fbfbfb;--&gt;
		    			background-repeat: repeat-x;border: 1px solid #ddd;border-left-width:0px;border-right-width:0px;-webkit-border-radius: 3px;
						-moz-border-radius: 3px;border-radius: 3px;-webkit-box-shadow: inset 0 1px 0 #ffffff;-moz-box-shadow: inset 0 1px 0 #ffffff;
						box-shadow: 0 1px 0 #ffffff inset;background-image: linear-gradient(top, #ffffff, #f5f5f5);">
					
						<div class="top-nav ">
							<!-- <div style="float:left; color:black;"> <h2>WAREHOUSE MANAGEMENT SYSTEM</h2></div> -->
							<ul class="nav" >
								<li style="margin-right:50px;"><a href="#">About WM Systems</a></li>
								<li style="margin-right:50px;"><a href="#">About Us</a></li>
								<li><a href="#">Contact</a></li>
							</ul>
						</div><!--/.nav-collapse -->
					</div>
					<hr />
				</div>
			</div>
			<!--main menu ends-->
			
			<div class="row-fluid"> <!--row-fluid gia left menu kai content-->
				<!-- left menu starts -->
				<div class="span2 main-menu-span" style="margin-top:10px;">
					<div class="well nav-collapse sidebar-nav">
						<ul class="nav nav-tabs nav-stacked main-menu">
							<li class="nav-header hidden-tablet">System</li>
							<li><a href="#" ><span class="hidden-tablet"> Manage Accounts</span></a></li>
							<li><a href="#" ><span class="hidden-tablet"> Manage System Roles</span></a></li>
							<li><a href="#" ><span class="hidden-tablet"> Manage Warehouses</span></a></li>
							<li><a href="#" ><span class="hidden-tablet"> Manage Suppliers</span></a></li>
							<li><a href="#" ><span class="hidden-tablet"> Manage Products</span></a></li>
							<li><a href="#" ><span class="hidden-tablet"> Manage Warehouse Administrators</span></a></li>
							<li><a href="#" ><span class="hidden-tablet"> Manage Warehouse Employees</span></a></li>
						</ul>
					</div><!--/.well -->
				</div><!--/span-->
				<!-- left menu ends -->
			
				<noscript>
					<div class="alert alert-block span10">
						<h4 class="alert-heading">Warning!</h4>
						<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
					</div>
				</noscript>
			
				<!--whole content starts-->
				<div id="content" class="span10" >
					
					
					<!--main-content admin starts-->
					<div class="row-fluid">
						<div class="box span12">
							<div class="box-header well" data-original-title="">
								<h2><i><span class="icon-user"></span>&nbsp;</i>System Administrator</h2>
							</div>
							
							<div class="box-content">
								<ul class="breadcrumb">
									<li>
										<span class="divider"><i>Current:</i> </span><a href="#">System Administrator</a>
									</li>
									<li>
										<span class="divider">/</span><a href="#">Manage Products</a>
									</li>

								</ul>
								
												
								<div class="page-header">
									 <h1>Manage Products
									 	<span class="my_back_button"><button class="btn btn-primary"><span title=".icon32  .icon-white  .icon-arrowthick-w " class="icon icon-white icon-arrowthick-w"></span><span>Back to "System Administrator"</span></button></span>

									 </h1>
								</div>     
								<div class="row-fluid ">            
										
														
																
									<div class="box span12">
										<div class="box-header well" data-original-title>
											<h2>Products List</h2>
										</div>
										<div class="box-content">
											<table class="table table-striped table-bordered bootstrap-datatable datatable">
											  <thead>
												  <tr>
													  <th >Name</th>
													  <th style="width:98px;">Serial Number</th>
													  <th>Description</th>
													  <th>Category</th>
													  <th >Actions</th>
												  </tr>
											  </thead>   
											  <tbody>
												<tr>
													<td>Gala nounou</td>
													<td class="center">12876-23</td>
													<td class="center">Gala plhres 4.5%</td>
													<td class="center">Milk</td>
													<td class="center">
														<button class="btn btn-success" type="submit" >
															<a style="color:#FFFFFF;" > 
																<i class="icon-zoom-in icon-white"></i> 
																View Details
															</a>
														</button>
														<button class="btn btn-info" type="submit" >
															<a style="color:#FFFFFF;" > 
																<i class="icon-edit icon-white"></i> 
																Edit
															</a>
														</button>
														<button class="btn btn-danger" type="submit" >
															<a style="color:#FFFFFF;" > 
																<i class="icon-remove icon-white"></i> 
																Remove from
															</a>
														</button>
														<button class="btn btn-primary" type="submit" >
															<a style="color:#FFFFFF;" > 
																<i class="icon-share-alt icon-white"></i> 
																Move to
															</a>
														</button>
													</td>
												</tr>
												
												
												<form action="create_new_product.html"> 
												
 
												<tr>
													<td>Koulourakia Carrefour</td>
													<td class="center">77362-87</td>
													<td class="center">Olikhs Alesews</td>
													<td class="center">Koulourakia</td>
													<td class="center">
														<button class="btn btn-success" type="submit" >
															<a style="color:#FFFFFF;" > 
																<i class="icon-zoom-in icon-white"></i> 
																View Details
															</a>
														</button>
														<button class="btn btn-info" type="submit" >
															<a style="color:#FFFFFF;" > 
																<i class="icon-edit icon-white"></i> 
																Edit
															</a>
														</button>  
														<button class="btn btn-danger" type="submit" >
															<a style="color:#FFFFFF;" > 
																<i class="icon-remove icon-white"></i> 
																Remove from
															</a>
														</button>
														<button class="btn btn-primary" type="submit" >
															<a style="color:#FFFFFF;" > 
																<i class="icon-share-alt icon-white"></i> 
																Move to
															</a>
														</button>														
													</td>
												</tr>
												
												</form>  							
												
											  </tbody>
										  </table>
										  <div style="float:left;">
										  <a class="btn btn-danger" href="#" style="padding:6px 10px 6px 10px;">
											<span class="icon icon-white icon-add"></span> 
											<span>Create New Product</span>
										  </a>
										  </div>
										  <br/>
										  <br/>       
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
				
		<footer>
			<p class="pull-left">&copy; <a href="#" target="_blank">Spirou Panagiotis</a>, <a href="#" target="_blank">Aftsidis Sergios</a> 2013</p>
			<p class="pull-right" style="font-size:10px;">Powered by: <a href="#">Charisma</a></p>
		</footer>

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