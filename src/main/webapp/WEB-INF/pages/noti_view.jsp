<%-- 
    Document   : noti_add
    Created on : Jul 11, 2018, 2:51:47 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Send notification</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>

        <div class="container">
            <%@include file="header.jsp" %>
            
            <div class="container col-md-offset-3">
                <h1>Notification</h1>
            <c:if test="${not empty param.id}">
                <div class="container"><h3>TO:</h3>
                            <div class="well col-md-4">
                            <c:if test="${not empty noti.user}">
                                <font style="color: blue">
                                <c:out value="${noti.user.lastName} ${user.firstName}"></c:out>
                                    </font>
                            </c:if><c:if test="${empty noti.user}">
                                <font style="color: blue">USERS OF SYSTEM</font>               
                            </c:if>
                            </div>

                </div>
                <div class="container">
                    <h3>Title:</h3>
                    <div class="well col-md-4">${noti.title}</div>
                </div>
                <div class="container">
                    <h3>Content:</h3>
                    <div class="well col-md-4">${noti.content}</div>
                </div>
            </c:if>
            </div>
        </div>
    </body>
</html>
