<%-- 
    Document   : noti
    Created on : Jul 11, 2018, 2:51:26 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notification</title>
        <script>
            var a = "http://" + window.location.host + window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
        </script>
    </head>
    <body>
        <h1>Notification</h1>
        <form action="logout" method="POST">
            <input type="submit" value="Logout">
        </form>
        <a href="noti_add">Add new system notification</a><br/>
        <a href="home">Home</a><br>
        <form method="GET" action="noti">
            <h3>Search</h3>
            <input type="text" name="username" placeholder="username">
            <button>Search</button>
        </form>
        <input type="radio" <c:if test="${param.isSystemNotification == true}">checked="checked"</c:if> onclick="window.location.href = a + '/noti?isFilter=true&isSystemNotification=true'"> System
        <input type="radio" <c:if test="${param.isSystemNotification == false}">checked="checked"</c:if> onclick="window.location.href = a + '/noti?isFilter=true&isSystemNotification=false'"> User
        <input type="radio" <c:if test="${empty param.isSystemNotification}">checked="checked"</c:if> onclick="window.location.href = a + '/noti'"> None

        <c:if test="${not empty notifications}">
            <table>
                <tr>
                    <th></th>
                    <th>Title</th>
                    <th>Type</th>
                    <th>Insert date</th>
                    <th></th>
                </tr>
                <c:set var="index" value="${(empty param.startPage) ? 0 : (param.startPage-1)*10}"/>
                <c:forEach items="${notifications}" var="noti">
                    <tr>
                        <td>${index+1}
                            <c:set var="index" value="${index+1}"/>
                        </td>
                        <td>${noti.title}</td>
                        <td>
                            <c:if test="${noti.isSystemNotification}">
                                <font style="color: blue;">SYSTEM NOTIFICATION<font>
                            </c:if>
                            <c:if test="${!noti.isSystemNotification}">
                                Notification for <font style="color: blueviolet;">${noti.user.username}<font>
                            </c:if>
                        </td>
                        <td>${noti.insertDate}</td>
                        <td>
                            <form action="noti_view" method="GET">
                                <input type="hidden" name="id" value="${noti.id}">
                                <input type="hidden" name="oldUrl" value="<c:url value="noti">
                                           <c:if test="${not empty param.username}"><c:param name="username" value="${param.username}"/></c:if>
                                           <c:if test="${not empty param.startPage}"><c:param name="startPage" value="${param.startPage}"/></c:if>
                                           <c:if test="${not empty param.isFilter}"><c:param name="isFilter" value="${param.isFilter}"/></c:if>
                                           <c:if test="${not empty param.isSystemNotification}">
                                               <c:param name="isSystemNotification" value="${param.isSystemNotification}"/></c:if>
                                       </c:url>">
                                <button>View</button>
                            </form>
                            <form action="noti_delete" method="POST">
                                <input type="hidden" name="id" value="${noti.id}">
                                <input type="hidden" name="oldUrl" value="<c:url value="noti">
                                           <c:if test="${not empty param.username}"><c:param name="username" value="${param.username}"/></c:if>
                                           <c:if test="${not empty param.startPage}"><c:param name="startPage" value="${param.startPage}"/></c:if>
                                           <c:if test="${not empty param.isFilter}"><c:param name="isFilter" value="${param.isFilter}"/></c:if>
                                           <c:if test="${not empty param.isSystemNotification}">
                                               <c:param name="isSystemNotification" value="${param.isSystemNotification}"/></c:if>
                                       </c:url>">
                                <button onclick="return confirm('Are you sure?');">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div>
                Pages: 
                <c:forEach begin="1" end="${pageQuantity}" varStatus="counter">
                    <a href="
                       <c:url value="noti?startPage=${counter.index}">
                           <c:if test="${not empty param.username}"><c:param name="username" value="${param.username}"/></c:if>
                           <c:if test="${not empty param.isFilter}"><c:param name="isFilter" value="${param.isFilter}"/></c:if>
                           <c:if test="${not empty param.isSystemNotification}">
                               <c:param name="isSystemNotification" value="${param.isSystemNotification}"/></c:if>
                       </c:url>
                       ">${counter.index}</a>,
                </c:forEach>
            </div>
        </c:if>
        <c:if test="${empty notifications}">
            <br>
            <br>
            NOT FOUND
        </c:if>
    </body>
</html>
