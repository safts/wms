<!-- topbar starts -->
<div class="navbar">
	<div class="navbar-inner">
		<div class="container-fluid">
			<a class="btn btn-navbar" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse" data-toggle="collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a>
			<a class="brand" href="index.jsp"> <img alt="Charisma Logo" src="img/logo20.png" /> <span>W M S</span></a>

			<!-- user dropdown starts -->
			<%session = request.getSession(false);%>

			<% if (session.getAttribute("username")!=null) { %>
			<div class="btn-group pull-right" >
				<a class="btn dropdown-toggle my_border_style" data-toggle="dropdown" href="#">
					<i class="icon-user"></i><span class="hidden-phone"> <%=session.getAttribute("username")%></span>
					<span class="caret"></span>
				</a>
				
				<ul class="dropdown-menu">
					
					<li><a href="main_admin.jsp">Profile</a></li>
					<li class="divider"></li>
					<form id="myForm" method="post" action="logout" >
					<li onclick="myForm.submit();" style="cursor: pointer;">
						<a>Logout</a>
					</li>
					<li class="divider"></li>
					</form>
				</ul>
				
			</div>
			<% }
				else {%>
				<!-- create account starts -->
				<div class=" pull-right">
					<a class="btn my_border_style" href="signup_form.jsp">
						<i><span class="icon-folder-close"></span>&nbsp;</i><span class="hidden-phone"> Create Account</span>
					</a>
				</div>
				<!-- create account ends -->
				<!-- user login starts -->
				<div class=" pull-right">
					<a class="btn btn-setting my_border_style" id="enable_modal_button"  href="#" > <!--btn-setting is for the modal... -->
						<i class="icon icon-black icon-key"></i>&nbsp;<span class="hidden-phone " > Login</span>
					</a>
				</div>
				<!-- user login ends -->
			<% } %>	
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