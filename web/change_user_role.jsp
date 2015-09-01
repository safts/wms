					<%@ page import="entities.UsrRole" %>
					<%@ page import="DBcomm.UsrRoleComm" %>
					<%@ page import="entities.User" %>
					<%@ page import="DBcomm.UserComm" %>
					<% User c1 = UserComm.getConfUsers((String) request.getParameter("username")).get(0);%>

					<div   class="span6" id="my_vertical_align_box">
					    <div>
						<p style="font-weight: bold; font-size: 18px; color: ThreeDDarkShadow;">Actions :</p>         
					    </div>
					</div><!--/span-->


					<div class="span6" style="text-align: center; margin-top: 10px;">
						<br/>
						<div style="margin-left: 23%;">
							<span class=" my_change_role_button" style="float:left;" >
							<button class="btn btn-info" style="box-shadow: 2px 3px 2px grey;" >
							<i class="icon-edit icon-white"></i>  
							Edit User Role
							</button>
							</span>

							<span style="float:left; margin-left: 10px;">
								<form  action="index.jsp" method="post" >
								<input type="hidden" name="username" value="<%=c1.getUsername()%>" />
								<input type="hidden" name="where" value="2" />
								<!--<span class="btn btn-danger ask" style="box-shadow: 2px 3px 2px grey;" >
								<i class="icon-trash icon-white"></i> 
								Delete Account
								</span>-->
								<button type="submit" class="btn btn-danger ask"  style="box-shadow: 2px 3px 2px grey;" ><i class="icon-trash icon-white"></i>Delete Account</button>
							</form>
							</span>
						</div>
					</div><!--/span-->

					<div class="span6 well" id="my_change_role_form" style="text-align: center; margin-top: 10px;">

					    <form class="form-horizontal" action="user_edit_role" method="post" >
						<!--fieldset for personal information--> 
						<fieldset style="float:left;">

						    <div class="control-group">
							<label class="control-label">Current Role: </label>
							<div class="controls">
							    <span class="input-large uneditable-input" style="border:1px  solid #3399FF; -webkit-border-radius: 7px;
								  -moz-border-radius: 7px;border-radius: 7px;
								  box-shadow: 0px 0px 5px grey;"><%=c1.getUserRole()%>
							    </span>
							</div>
						    </div>

						    <div class="control-group">
							<label class="control-label" for="selectError">
							    <span>Change Role to:</span>
							</label>
							<input type="hidden" name="username" value="<%=c1.getUsername()%>" />
							
							<div class="controls" style="text-align:left;">
							    <select id="my_select_role" name ="role_sel" data-rel="chosen" >
								<option disabled="disabled" selected="">none</option>
								<%@ page import="entities.UsrRole" %>
								<%@ page import="DBcomm.UsrRoleComm" %>
								<% for (UsrRole ur : UsrRoleComm.getUserRoles(null)) {
									out.println("<option value=" + ur.getDescription() + ">" + ur.getDescription() + "</option>");
								    }
								%>
							    </select>
							</div>
						    </div>
						    <div style="padding-top:10px; padding-bottom:10px; margin-left:40%;">
							<button class="btn btn-info" id="my_submit_change_role" type="submit">Change</button>

							<button class="btn" id="my_cancel_change_role" style="border-top:1px #C0C0C0 solid;border-right:1px #C0C0C0 solid;border-left:1px #C0C0C0 solid;" >Cancel</button>
						    </div>
						</fieldset>
					    </form>

					    <div class="alert alert-error" id="my_error_change_role" >
						<button type="button" class="close" data-dismiss="alert">×</button>
						You didn't choose a new System Role! 
					    </div>				
					</div><!--/span-->