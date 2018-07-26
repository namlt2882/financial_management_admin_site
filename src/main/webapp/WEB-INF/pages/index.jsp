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
        <link href="resource/custom.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body style="align-items: center">
        <div class="col-md-4 col-md-offset-4">
        <div id="login">
            <div class="container">
                <div id="login-row" class="row justify-content-center align-items-center">
                    <div id="login-column" class="col-md-6">
                        <div id="login-box" class="col-md-12">
                            <form id="login-form" class="form" action="login" method="POST">
                                <h3 class="text-center text-info">Login</h3>
                                <div class="form-group">
                                    <label for="username" class="text-info">Username</label><br>
                                    <input type="text" name="username" id="username" class="form-control" placeholder="Username">
                                </div>
                                <div class="form-group">
                                    <label for="password" class="text-info">Password</label><br>
                                    <input type="password" name="password" id="password" class="form-control" placeholder="Password">
                                </div>
                                <font style="color: red">${param.msg}</font>
                                <div class="form-group">
                                    <input type="submit" name="submit" class="btn btn-info btn-md" value="Login">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>
