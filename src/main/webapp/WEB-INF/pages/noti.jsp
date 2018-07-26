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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script>
            var a = "http://" + window.location.host + window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
        </script>
    </head>
    <body>
        <div class="container">
            <%@include file="header.jsp" %>
            <div class="container col-md-offset-4">
                <h1>Notification</h1></div>

            <div class="container">
                <form method="GET" action="noti" class="form-inline">
                    <div class="form-group">
                        <h3>Search by username</h3>
                        <input class="form-control" type="text" name="username" lass="form-control" placeholder="username">
                        <button class="btn btn-primary">Search</button>
                    </div>
                </form>
            </div>
            <div class="container form-inline" style="line-height: 5">
                <div class="radio"><input type="radio" <c:if test="${param.isSystemNotification == true}">checked="checked"</c:if> onclick="window.location.href = a + '/noti?isFilter=true&isSystemNotification=true'"> System</div>
                <div class="radio"><input type="radio" <c:if test="${param.isSystemNotification == false}">checked="checked"</c:if> onclick="window.location.href = a + '/noti?isFilter=true&isSystemNotification=false'"> User</div>
                <div class="radio"><input type="radio" <c:if test="${empty param.isSystemNotification}">checked="checked"</c:if> onclick="window.location.href = a + '/noti'"> None</div>
            </div>
            <c:if test="${not empty notifications}">
                <table class="table table-hover">
                    <tr>
                        <th></th>
                        <th>Title</th>
                        <th>Type</th>
                        <th>Insert date</th>
                        <th></th>
                        <th></th>
                    </tr>
                    <c:set var="index" value="${(empty param.startPage) ? 0 : (param.startPage-1)*10}"/>
                    <c:forEach items="${notifications}" var="noti">
                        <tr>
                            <th scope="row">${index+1}
                                <c:set var="index" value="${index+1}"/>
                            </th>
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
                                    <button class="btn btn-info">View</button>
                                </form>
                            </td><td>
                                <form action="noti_delete" method="POST">
                                    <input type="hidden" name="id" value="${noti.id}">
                                    <input type="hidden" name="oldUrl" value="<c:url value="noti">
                                               <c:if test="${not empty param.username}"><c:param name="username" value="${param.username}"/></c:if>
                                               <c:if test="${not empty param.startPage}"><c:param name="startPage" value="${param.startPage}"/></c:if>
                                               <c:if test="${not empty param.isFilter}"><c:param name="isFilter" value="${param.isFilter}"/></c:if>
                                               <c:if test="${not empty param.isSystemNotification}">
                                                   <c:param name="isSystemNotification" value="${param.isSystemNotification}"/></c:if>
                                           </c:url>">
                                    <button class="btn btn-danger" onclick="return confirm('Are you sure?');">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="container col-md-offset-4">
                    <ul class="pagination">
                        <c:forEach begin="1" end="${pageQuantity}" varStatus="counter">
                            <li><a href="
                                   <c:url value="noti?startPage=${counter.index}">
                                       <c:if test="${not empty param.username}"><c:param name="username" value="${param.username}"/></c:if>
                                       <c:if test="${not empty param.isFilter}"><c:param name="isFilter" value="${param.isFilter}"/></c:if>
                                       <c:if test="${not empty param.isSystemNotification}">
                                           <c:param name="isSystemNotification" value="${param.isSystemNotification}"/></c:if>
                                   </c:url>
                                   ">${counter.index}</a></li>
                            </c:forEach>
                    </ul>
                </div>
            </c:if>
            <c:if test="${empty notifications}">
                <br>
                <br>
                NOT FOUND
            </c:if>
        </div>
    </body>
</html>
