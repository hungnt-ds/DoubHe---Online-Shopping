<%-- 
    Document   : admin-new
    Created on : Oct 21, 2023, 4:57:09 PM
    Author     : TANHUNG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin Page</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- Core theme CSS (includes Bootstrap)-->
        <!--<link href="css/styles.css" rel="stylesheet" />-->
    </head>
    <body>
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

                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Admin-new</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Edit</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" varStatus="couter" items="${requestScope.LIST_PRODUCT}">
                        <form action="MainController" method="POST">
                            <td>
                                <input type="text" name="productId" value="${product.id}" readonly="" class="form-control">
                            </td>
                            <td>
                                <input type="text" name="productName" value="${product.name}" required="" class="form-control">
                            </td>
                            <td>
                                <input type="text" name="productImage" value="${product.image}" required="" class="form-control">
                            </td>
                            <td>
                                <input type="text" name="productPrice" value="${product.price}" required="" class="form-control">
                            </td>
                            <td>
                                <input type="text" name="productQuantity" value="${product.quantity}" required="" class="form-control">
                            </td>
                            <td>
                                <input type="submit" name="action" value="UpdateProduct" class="btn btn-outline-primary"/>
                                <input type="hidden" name="search" value="${param.search}"/>
                            </td>
                            <td>
                                <c:url var="delete" value="MainController">
                                    <c:param name="action" value="Delete"></c:param>
                                    <c:param name="productID" value="${user.userID}"></c:param>
                                    <c:param name="search" value="${param.search}"></c:param>
                                </c:url>
                                <a href="${delete}">Delete</a>
                            </td>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
                <a class="btn btn-outline-dark mt-auto" href="new-product.jsp">New Product</a>
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
