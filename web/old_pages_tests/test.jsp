<%-- 
    Document   : test
    Created on : Aug 9, 2013, 7:13:19 PM
    Author     : Sergios
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="rs" dataSource="jdbc/testdata">
select id, foo, bar from testdata;

</sql:query>

<sql:update var="rs" dataSource="jdbc/testdata">
INSERT INTO testdata (id, foo, bar) VALUES (null,'megalo',4343)
</sql:update>

<sql:query var="rs" dataSource="jdbc/testdata">
select id, foo, bar from testdata
</sql:query>


<html>
  <head>
    <title>DB Test</title>
  </head>
  <body>

  <h2>Results</h2>

<c:forEach var="row" items="${rs.rows}">
    Foo ${row.foo}<br/>
    Bar ${row.bar}<br/>
</c:forEach>

  </body>
</html>
