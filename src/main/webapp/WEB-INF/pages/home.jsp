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
        <a href="home">Home</a>
        <form action="home" method="GET">
            Search by username:<br/>
            <input type="text" name="username"/>
            <input type="submit" value="Search"/>
        </form>
        <a href="noti_add">Add new notification</a><br/>
        <a href="noti">View system notifications</a>
        <c:if test="${not empty users or not empty user}">
            <h3>Current user: ${numberOfUser}</h3>
            <table>
                <tr>
                    <th>No.</th>
                    <th>Username</th>
                    <th>Firstname</th>
                    <th>Lastname</th>
                    <th>Join date</th>
                    <th>Status</th>
                    <th></th>
                </tr>
                <c:if test="${not empty users}">
                    <c:set var="index" value="${(empty param.startPage) ? 0 : (param.startPage-1)*5}"/>
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <td>${index+1}
                                <c:set var="index" value="${index+1}"/>
                            </td>
                            <td>${user.username}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>${user.insertDate}</td>
                            <td>
                                ${user.status == 1?"<font style='color:green'>ENABLE</font>":"<font style='color:red'>DISABLE</font>"}
                            </td>
                            <td>
                                <form action="noti_add">
                                    <input type="hidden" name="username" value="${user.username}">
                                    <input type="submit" value="Send notification">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>

                </c:if>
                <c:if test="${not empty user}">
                    <tr>
                        <td>1</td>
                        <td>${user.username}</td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.insertDate}</td>
                        <td></td>
                    </tr>

                </c:if>
            </table>
            <c:if test="${not empty users}">
                <div>
                    Pages: 
                    <c:forEach begin="1" end="${pageQuantity}" varStatus="counter">
                        <a href="home?startPage=${counter.index}">${counter.index}</a>,
                    </c:forEach>
                </div>
            </c:if>
        </c:if>

    </body>
</html>
