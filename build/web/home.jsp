<%-- 
    Document   : home
    Created on : Oct 16, 2023, 6:56:04 PM
    Author     : TANHUNG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.shopping.Product"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- Core theme CSS (includes Bootstrap)-->
        <!--<link href="css/styles.css" rel="stylesheet" />-->
        <style>
            .image-container {
                max-width: 450px;
                max-height: 300px;
            }
            img {
                width: 450px;
                height: 300px;
            }
        </style>
    </head>
    <body>
        <%--<c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>
        <%--<c:if test="$(empty requestScope.LIST_PRODUCT}">
        <%-- If the data is empty, redirect to the ManageController servlet
        <c:redirect url="HomeController" />
    </c:if>--%>
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
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="LogoutController">Log out</a></li>
                    </ul>
                    <!--Only User can see Cart Page-->
                    <c:if test="${sessionScope.LOGIN_USER.roleID eq 'US'}">
                        <form action="MainController" method="POST" class="d-flex">
                            <button class="btn btn-outline-dark" type="submit" name="action" value="View">
                                <i class="bi-cart-fill me-1"></i>
                                View
                                <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                            </button>
                        </form>
                    </c:if>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Welcome ${sessionScope.LOGIN_USER.fullName}</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <form action="MainController" method="POST" class="input-group w-auto container">
                <input type="text" name="search" value="${param.search}" class="form-control"/>
                <input type="submit" name="action" value="SearchProduct" class="btn btn-primary" placeholder="Search name of user here"/>
            </form>
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:if test="${not empty requestScope.LIST_PRODUCT}">
                        <c:forEach var="product" items="${requestScope.LIST_PRODUCT}">
                            <c:if test="${product.quantity > 0}">
                                <div class="col mb-5">
                                    <form action="MainController" method="POST">
                                        <div class="card h-100">
                                            <!-- Product image-->
                                            <div class="image-container">
                                                <img class="card-img-top" 
                                                     name="product-img" 
                                                     src="${product.image}" alt="..."  
                                                     style= "width: 100% ; max-height: 100%;" />
                                                <!--<img src="${product.image}" class="img-fluid rounded-3" style="width: 450px; height: 300px"/>-->
                                            </div>
                                            <!-- Product details-->
                                            <div class="card-body p-4">
                                                <div class="text-center">
                                                    <!-- Product name-->
                                                    <h5 class="fw-bolder" name="product-name">${product.name}</h5>
                                                    <div style="display: none;" name="product-id">
                                                        ${product.id}
                                                    </div>
                                                    <!--<input class="w-25" type="number" name="quantity" value="1" min="1" required=""/>-->
                                                    <!-- Product price-->
                                                    <br>
                                                    <div name="product-price">
                                                        ${product.price} $
                                                    </div>

                                                </div>
                                            </div>

                                            <!-- Product actions-->
                                            <c:if test="${sessionScope.LOGIN_USER.roleID eq 'US'}">
                                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="MainController?action=AddToCart&id=${product.id}">Add to card</a></div>
                                            </div>
                                            </c:if>
                                        </div>
                                    </form>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </div>
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

