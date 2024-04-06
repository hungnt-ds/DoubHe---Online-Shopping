<%-- 
    Document   : shopping
    Created on : Oct 6, 2023, 10:48:08 AM
    Author     : TANHUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ngoc's Shopping.jsp</title>
    </head>
    <body>
        <h3>The way to luxury</h3>
        <form action="MainController" method="POST">
            <select name="cmbClothes">
                <option value="C001-T shirt-250">C001 - T shirt - 250</option>
                <option value="C002-Autumn jacket-350">C001 - Autumn jacket - 350</option>
                <option value="C003-Short Jeans-400">C001 - Short Jeans - 400</option>
                <option value="C004-Halloween Dress-550">C001 - Halloween Dress - 550</option>
            </select>
            <select name="cmbQuantity">
                <option value="1">1 item</option>
                <option value="2">2 items</option>
                <option value="3">3 items</option>
                <option value="4">4 items</option>
                <option value="5">5 items</option>

            </select>
            <input type="submit" name="action" value="AddToCart"/>
            <input type="submit" name="action" value="View"/>
        </form>
        <%-- <%<%
            String message = (String) request.getAttribute("MESSAGE");
            if (message == null) {
                message = "";
            }
        %>
        <%= message%>--%>
        ${requestScope.MESSAGE}
    </body>
</html>
