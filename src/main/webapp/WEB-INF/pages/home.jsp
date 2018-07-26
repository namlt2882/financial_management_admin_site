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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <script>
        function myFunction() {
            // Declare variables 
            var input, filter, table, tr, td, i;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");

            // Loop through all table rows, and hide those who don't match the search query
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
    <body style="padding: 50">
        <div class="container">
        <%@include file="header.jsp" %>


        
            <div class="col-md-4 col-md-offset-4">
            <form action="home" method="GET" class="form-inline">
                <div class="form-group">
                <h3>Search by username</h3>
                <input type="text" name="username" class="form-control"/>
                <button type="submit" class="btn btn-primary" value="Search">Search</button>
                            </div>
            </form>
            </div>
            
            <c:if test="${not empty users}">
                <div class="col-md-5 col-md-offset-1">
                <c:if test="${empty param.username}">
                    <h3>Current user: ${numberOfUser}</h3>
                </c:if>
                </div>
                <br/>
                <table class="table table-hover" id="myTable">
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
                        <c:forEach items="${users}" var="user">
                            <tr>
                                <th scope="row">${index+1}
                                    <c:set var="index" value="${index+1}"/>
                                </th>
                                <td>${user.username}</td>
                                <td>${user.firstName}</td>
                                <td>${user.lastName}</td>
                                <td>${user.insertDate}</td>
                                <td>
                                    ${user.status == 1?"<font style='color:green'>ENABLE</font>":"<font style='color:red'>DISABLE</font>"}
                                </td>
                                <td>
                                    <c:if test="${user.status==1}">
                                        <form action="noti_add">
                                            <input type="hidden" name="username" value="${user.username}">
                                            <button type="submit" class="btn btn-primary">Send notification</button>
                                        </form><br/>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>

                    </c:if>
                </table>
                <div class="container col-md-offset-4">  
                    <c:if test="${empty param.username}">
                        <ul class="pagination">
                            <c:forEach begin="1" end="${pageQuantity}" varStatus="counter">
                                <li><a href="home?startPage=${counter.index}">${counter.index}</a></li>
                                </c:forEach>
                        </ul>
                    </c:if>
                </div>
            </c:if>

        </div>


    </body>
</html>
