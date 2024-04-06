<%-- 
    Document   : admin
    Created on : Sep 19, 2023, 11:41:48 AM
    Author     : TANHUNG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body class="">  
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="HomeController">Hehe Shop</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <c:if test="${sessionScope.LOGIN_USER.roleID eq 'AD'}">
                            <li class="nav-item"><a class="nav-link" href="admin.jsp">Manage User</a></li>
                            <li class="nav-item"><a class="nav-link" href="ManageProductController">Manage Product</a></li>
                            </c:if>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="email-form.jsp">Contact to</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="LogoutController">Log out</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Welcome: ${sessionScope.LOGIN_USER.fullName}</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5" style="min-height: 500px">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="d-flex justify-content-center">
                    <form action="MainController" method="POST" class="input-group w-auto">
                        <input type="text" name="search" value="${param.search}" class="form-control"/>
                        <input type="submit" name="action" value="Search" class="btn btn-primary" placeholder="Search name of user here"/>
                    </form>
                </div>
                <br>

                <c:if test="${requestScope.LIST_USER != null}">
                    <c:if test="${not empty requestScope.LIST_USER}">
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
                        ${requestScope.ERROR}
                    </c:if>
                </c:if>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
