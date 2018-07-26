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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <%@include file="header.jsp" %>
            <div class="container col-md-offset-4"><h1>Send notification</h1>            </div>  

            <div class="col-md-8 col-md-offset-2">   
            <form action="noti_add" method="POST">
                 <div class="panel-heading"><h4>For : <c:if test="${not empty param.username}">
                    <input type="hidden" name="username" value="${user.username}">
                    ${user.username}
                    (<font style="color: blue">
                    <c:out value="${user.lastName} ${user.firstName}"></c:out>
                        </font>)
                </c:if>
                <c:if test="${empty param.username}">
                    <font style="color: blue">USERS OF SYSTEM</font>
                </c:if></h4></div>
                <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" class="form-control " id="title" name="title">
                </div>
                <div class="form-group">
                    <label for="content">Content</label>
                    <textarea class="form-control" rows="5" id="comment" name="content"></textarea>
                </div>
                <Button class="btn btn-success" type="submit" value="Send" onclick="return confirm('Are you sure?');">Send</button>
                <table> <tr>
                        <td></td>
                        <td></td>
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
            </div>
        </div>
    </body>
</html>
