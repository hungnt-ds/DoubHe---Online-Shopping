<%-- 
    Document   : new-product
    Created on : Oct 25, 2023, 11:26:28 PM
    Author     : TANHUNG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Product</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <style>
            .error{
                color: red;
            }
        </style>
    </head>
    <body>
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
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="LogoutController">Log out</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="row justify-content-center">
            <div class="col-xl-5 col-md-8">
                <form action="MainController" method="POST" class="bg-white rounded shadow-5-strong p-5">
                    <!-- ID input -->
                    <div class="form-floating mb-4">
                        <input id="form1Example1" class="form-control" name="productID" placeholder="Product ID goes here">
                        <label class="form-label" for="form1Example1">Product ID</label>
                    </div>
                    <span class="error">
                        ${requestScope.PRODUCT_ERROR.productIDError} <br>
                    </span>

                    <!-- Name input -->
                    <div class="form-floating mb-4">
                        <input id="form1Example1" class="form-control" name="productName" placeholder="Product Name goes here">
                        <label class="form-label" for="form1Example1">Product Name</label>
                    </div>
                    <span class="error">
                        ${requestScope.PRODUCT_ERROR.productNameError} <br>
                    </span>

                    <!-- Image input -->
                    <div class="form-floating mb-4">
                        <input id="form1Example1" class="form-control" name="productImage" placeholder="Product Image goes here">
                        <label class="form-label" for="form1Example1">Product Image</label>
                    </div>

                    <!-- Price input -->
                    <div class="form-floating mb-4">
                        <input id="form1Example1" class="form-control" name="productPrice" type="number" min="1" placeholder="Product Price goes here">
                        <label class="form-label" for="form1Example1">Product Price</label>
                    </div>

                    <!-- Quantity input -->
                    <div class="form-floating mb-4">
                        <input id="form1Example1" class="form-control" name="productQuantity" type="number" min="1" placeholder="Product Quantity goes here">
                        <label class="form-label" for="form1Example1">Product Quantity</label>
                    </div>

                    <!-- Submit button -->
                    <div class="d-grid">
                        <button type="submit" name="action" value="NewProduct" class="btn btn-primary btn-block">Create</button>
                        <br>
                    </div>
                </form>
            </div>
        </div>
    </body>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</html>
