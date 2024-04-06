<%-- 
    Document   : create
    Created on : Sep 29, 2023, 11:30:58 AM
    Author     : TANHUNG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Create Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--        <link rel="stylesheet" type="text/css" href="style.css">-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <style>
        .error{
            color: red
        }
    </style>
    <body style="background-color: #d1d1d1cc">
        <div class="row justify-content-center">
            <c:set var="userError" value="${requestScope.USER_ERROR}" />
            <div class="col-xl-5 col-md-7">
                <br> 

                <form action="MainController" method="POST" class="bg-white rounded shadow-6-strong p-6" style="padding: 24px 48px 48px 48px">
                    <!-- Email input -->
                    <h3>Sign Up</h3>
                    <div class="form-floating mb-4">
                        <input id="form1Example1" class="form-control" name="userID" placeholder="User ID goes here">
                        <label class="form-label" for="form1Example1">User ID</label>
                    </div>
                    <span class="error">
                        ${requestScope.USER_ERROR.userIDError} <br>
                    </span>

                    <div class="form-floating mb-4">
                        <input id="form1Example1" class="form-control" name="fullName" placeholder="User ID goes here">
                        <label class="form-label" for="form1Example1">Full Name</label>
                    </div>
                    <span class="error">
                        ${requestScope.USER_ERROR.fullNameError} <br>
                    </span>

                    <div class="form-floating mb-4">
                        <input id="form1Example1" class="form-control" name="roleID" type="text" name="roleID" value="US" required="" readonly="" placeholder="User ID goes here">
                        <label class="form-label" for="form1Example1">Role ID</label>
                    </div>


                    <!-- Password input -->
                    <div class="form-floating mb-4">
                        <input id="form1Example1" class="form-control" name="password" type="password" placeholder="password goes here">
                        <label class="form-label" for="form1Example1">Password</label>
                    </div>

                    <div class="form-floating mb-4">
                        <input id="form1Example1" class="form-control" name="confirm" type="password" placeholder="password goes here">
                        <label class="form-label" for="form1Example1">Confirm Password</label>
                    </div>
                    <span class="error">
                        ${requestScope.USER_ERROR.confirmError} <br>
                    </span>



                    <!-- Submit button -->

                    <div class="d-grid">
                        <button type="submit" name="action" value="Create" class="btn btn-primary btn-block">Sign up</button>
                        <br>
                    </div>

                </form>
            </div>
        </div>



        <%--<div class="center">
        <%--% <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
        %>
        <c:set var="userError" value="${requestScope.USER_ERROR}" />
        <h3>Create new user</h3>
        <form action="MainController" method="POST">
            <label for="username">User ID</label> 
            <input type="text" name="userID" required=""/> <br>
            <span class="error">
                ${requestScope.USER_ERROR.userIDError}
            </span>               
            <label for="username">Full name</label> 
            <input type="text" name="fullName" required=""/> <br>
            <span class="error">
                ${requestScope.USER_ERROR.fullNameError}
            </span>

                <label for="username">Role ID</label>
                <input type="text" name="roleID" value="US" required="" readonly=""/> <br>

                <label for="username">Password</label>
                <input type="password" name="password" required=""/> <br>

                <label for="username">Confirm</label>
                <input type="password" name="confirm" required=""/> <br>
                <span class="error">
                    ${requestScope.USER_ERROR.confirmError}
                </span>

                <input type="submit" name="action" value="Create"/>
                <input type="reset" value="Reset"/> <br>
            </form>
            <span class="error">
                ${requestScope.USER_ERROR.error}
        <%--<%= userError.getError()%>--%>
    </span>

</body>
</html>
