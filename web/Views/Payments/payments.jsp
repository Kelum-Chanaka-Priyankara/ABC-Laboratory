<%-- 
    Document   : payments
    Created on : Mar 17, 2024, 6:15:22 PM
    Author     : Kelum
--%>


<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="wrapper" style="width:100%;margin:0 auto;">
    <br/><!-- comment -->
    <div class="container">   
        <table border="1" id="abc_table" class="display" style="width:100%">
            <thead>
                <tr> 
                    <th>Payment ID</th>  
                    <th>Appointment ID</th> 
                    <th>Test</th> 
                    <th>Charges</th> 
                    <th>Payment Method</th> 
                    <th>Status</th> 
                    <th>Edit</th>
                </tr>
            </thead>

            <tbody>
                <jstl:forEach var="items" items="${paymentsList}" >
                    <tr>
                        <td> ${items.payment_id} </td>
                        <td> ${items.appointment_id} </td>
                        <td> ${items.test_name} </td>
                        <td> ${items.charges} </td>
                        <td> ${items.payment_method} </td>
                        <td> ${items.payment_status} </td>
                        <td><button type="button" id="modal-edit-payments" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#modal-popup-window" data-test-id="${items.payment_id}"><i class="fa-solid fa-file-pen"></i></button></td>
                    </tr>
                </jstl:forEach>
            </tbody>
        </table>
    </div>

</div> 
