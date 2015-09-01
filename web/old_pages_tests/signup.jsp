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

<h1>Join our database</h1>
<p>To join our email list, enter your name and
 email address below. <br>
 Then, click on the Submit button.</p>

<p><i ><%= message %></i></p>

<form action="register" method="post">
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
<tr><td><input type="checkbox" name="insDB" value="true">Insert into DB<br></td>
</tr>
<tr>
 
  <td><br><input type="button" value="Submit"
        onClick="validate(this.form);"></td>
</tr>

</table>
 
</form>

<%@ include file="/includes/footer.jsp" %>