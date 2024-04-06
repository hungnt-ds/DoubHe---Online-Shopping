<%-- 
    Document   : viewCart
    Created on : Oct 6, 2023, 10:56:22 AM
    Author     : TANHUNG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.shopping.Cart"%>
<%@page import="java.util.Map"%>
<%@page import="sample.shopping.Clothes"%>
<%@page import="sample.shopping.Clothes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Cart</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="HomeController">Hehe Shop</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="HomeController">Home</a></li>
                            <c:if test="${sessionScope.LOGIN_USER.roleID eq 'AD'}">
                            <li class="nav-item"><a class="nav-link" href="admin.jsp">Manage User</a></li>
                            <li class="nav-item"><a class="nav-link" href="ManageProductController">Manage Product</a></li>
                            </c:if>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="LogoutController">Log out</a></li>
                    </ul>
                    <form action="MainController" method="POST" class="d-flex">
                        <button class="btn btn-outline-dark" type="submit" name="action" value="View">
                            <i class="bi-cart-fill me-1"></i>
                            View
                            <span class="badge bg-dark text-white ms-1 rounded-pill"><i class="fa fa-shopping-cart"></i></span>
                        </button>
                    </form>

                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Shop in style</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                </div>
            </div>
        </header>
        <section class="h-100" style="background-color: #eee;">
            <div class="container h-100 py-5">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-10">


                        <section style="background-color: #eee">
                            <div class="d-flex justify-content-between align-items-center mb-4 container">
                                <h3 class="fw-normal mb-0 text-black">Shopping Cart</h3>
                            </div>

                            <c:if test="${not empty sessionScope.CART}">
                                <div style="background-color: #eee;">
                                    <table class="table align-middle mb-0 bg-white container table-hover rounded" style="border-spacing: 0;
                                           border-collapse: separate;
                                           border-radius: 10px;
                                           padding: 0px">
                                        <colgroup>
                                            <col span="1">
                                            <col span="1" style="visibility: collapse">
                                            <col span="4">
                                        </colgroup>
                                        <thead class="bg-light">
                                            <tr>
                                                <th>No</th>
                                                <th>ID</th>
                                                <th>Image</th>
                                                <th>Name</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Total</th>
                                                <th>Edit</th>
                                                <th>Remove</th>
                                            </tr>
                                        </thead>
                                </div>
                                <div class="col-10">
                                    <tbody>
                                        <c:set var="count" value="1"/>
                                        <c:set var="total" value="0"/>
                                        <c:forEach items="${sessionScope.CART.cart}" var="entry">
                                            <c:set var="product" value="${entry.value}"/>
                                            <c:set var="itemTotal" value="${product.price * product.quantity}"/>
                                        <form action="MainController" method="POST" class="row">
                                            <tr class="col-lg-1">
                                            <div class="d-flex align-items-center">
                                                <td>${count}</td>
                                            </div>
                                            <td class="col-lg-1">
                                                <input id="form1" min="0" name="id" 
                                                       value="${product.id}" type="text" readonly=""
                                                       class="form-control form-control-sm text-center"/>
                                            </td>
                                            <td class="col-md-2 col-lg-2 col-xl-2">
                                                <img src="${product.image}" class="img-fluid rounded-3" style="width: 100px; height: 100px"/>
                                            </td>
                                            <td class="col-lg-3">${product.name}</td>
                                            <td class="col-lg-1">${product.price}</td>
                                            <td class="col-lg-1">
                                                <input id="form1" min="1" name="quantity" value="${product.quantity}" type="number"
                                                       class="form-control form-control-sm text-center"/>
                                            </td>
                                            <td class="col-lg-1">${itemTotal}</td>
                                            <!--edit-->
                                            <td class="col-lg-1">
                                                <button type="submit" name="action" value="Edit" class="btn btn-outline-dark"><i class="fa fa-save"></i></button>
                                                <a href="MainController?action=Edit"></a>
                                            </td>
                                            <!--remove-->
                                            <td class="col-lg-1">
                                                <button type="submit" name="action" value="Remove" class="btn btn-outline-dark"><i class="fa fa-trash"></i></button>
                                            </td>
                                            </tr>
                                        </form>
                                        <c:set var="count" value="${count + 1}"/>
                                        <c:set var="total" value="${total + itemTotal}"/>
                                    </c:forEach>
                                    </tbody>
                                </div>
                                </table>
                        </div>

                        <h1 class="container">Total: ${total}</h1>

                    </c:if>
                    <div class="card">
                        <div class="card-body">

                            <form action="MainController" method="POST" class="bg-white rounded shadow-5-strong p-5">
                                <!-- Password input -->
                                <div class="form-floating mb-4">
                                    <input id="form1Example1" class="form-control" name="phone" type="text" placeholder="password goes here">
                                    <label class="form-label" for="form1Example1">Phone</label>
                                </div>

                                <!-- Password input -->
                                <div class="form-floating mb-4">
                                    <input id="form1Example1" class="form-control" name="address" type="text" placeholder="password goes here">
                                    <label class="form-label" for="form1Example1">Address</label>
                                </div>
                                <span class="error">
                                    ${requestScope.USER_ERROR.error} <br>
                                </span>

                                <!-- Submit button -->
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-warning btn-block btn-lg" 
                                            name="action" value="CheckOut">Proceed to Pay</button>
                                    <br>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--<a href="shopping.html">Add more</a>-->
</section>
</body>
</html>
