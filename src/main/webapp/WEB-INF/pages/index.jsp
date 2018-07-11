<%-- 
    Document   : index
    Created on : Jul 2, 2018, 3:16:08 PM
    Author     : ltnam1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login</h1>
        <form action="login" method="POST">
            Username:
            <input type="text" name="username"/><br/>
            Password:
            <input type="password" name="password"/><br/>
            <input type="submit" value="Login"/>
            <font style="color: red">${param.msg}</font>
        </form>
        <a href="register">Register</a>
    </body>
</html>
