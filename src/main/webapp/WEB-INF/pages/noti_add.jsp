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
    </head>
    <body>
        <h1>Send notification</h1>
        <a href="home">Home</a>
        <c:if test="${empty param.username}">
            <br/>
            <a href="noti">View system notifications</a>
        </c:if>
        <form action="noti_add" method="POST">
            <table>
                <tr>
                    <td>For:</td>
                    <td>
                        <c:if test="${not empty param.username}">
                            <input type="hidden" name="username" value="${user.username}">
                            ${user.username}
                            (<font style="color: blue">
                            <c:out value="${user.lastName} ${user.firstName}"></c:out>
                                </font>)
                        </c:if>
                        <c:if test="${empty param.username}">
                            <font style="color: blue">USERS OF SYSTEM</font>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td>Title:</td>
                    <td><input type="text" name="title"></td>
                </tr>
                <tr>
                    <td>Content:</td>
                    <td><textarea rows="8" cols="60" name="content"></textarea></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Send" onclick="return confirm('Are you sure?');"></td>
                </tr>
                <c:if test="${not empty param.msg}">
                    <tr>
                        <td></td>
                        <td>
                            <pre>
            <font style="color: red">${param.msg}</font>
                            </pre>
                        </td>
                    </tr>
                </c:if>
            </table>
        </form>
    </body>
</html>
