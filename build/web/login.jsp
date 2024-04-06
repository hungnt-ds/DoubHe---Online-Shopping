<%-- 
    Document   : login
    Created on : Sep 19, 2023, 11:41:14 AM
    Author     : TANHUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="styleLogin.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <style>
            .error{
                color: red
            }
        </style>
    </head>
    <body class="container">
        <h1 class="text-center text-danger text-uppercase bg-dark p-3">hehe</h1>
        <!--Form and buttom for Login-->
        <div class="row justify-content-center">
            <div class="col-xl-5 col-md-8">
                <form action="MainController" method="POST" class="bg-white rounded shadow-5-strong p-5" id="recapcha">
                    <!-- UserID input -->
                    <div class="form-floating mb-4">
                        <input id="form1Example1" class="form-control" name="userID" placeholder="User ID goes here">
                        <label class="form-label" for="form1Example1">User ID</label>
                    </div>

                    <!-- Password input -->
                    <div class="form-floating mb-4">
                        <input id="form1Example1" class="form-control" name="password" type="password" placeholder="password goes here">
                        <label class="form-label" for="form1Example1">Password</label>
                    </div>
                    <div class="error">
                        ${requestScope.ERROR}    
                    </div>

                    <!-- Submit button -->
                    <div class="d-grid">
                        <!--submit-->
                        <button type="submit" name="action" value="Login" class="btn btn-primary btn-block">Sign in</button>
                        <br>
                    </div>
                    <div class="d-grid justify-content-center">
                        <!--recapcha-->
                        <div class="g-recaptcha " data-sitekey="6Les5NAoAAAAAElnTKeA5XF0ZE_CQ-SKtttWgu55"></div>
                        <div id="error" class="text-danger"></div>
                    </div>
                    <hr class="my-4">
                    <!--Login with Google-->
                    <div class="d-grid">
                        <a class="btn btn-lg btn-google btn-light btn-block text-uppercase btn-outline border-secondary" href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:8080/vidu_JSTL/GoogleHandler&response_type=code
                           &client_id=935097035178-0c6mb6t2p253unjeb5kbbdm0qp6u55er.apps.googleusercontent.com&approval_prompt=force">
                            <img src="https://img.icons8.com/color/16/000000/google-logo.png">
                            Continue with Google</a>
                        <br>
                    </div>


                    <div class="form d-flex justify-content-center">
                        <p>Not a member? <a href="MainController?action=Create_Page">Register</a></p>
                    </div>
                    <!--<div class="form d-flex justify-content-center">
                        <a href="MainController?action=Shopping_Page">Shopping</a>
                    </div>-->
                </form>
            </div>
        </div>
        <form action="MainController" method="POST">
            <input type="submit" name="action" value="InfoEmail" class="btn btn-outline-primary"/>
        </form>
    </body>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script>
        window.onload = function () {
            let isValid = false;
            const form = document.getElementById("recapcha");
            const error = document.getElementById("error");

            form.addEventListener("submit", function (event) {
                const response = grecaptcha.getResponse();
                if (!response) {
                    error.innerHTML = "Please complete the Captcha verification.";
                    event.preventDefault(); // khong cho gửi form
                }
            });
        }
    </script>

    <!--    <body>
            <form action="MainController" method="POST">
                <div class="g-recaptcha" data-sitekey="6Les5NAoAAAAAElnTKeA5XF0ZE_CQ-SKtttWgu55"></div>
                User ID <input type="text" name="userID" required=""/> <br>
                Password <input type="password" name="password" required="" /> <br>
                <input type="submit" name="action" value="Login"/>
                <input type="reset" value="Reset"/>
            </form>
    <%--<%
       String error = (String) request.getAttribute("ERROR");
       if (error == null) {
           error = "";
       }
    %>
    <%=error%>--%>
    <%--${requestScope.ERROR}       
    </body>--%>
    
    </html>-->
</html>