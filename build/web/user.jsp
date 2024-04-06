<%-- 
    Document   : user
    Created on : Sep 19, 2023, 11:41:27 AM
    Author     : TANHUNG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <!--Phân quyền để tránh đăng nhập trực tiếp bằng link /user.jsp mà không cần nhập tài khoản mật khẩu-->
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}"> 
            <c:redirect url="login.html"></c:redirect>
        </c:if>
        <h1>tui la user ne`</h1>
        User ID: ${sessionScope.LOGIN_USER.userID} <br>
        Full Name: ${sessionScope.LOGIN_USER.fullName} <br>
        Role ID: ${sessionScope.LOGIN_USER.roleID} <br>
        Password: *** <br>
        <image src="https://a.wattpad.com/useravatar/kimjally.256.679772.jpg" alt="thanh cong rui`"/>
    </body>
</html>
