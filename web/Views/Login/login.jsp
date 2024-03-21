<%-- 
    Document   : login
    Created on : Mar 17, 2024, 6:11:59 PM
    Author     : Kelum
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <style>
            body {
                background-image: url('./images/login-bg.jpg');
                background-size: cover;
                background-position: center;
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(255, 255, 255, 0.1); /* Semi-transparent white overlay */
                backdrop-filter: blur(5px);
                z-index: -1; /* Place the overlay behind other content */
            }

            .login-container {
                max-width: 400px;
                margin: 100px auto;
                padding: 20px;
                background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
                backdrop-filter: blur(10px);
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .login-heading {
                text-align: center;
                margin-bottom: 20px;
            }

            .login-form input[type="text"],
            .login-form input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .login-form button {
                width: 100%;
                padding: 10px;
                background-color: #0056b3;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .login-form button:hover {
                background-color: #007bff;
                color:#000;
            }

            .login-form p {
                margin-top: 20px;
                text-align: center;
                color: #333;
            }

            .login-form a {
                color: #007bff;
                text-decoration: none;
            }

            .login-form a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="overlay"></div>
        <div class="login-container">
            <h2 class="login-heading">Login to Your Account</h2>
            <form class="login-form needs-validation" action="Login" method="post" novalidate>
                <jstl:if test="${sessionScope.isUser eq false}">
                    <div class="text-danger">Username or Password you entered is incorrect.</div>
                </jstl:if>
                <div class="mb-3">
                    <label for="username">Username</label><br>
                    <input type="text" class="form-control" name="username" id="username" placeholder="Email or Phone number" title="youremail@gmail.com or +94770000000" required/>
                </div>
                <div class="mb-3">
                    <label for="username">Password</label><br>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Your Password" title="y0urP@$$w0rd123456789#" required/>
                </div>
                <input type="hidden" id="page" name="page" value="signin">
                <button type="submit" class="btn btn-primary">Login</button>
            </form>

        </div>

        <script>
            (function () {
                'use strict';

                var forms = document.querySelectorAll('.needs-validation');

                Array.prototype.slice.call(forms)
                        .forEach(function (form) {
                            form.addEventListener('submit', function (event) {
                                if (!form.checkValidity()) {
                                    event.preventDefault();
                                    event.stopPropagation();
                                }

                                form.classList.add('was-validated');
                            }, false);
                        });
            })();


        </script>
    </body>
</html>
