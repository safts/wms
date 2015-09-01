<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

    <head>
	<meta charset="utf-8" />
	<title>View Warehouse</title>
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
	<!--        <link href="media/dataTables/demo_page.css" rel="stylesheet" type="text/css" />
		<link href="media/dataTables/demo_table.css" rel="stylesheet" type="text/css" /> -->
        <link href="media/dataTables/demo_table_jui.css" rel="stylesheet" type="text/css" /> 
        <link href="media/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
        <link href="media/themes/smoothness/jquery-ui-1.7.2.custom.css" rel="stylesheet" type="text/css" media="all" />
        <link href="media/dataTables/ColumnFilterWidgets.css" rel="stylesheet" type="text/css" />

    </head>

    <body>
	<!-- topbar starts -->
	<%@include file="header.jsp" %>
	<!-- topbar ends -->

	<div class="container-fluid">
	    <div class="row-fluid">


		<!--main menu starts-->
		<%@include file="main_menu.jsp" %>
		<!--main menu ends-->

		<div class="row-fluid"> <!--row-fluid gia left menu kai content-->
		    <!-- left menu starts -->
		    <%@include file="left_menu.jsp" %>

		    <%@include file="no_script.jsp" %>

		    <!--whole content starts-->
		    <div id="content" class="span10" >

			<%@ page import="entities.Warehouse" %>
			<%@ page import="entities.Product" %>
			<%@ page import="DBcomm.WhComm" %>
			<%@ page import="java.util.LinkedList" %>
			<%@ page import="java.util.List" %>
			<%@ page import="java.util.ListIterator" %>

			<% Warehouse w = WhComm.getWh((String) request.getParameter("wh_name")).get(0);%>
			<%  int prod_n = (Integer) request.getAttribute("prod_n");
			%>
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
					    <span class="divider">/</span><a href="#">Manage Warehouses</a>
					</li>
					<li>
					    <span class="divider">/</span><a href="#">Warehouse Details</a>
					</li>

				    </ul>


				    <div class="page-header">
					<h1>Warehouse Details
					    <span class="my_back_button">
						<a class="back_link" href="manage_warehouses.jsp">
						    <button class="btn btn-primary" >
							<span title=".icon32  .icon-white  .icon-arrowthick-w " class="icon icon-white icon-arrowthick-w">
							</span>
							<span>Back to "Manage Warehouses"
							</span>
						    </button>
						</a>
					    </span>
					</h1>
				    </div>     
				    <div class="row-fluid ">            
					<div class="box span5" style="margin-top:10%;">
					    <div class="box-header well" data-original-title>
						<h2>Warehouse Information Table</h2>
					    </div>
					    <div class="box-content">
						<br/>
						<table class="table table-striped">
						    <tr>
							<td class="my_table_headers">Name :</td>
							<td ><%=w.getName()%></td>

						    </tr>
						    <tr>
							<td class="my_table_headers">Location :</td>
							<td ><%=w.getLocation()%></td>

						    </tr>
						    <tr>
							<td class="my_table_headers">Description :</td>
							<td ><%=w.getDescription()%></td>

						    </tr>
						    <tr>
							<td class="my_table_headers">Is open :</td>
							<td ><%=w.isIsOpen()%></td>                                        
						    </tr>
						    <tr>
							<td class="my_table_headers">Total Products :</td>
							<td ><%=prod_n%></td>                                        
						    </tr>
						</table>



					    </div>
					</div><!--/span-->



					<div class="box span7">
					    <div class="box-header well" data-original-title>
						<h2>Products kept in the Warehouse</h2>
					    </div>
					    <div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable" id="warehouse" >
						    <thead>
							<tr>
							    <th>Name</th>
							    <th>Serial Number</th>
							    <th>Description</th>
							    <th>Amount</th>
							</tr>
						    </thead>   
						    <tbody>

							<%List<Product> products = (List) request.getAttribute("products");
							    List<Integer> quantities = (List) request.getAttribute("quantities");
							    ListIterator itr = products.listIterator();
							    int n = 0;%>
							<% while (itr.hasNext()) {
								Product pr = (Product) itr.next();
								n++;
							%>
							<tr>
							    <td><%=pr.getName()%></td>
							    <td class="center"><%=pr.getSerialN()%></td>
							    <td class="center"><%=pr.getDescr()%></td>
							    <td><%=quantities.get(n - 1)%></td>
							</tr>

							<%}%>
						    </tbody>
						</table>
					    </div>
					</div><!--/span-->


					<div class="box span7">
					    <div class="box-header well" data-original-title>
						<h2>Warehouse history</h2>
					    </div>
					    <div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable">
						    <thead>
							<tr>
							    <th>Product Name</th>
							    <th>Product Serial</th>
							    <th>Quantity</th>
							    <th>Date</th>
							    <th>Action</th>
							</tr>
						    </thead>   
						    <tbody>
							<%@ page import="entities.WhHistory" %>
							<%@ page import="DBcomm.WhHistComm" %>
							<% for (WhHistory h : WhHistComm.getWhHist(w.getName(), "no")) {%>
							<tr>
							    <td><%=h.getPr_name()%></td>
							    <td class="center"><%=h.getPr_s_n()%></td>
							    <td class="center"><%=h.getQuantity()%></td>
							    <td class="center"><%=h.getDate()%></td>
							    <td class="center"><%=h.getType()%></td>
							</tr>
							<%}%>
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
        <script src="js/ColumnFilterWidgets.js" type="text/javascript"></script>
        <script src="js/jquery.dataTables.rowGrouping.js" type="text/javascript"></script>
        <script type="text/javascript">
	    $(document).ready(function() {
		$("#warehouse").dataTable({
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
