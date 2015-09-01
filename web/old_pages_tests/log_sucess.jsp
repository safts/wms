<%@ include file="/includes/header.html" %>

<%@ page import="entities.User" %>
<%
    // get attributes from the request
    User user = (User) request.getAttribute("user");
    String message = (String) request.getAttribute("message");

    // handle null values
    if (user == null) user = new User();
    if (message == null) message = "";
%>
        <h1>Successfully Logged In!</h1>
<table cellspacing="5" cellpadding="5" border="1">
    <tr><td align="right">First name:</td>
        <td><%= user.getName() %></td>
    </tr>
    <tr><td align="right">Password:</td>
        <td><%= user.getPassword() %></td>
    </tr>
   
</table>
   
    <%@ include file="/includes/footer.jsp" %>