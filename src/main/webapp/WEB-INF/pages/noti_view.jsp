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
        <a href="home">Home</a><br>
        <c:if test="${not empty param.oldUrl}"><a href="${param.oldUrl}">Back</a></c:if>
        <c:if test="${not empty param.id}">
            <table>
                <tr>
                    <td>TO:</td>
                    <td>
                        <c:if test="${not empty noti.user}">
                            <font style="color: blue">
                            <c:out value="${noti.user.lastName} ${user.firstName}"></c:out>
                                </font>
                        </c:if>
                        <c:if test="${empty noti.user}">
                            <font style="color: blue">USERS OF SYSTEM</font>               
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td>Title:</td>
                    <td>${noti.title}</td>
                </tr>
                <tr>
                    <td>Content:</td>
                    <td>${noti.content}</td>
                </tr>
            </table>
        </c:if>


    </body>
</html>
