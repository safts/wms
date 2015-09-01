<%@ include file="/includes/header.html" %>

<script language="JavaScript">
function validate(form)
{
    
    if (form.name.value=="") 
    {
        alert("Please fill in your first name");
        form.name.focus();
    }
    else if (form.password.value=="")
    {
        alert("Please fill in your password");
        form.password.focus();
    }
    else
    {
        form.submit();
    }
}
</script>

<%@ page import="entities.User" %>
<%
    // get attributes from the request
    User user = (User) request.getAttribute("user");
    String message = (String) request.getAttribute("message");

    // handle null values
    if (user == null) user = new User();
    if (message == null) message = "";
%>

<h1>Welcome</h1>
<p>To login to our database , enter your name and
password below. <br>
 Then, click on the Submit button.</p>

<p><i ><%= message %></i></p>

<form action="login" method="post">
<table cellspacing="5" border="0">
<tr>
  <td align="right">Username:</td>
  <td><input type="text" name="name" 
        value="<%= user.getName() %>"></td>
</tr>
<tr>
  <td align="right">Password:</td>
  <td><input type="password" name="password" 
        value="<%= user.getPassword() %>"> *Must be numeric</td> 
</tr>
 
  <td><br><input type="button" value="Submit"
        onClick="validate(this.form);"></td>
</tr>

</table>
 
</form>

<%@ include file="/includes/footer.jsp" %>