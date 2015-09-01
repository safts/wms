
<div id="myModal" class=" modal hide fade">
    <div class="modal-header">
	<button class="close" data-dismiss="modal" type="button"><span class="icon">x</span></button>
	<h3>Login</h3>
    </div>

    <div class="modal-body">
	<div class="well span5 center login-box">
	    <div class="alert alert-block" style="color: rgb(129, 123, 88); background-color: rgb(237, 235, 225); border-color: rgb(224, 217, 203);">
		<p>Please login with your Username and Password.</p>
	    </div>
	    <% if (request.getAttribute("message") != null && request.getAttribute("message")!="ok" && 
		    request.getAttribute("message") != "pend") {%>
		<div class="alert alert-info">
		    <%if (request.getAttribute("message") == "Username not found in the database") {%>	
			Wrong Username!
		    <%}%>
		    <%if (request.getAttribute("message") == "Wrong password") {%>	
			Wrong Password!
		    <%}%>
		    <%//if (request.getAttribute("message") == "pend") {%>	
			<!--Your registration is pending. Please check back in a few days or contact the system
			administrator for more details.-->
		    <%//}%>
		</div>
	    <%}%>
	    <form action="login" class="form-horizontal" method="post">
		<fieldset>
		    <div class="input-prepend" data-rel="tooltip" title="Username">
			<span class="add-on"><i class="icon-user"></i></span><input id="username" class="input-large" name="username" type="text" value="" autofocus/>

		    </div>
		    <div class="clearfix"></div>

		    <div class="input-prepend" data-rel="tooltip" title="Password">
			<span class="add-on"><i class="icon-lock"></i></span><input id="password" class="input-large" name="password" type="password" value=""/>
		    </div>
		    <div class="clearfix"></div>

							<p class="center row-fluid span5">
								<button class="btn btn-primary" type="submit">Login</button>
							</p>
						</fieldset>
					</form>
				</div><!--/span-->
			</div>	<!--modal-body-->
		</div><!--my modal ends-->
		
		
		
		
		<div id="myModal3" class=" modal hide fade">
			<div class="modal-header">
				<button class="close" data-dismiss="modal" type="button"><span class="icon">x</span></button>
				<%if (request.getAttribute("message") == "pend"){%>
				<h3><p>Registration Pending</p></h3>
				<%}%>
				<%if (request.getAttribute("message") == "expired") {%>
				<p>Session Expired</p>
				<%}%>
				<%if (request.getAttribute("message") == "we") {%>
				<p>The email address you entered already exists in our database.</p>
				<%}%>
				<%if (request.getAttribute("message") == "wu") {%>
				<p>The username you entered already exists in our database.</p>
				<%}%>
				<!--<h3>Session Expired</h3>-->
			</div>
			<div class="modal-body">
				<div class="well span5 center login-box alert alert-info" style="text-align:left;">
				    <%if (request.getAttribute("message") == "pend") {%>	
				    <p>Your registration is pending. Please check back in a few days or contact the system
					administrator for more details.</p>
				    <%}%>
				    <%if (request.getAttribute("message") == "expired") {%>
				    <p>Your session has expired. You are not logged in anymore. Please login again.</p>
				    <%}%>
				    <%if (request.getAttribute("message") == "we") {%>
				    <p>The email address you entered already exists in our database.</p>
				    <%}%>
				    <%if (request.getAttribute("message") == "wu") {%>
				    <p>The username you entered already exists in our database.</p>
				    <%}%>
				</div><!--/span-->
			</div>	<!--modal-body-->
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">Close</a>
			</div>
		</div><!--my modal ends-->
