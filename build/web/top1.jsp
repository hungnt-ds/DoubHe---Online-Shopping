<%-- 
    Document   : top1
    Created on : Oct 31, 2023, 10:28:41 AM
    Author     : TANHUNG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Role ID</th>
                    <th>Password</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
            <c:set var="count" value="1"/>
            <c:forEach var="user" varStatus="couter" items="${requestScope.LIST_USER}">
                <form action="MainController" method="POST">
                    <tr>
                        <td>${count}</td>
                        <td>
                            <input type="text" name="userID" value="${user.userID}" readonly="" class="form-control">
                        </td>
                        <td>
                            <input type="text" name="fullName" value="${user.fullName}" required="" class="form-control">
                        </td>
                        <td>
                            <select class="form-select" id="sel1" name="roleID">
                                <option value="${user.roleID}">${user.roleID}</option>
                                <c:if test="${user.roleID eq 'US'}">
                                    <option value="AD">AD</option>
                                </c:if>
                                <c:if test="${user.roleID eq 'AD'}">
                                    <option value="US">US</option>
                                </c:if>
                            </select>
                        </td>
                        <td>${user.password}</td>
                        <td>
                            <input type="submit" name="action" value="Update" class="btn btn-outline-primary"/>
                            <input type="hidden" name="search" value="${param.search}"/>
                        </td>
                        <td>
                    <c:url var="delete" value="MainController">
                        <c:param name="action" value="Delete"></c:param>
                        <c:param name="userID" value="${user.userID}"></c:param>
                        <c:param name="search" value="${param.search}"></c:param>
                    </c:url>
                    <a href="${delete}">Delete</a>
                    </td>
                    </tr>
                </form>
                <c:set var="count" value="${count + 1}"/>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
