<%-- 
    Document   : email-form
    Created on : Oct 27, 2023, 7:49:14 PM
    Author     : TANHUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Send Email</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>
    <body class="container">
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
        <form action="MainController" method="post">
            <!-- Name input -->
            <div class="form-outline mb-4">
                <input type="email" id="form4Example1" class="form-control" name="to" required=""/>
                <label class="form-label" for="form4Example1">To</label>
            </div>

            <!-- Email input -->
            <div class="form-outline mb-4">
                <input type="text" id="form4Example2" class="form-control" name="subject" required=""/>
                <label class="form-label" for="form4Example2">Subject</label>
            </div>

            <!-- Message input -->
            <div class="form-outline mb-4">
                <textarea class="form-control" id="form4Example3" rows="4" name="content"></textarea>
                <label class="form-label" for="form4Example3">Message</label>
            </div>

            <!-- Checkbox -->
            <!-- Submit button -->
            <button type="submit" name="action" value="SendEmail" class="btn btn-primary btn-block mb-4">Send</button>
        </form>
        <!--        <form action="MainController" method="post">
                    <label for="to">To: </label>
                    <input type="text" id="to" name="to" required><br><br>
        
                    <label for="subject">Subject: </label>
                    <input type="text" id="subject" name="subject" required><br><br>
        
                    <label for="subject"></label>
                    <input type="text" id="subject" name="subject" required><br><br>
        
                    <label for="message">Nội dung gửi:</label>
                    <textarea id="message" name="content" rows="4" cols="50" required></textarea><br><br>
        
                    <input type="submit" name="action" value="SendEmail">
                </form>-->
    </body>
</html>
