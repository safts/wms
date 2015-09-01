<%-- 
    Document   : index
    Created on : Apr 11, 2013, 11:10:26 AM
    Author     : katsikas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>

<%@page import="javax.naming.InitialContext"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Data in my Connection Pooled Database</h1>
        

        <%
        //    InitialContext initialContext = new InitialContext();
        //    Context context = (Context) initialContext.lookup("java:comp/env");
        //    //The JDBC Data source that we just created
        //    DataSource ds = (DataSource) context.lookup("javatest");
           Context context = new InitialContext();
           Context envctx = (Context)context.lookup("java:comp/env");
           DataSource ds = (DataSource) envctx.lookup("jdbc/testdata");

            
           Connection connection = ds.getConnection();

            if (connection == null)
            {
                throw new SQLException("Error establishing connection!");
            }
            
            Statement statement = null;
            ResultSet set = null;

            out.println("BLA");
            
            statement = connection.createStatement();
            set = statement.executeQuery("SELECT * FROM testdata");
            while (set.next()){
                out.println(set.getString("foo"));
            }
        %>
    </body>
</html>
