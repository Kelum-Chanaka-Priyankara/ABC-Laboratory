<%-- 
    Document   : users
    Created on : Mar 17, 2024, 6:18:48 PM
    Author     : Kelum
--%>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="wrapper" style="width:100%;margin:0 auto;">
    &nbsp;  &nbsp;<button type="button" id="modal-add-users" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-popup-window" data-test-id=""><i class="fa-solid fa-user-plus"></i>&nbsp; New</button>
    <div class="container"> 
        <table border="1" id="abc_table" class="display" style="width:100%">
            <thead>
                <tr>  
                    <th>ID</th>
                    <th>First Name</th> 
                    <th>Last Name</th> 
                    <th>Gender </th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>Telephone</th>
                    <th>Role</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>

            </thead>

            <tbody>

                <jstl:forEach var="user" items="${usersList}">           
                    <tr>    
                        <td>${user.user_id}</td>
                        <td>${user.first_name}</td>
                        <td>${user.last_name}</td>
                        <td>${user.gender}</td>
                        <td>${user.address}</td>
                        <td>${user.email}</td>
                        <td>${user.phone_number}</td>
                        <td>${user.role}</td>
                        <td><button type="button" id="modal-edit-users" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#modal-popup-window" data-test-id="${user.user_id}"><i class="fa-solid fa-user-pen"></i></button></td>
                        <td><button type="button" id="modal-delete-users" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modal-popup-window" data-test-id="${user.user_id}"><i class="fa-solid fa-user-minus"></i></button></td>
                    </tr>
                </jstl:forEach>

            </tbody>
        </table>
    </div>

</div> 