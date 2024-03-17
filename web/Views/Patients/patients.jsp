<%-- 
    Document   : patients
    Created on : Mar 17, 2024, 6:13:41 PM
    Author     : Kelum
--%>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="wrapper" style="width:100%;margin:0 auto;">

    &nbsp;  &nbsp;<button type="button" id="modal-add-patients" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-popup-window" data-test-id=""><i class="fa-solid fa-user-plus"></i>&nbsp; New</button>

    <div class="container"> 
        <table border="1" id="abc_table" class="display" style="width:100%">
            <thead>
                <tr> 
                    <th>ID</th>  
                    <th>First Name</th> 
                    <th>Last Name</th> 
                    <th>Gender</th> 
                    <th>Age</th> 
                    <th>Address</th> 
                    <th>Email</th> 
                    <th>Telephone</th> 
                    <th>Password Status</th> 
                    <th>Edit</th>
                        <jstl:if test="${'admn' eq sessionScope.authType}">
                        <th>Delete</th>
                        </jstl:if>
                </tr>
            </thead>

            <tbody>
                <jstl:forEach var="patient" items="${patientsList}" >
                    <tr>
                        <td> ${patient.patient_id} </td>
                        <td> ${patient.first_name}</td>
                        <td> ${patient.last_name}</td>
                        <td> ${patient.gender} </td>
                        <td> ${patient.age} </td>
                        <td> ${patient.address} </td>
                        <td> ${patient.email} </td>
                        <td> ${patient.phone_number} </td>
                        <td> ${patient.password_status} </td>
                        <td><button type="button" id="modal-edit-patients" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#modal-popup-window" data-test-id="${patient.patient_id}"><i class="fa-solid fa-user-pen"></i></button></td>

                        <jstl:if test="${'admn' eq sessionScope.authType}">
                            <td><button type="button" id="modal-delete-patients" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modal-popup-window" data-test-id="${patient.patient_id}"><i class="fa-solid fa-user-minus"></i></button></td>
                        </jstl:if>

                    </tr>
                </jstl:forEach>
            </tbody>
        </table>
    </div>

</div> 
