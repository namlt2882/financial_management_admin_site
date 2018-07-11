<%-- 
    Document   : home
    Created on : Jul 2, 2018, 3:18:25 PM
    Author     : ltnam1
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <h1>Welcome</h1>
        <form action="logout" method="POST">
            <input type="submit" value="Logout">
        </form>
        <form action="home" method="GET">
            Search album:<br/>
            <input type="text" name="value"/>
            <input type="submit" value="Search"/>
        </form>
        <a href="cart">My cart</a>
    </body>
</html>
