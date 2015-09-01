<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Pending Registration</title>

</head>

<body style="margin-left:auto; margin-right:auto; padding-top:40px; text-align:center; height:200px; width:500px;">

<%
    // get attributes from the request
    String message = (String) request.getAttribute("message");

    // handle null values
    if (message == null) message = "";
%>
    
<div>
	An error has occurred. Find the description below:
</div>
        <p><i ><%= message %></i></p>

</body>

</html>
