<%-- 
    Document   : home
    Created on : Mar 17, 2024, 6:11:05 PM
    Author     : Kelum
--%>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1" charset="utf-8" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
        <link href="data_tables/datatables.min.css" rel="stylesheet" type="text/css"/> 

        <style>

            body{
                background-color: #e9eeff;
                /*background-color: #f8f9fa;*/
            }
            
            .btn{
                width:80px;
            }
            .bg-primary {
                background-color: #063970 !important;
            }

            .btn-primary {
                background-color: #063970 !important;
            }

            .btn-group input[type="radio"].btn-check:checked + label.btn {
                background-color: #063970;
                color: #fff;
            }

            .top-bar {
                height: 60px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 0 20px;
            }
            #clock {
                color: #a5e3ff;
                right: 10px;
                text-align: center;
                flex-grow: 1;
                font-size: small;
            }
            .logout-btn {
                cursor: pointer;
                color: #a5e3ff;
                font-weight: bold;
            }

            .logout-btn:hover {
                cursor: pointer;
                color: #fff;
                font-weight: bold;
            }

            .side-nav {
                z-index: 1000;
                height: 100%;
                width: 250px;
                position: fixed;
                top: 0;
                left: -250px;
                background-color: #f8f9fa;
                overflow-x: hidden;
                transition: 0.7s;
                padding-top: 60px;
            }

            .side-nav a {
                padding: 10px 15px;
                text-decoration: none;
                color: #a5e3ff;
                display: block;
            }

            .side-nav a:hover {
                background-color: #d3dcfb;
                color:#063970;
                transition: 0.5s;
            }

            .side-nav a.active {
                background-color: #d3dcfb !important;
                color:#063970;
            }

            .side-nav-bottom {
                position: absolute;
                bottom: 20px;
                left: 20px;
                color: #a5e3ff;
                font-size: small;
            }

            .main-content {
                margin-left: 250px;
                transition: margin-left 0.5s;
                padding: 20px;
            }

            .toggle-btn {
                display: none;
                position: fixed;
                top: 10px;
                left: 10px;
                z-index: 1000;
            }

            @media (max-width: 768px) {
                .side-nav {
                    left: -250px;
                }

                .main-content {
                    margin-left: 0;
                }

                .toggle-btn {
                    display: block;
                }
            }
        </style>
        <title>ABC Laboratory</title>
    </head>

    <body>

        <div id="navigation-section">
            <jsp:include page="navigation_bar.jsp" />
        </div>

        <div class="main-content">
            <div id="content">
                <!-- Main Content -->
            </div>
        </div>

        <div id="modal-section">
            <div class="modal fade" id="modal-popup-window" tabindex="-1" aria-labelledby="abcModalLabel" aria-hidden="true" data-bs-backdrop="static">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modal-title-label"> </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form id="modal-form" method="" action="" class="needs-validation" novalidate>
                            <div class="modal-body" id="modal-body">


                                <!-- Modal Content -->
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" id="modal-hidden" name="action" value="">
                                <button type="submit" class="btn btn-primary" data-bs-dismiss="modal" id="modal-button"></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <div id="script-section">
            <jsp:include page="scripts.jsp" />
        </div>



    </body>
</html>