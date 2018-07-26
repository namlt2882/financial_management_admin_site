<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="myform" action="logout" method="POST">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="home">Home</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="noti_add">Add notification</a></li>
      <li><a href="noti">View notifications</a></li>
    </ul>
      <ul class="nav navbar-nav navbar-right">
                <li><a href="#" onclick="document.getElementById('myform').submit()"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
            </ul>
  </div>
</nav>
</form>
